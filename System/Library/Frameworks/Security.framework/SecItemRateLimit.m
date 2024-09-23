@implementation SecItemRateLimit

+ (id)instance
{
  if (instance_onceToken != -1)
    dispatch_once(&instance_onceToken, &__block_literal_global_7300);
  return (id)ratelimit;
}

- (BOOL)isReadOnlyAPICallWithinLimits
{
  BOOL v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = -[SecItemRateLimit consumeTokenFromBucket:](self, "consumeTokenFromBucket:", 0);
  if (!v2)
  {
    secLogObjForScope("secitemratelimit");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "Readonly API rate exceeded", v5, 2u);
    }

  }
  return v2;
}

- (BOOL)consumeTokenFromBucket:(BOOL)a3
{
  NSObject *dataQueue;
  BOOL v6;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!-[SecItemRateLimit shouldCountAPICalls](self, "shouldCountAPICalls") && !self->_forceEnabled)
    return 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SecItemRateLimit_consumeTokenFromBucket___block_invoke;
  block[3] = &unk_1E1FD5278;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(dataQueue, block);
  v6 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)shouldCountAPICalls
{
  if (shouldCountAPICalls_shouldCountToken != -1)
    dispatch_once(&shouldCountAPICalls_shouldCountToken, &__block_literal_global_6);
  return shouldCountAPICalls_shouldCount;
}

void __28__SecItemRateLimit_instance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)ratelimit;
  ratelimit = v0;

}

- (SecItemRateLimit)init
{
  SecItemRateLimit *v2;
  SecItemRateLimit *v3;
  NSDate *roBucket;
  NSDate *rwBucket;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dataQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SecItemRateLimit;
  v2 = -[SecItemRateLimit init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_roCapacity = 0x1900000019;
    *(_OWORD *)&v2->_roRate = xmmword_18AA61B30;
    roBucket = v2->_roBucket;
    v2->_roBucket = 0;

    rwBucket = v3->_rwBucket;
    v3->_rwBucket = 0;

    v3->_forceEnabled = 0;
    v3->_limitMultiplier = 5.0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.keychain.secitemratelimit.dataqueue", v6);
    dataQueue = v3->_dataQueue;
    v3->_dataQueue = (OS_dispatch_queue *)v7;

  }
  return v3;
}

- (BOOL)isModifyingAPICallWithinLimits
{
  BOOL v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = -[SecItemRateLimit consumeTokenFromBucket:](self, "consumeTokenFromBucket:", 1);
  if (!v2)
  {
    secLogObjForScope("secitemratelimit");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "Modifying API rate exceeded", v5, 2u);
    }

  }
  return v2;
}

void __39__SecItemRateLimit_shouldCountAPICalls__block_invoke()
{
  NSObject *v0;
  const char *v1;
  SecTaskRef v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((os_variant_allows_internal_security_policies() & 1) != 0)
  {
    if (gSecurityd)
    {
      secLogObjForScope("secitemratelimit");
      v0 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v5) = 0;
        v1 = "gSecurityd non-nil, disabling SIRL for testing";
LABEL_7:
        _os_log_impl(&dword_18A900000, v0, OS_LOG_TYPE_DEFAULT, v1, (uint8_t *)&v5, 2u);
      }
    }
    else
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        secLogObjForScope("secitemratelimit");
        v0 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
          goto LABEL_8;
        LOWORD(v5) = 0;
        v1 = "SIRL disabled via feature flag";
        goto LABEL_7;
      }
      v2 = SecTaskCreateFromSelf(0);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E1FFEE78);
      v0 = objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        v5 = 0;
        csops_task((uint64_t)v2);
        secLogObjForScope("secitemratelimit");
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v5) = 0;
          _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "Not valid/debugged platform binary, disabling SIRL", (uint8_t *)&v5, 2u);
        }

        CFRelease(v2);
      }
      else
      {
        secLogObjForScope("SecError");
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v5) = 0;
          _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "secitemratelimit: unable to get task from self, disabling SIRL", (uint8_t *)&v5, 2u);
        }

      }
    }
  }
  else
  {
    secLogObjForScope("secitemratelimit");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      v1 = "Not internal release, disabling SIRL";
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (BOOL)isEnabled
{
  return self->_forceEnabled || -[SecItemRateLimit shouldCountAPICalls](self, "shouldCountAPICalls");
}

- (void)forceEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  self->_forceEnabled = a3;
  secLogObjForScope("secitemratelimit");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v6 = "F";
    else
      v6 = "Not f";
    v7 = 136315394;
    v8 = v6;
    v9 = 1024;
    v10 = -[SecItemRateLimit isEnabled](self, "isEnabled");
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "%sorcing SIRL to be enabled (effective: %i)", (uint8_t *)&v7, 0x12u);
  }

}

- (int)roCapacity
{
  return self->_roCapacity;
}

- (double)roRate
{
  return self->_roRate;
}

- (int)rwCapacity
{
  return self->_rwCapacity;
}

- (double)rwRate
{
  return self->_rwRate;
}

- (double)limitMultiplier
{
  return self->_limitMultiplier;
}

- (NSDate)roBucket
{
  return self->_roBucket;
}

- (NSDate)rwBucket
{
  return self->_rwBucket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rwBucket, 0);
  objc_storeStrong((id *)&self->_roBucket, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
}

void __43__SecItemRateLimit_consumeTokenFromBucket___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;
  double v11;
  id v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v3 = 28;
  else
    v3 = 24;
  if (*(_BYTE *)(a1 + 48))
    v4 = 40;
  else
    v4 = 32;
  v5 = 64;
  if (!*(_BYTE *)(a1 + 48))
    v5 = 56;
  v6 = (id *)(v2 + v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", -1.0 / *(double *)(v2 + v4) * (double)*(int *)(v2 + v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*v6 || (objc_msgSend(*v6, "timeIntervalSinceDate:", v7), v8 < 0.0))
    objc_storeStrong(v6, v7);
  objc_msgSend(*v6, "dateByAddingTimeInterval:", 1.0 / *(double *)(v2 + v4));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *v6;
  *v6 = (id)v9;

  objc_msgSend(*v6, "timeIntervalSinceDate:", v13);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11 <= 0.0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v12 = *v6;
    *v6 = 0;

    *(_DWORD *)(v2 + v3) = (int)(*(double *)(*(_QWORD *)(a1 + 32) + 48) * (double)*(int *)(v2 + v3));
    *(double *)(v2 + v4) = *(double *)(*(_QWORD *)(a1 + 32) + 48) * *(double *)(v2 + v4);
  }

}

+ (id)getStaticRateLimit
{
  return +[SecItemRateLimit instance](SecItemRateLimit, "instance");
}

+ (void)resetStaticRateLimit
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  v3 = (void *)ratelimit;
  ratelimit = v2;

}

@end
