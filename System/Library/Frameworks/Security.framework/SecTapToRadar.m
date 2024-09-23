@implementation SecTapToRadar

- (id)initTapToRadar:(id)a3 description:(id)a4 radar:(id)a5
{
  id v9;
  id v10;
  id v11;
  SecTapToRadar *v12;
  SecTapToRadar *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  NSObject *v16;
  NSObject *v17;
  NSString *componentName;
  NSString *componentVersion;
  NSString *componentID;
  SecTapToRadar *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SecTapToRadar;
  v12 = -[SecTapToRadar init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_alert, a3);
    objc_storeStrong((id *)&v13->_radarDescription, a4);
    objc_storeStrong((id *)&v13->_radarnumber, a5);
    v14 = dispatch_queue_create("com.apple.security.diagnostic-queue", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    v16 = v13->_queue;
    dispatch_get_global_queue(-32768, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v16, v17);

    componentName = v13->_componentName;
    v13->_componentName = (NSString *)CFSTR("Security");

    componentVersion = v13->_componentVersion;
    v13->_componentVersion = (NSString *)CFSTR("all");

    componentID = v13->_componentID;
    v13->_componentID = (NSString *)CFSTR("606179");

    v21 = v13;
  }

  return v13;
}

- (BOOL)isRateLimited
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.security"));
  objc_msgSend((id)objc_opt_class(), "keyname:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "compare:", v6) != -1;

  }
  else
  {
    objc_msgSend(v3, "removeObjectForKey:", v4);
    v7 = 0;
  }

  return v7;
}

- (void)updateRetryTimestamp
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.security"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyname:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (void)clearRetryTimestamp
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.security"));
  objc_msgSend((id)objc_opt_class(), "keyname:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

- (void)trigger
{
  NSObject *v3;
  _QWORD block[5];

  -[SecTapToRadar queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__SecTapToRadar_trigger__block_invoke;
  block[3] = &unk_1E1FDBE18;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (NSString)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(id)a3
{
  objc_storeStrong((id *)&self->_componentID, a3);
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->_componentName, a3);
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_componentVersion, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSString)alert
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAlert:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)radarDescription
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRadarDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)radarnumber
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRadarnumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_radarnumber, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
}

void __24__SecTapToRadar_trigger__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D770A24]();
  if (os_variant_allows_internal_security_policies())
  {
    if (objc_msgSend((id)objc_opt_class(), "isRateLimited:", *(_QWORD *)(a1 + 32)))
    {
      secLogObjForScope("SecTTR");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "alert");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 138412290;
        v6 = v4;
        _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "Not showing ttr due to ratelimiting: %@", (uint8_t *)&v5, 0xCu);

      }
    }
    else
    {
      if (objc_msgSend((id)objc_opt_class(), "askUserIfTTR:", *(_QWORD *)(a1 + 32)))
        objc_msgSend((id)objc_opt_class(), "triggerTapToRadar:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "updateRetryTimestamp");
    }
  }
  objc_autoreleasePoolPop(v2);
}

+ (id)keyname:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "radarnumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("NextTTRDate"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isRateLimited:(id)a3
{
  if ((SecTTRDisabled & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "isRateLimited");
}

+ (void)disableTTRsEntirely
{
  SecTTRDisabled = 1;
}

+ (void)triggerTapToRadar:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 buf;
  Class (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  secLogObjForScope("secttr");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "alert");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "Triggering TTR: %@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v3, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (triggerTapToRadar__onceToken != -1)
    dispatch_once(&triggerTapToRadar__onceToken, &__block_literal_global);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v7 = (void *)getLSApplicationWorkspaceClass_softClass;
  v36 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v38 = __getLSApplicationWorkspaceClass_block_invoke;
    v39 = &unk_1E1FD8CF0;
    v40 = &v33;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)&buf);
    v7 = (void *)v34[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v33, 8);
  if (v8)
  {
    v29 = v8;
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "alert");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "radarnumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("SFA: %@ - %@"), v10, v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "stringByAddingPercentEncodingWithAllowedCharacters:", triggerTapToRadar__queryComponent);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "radarDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reason");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = &stru_1E1FDD448;
    objc_msgSend(v3, "radarnumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@\n%@\nRelated radar: rdar://%@"), v13, v16, v17);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "stringByAddingPercentEncodingWithAllowedCharacters:", triggerTapToRadar__queryComponent);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "componentName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAddingPercentEncodingWithAllowedCharacters:", triggerTapToRadar__queryComponent);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAddingPercentEncodingWithAllowedCharacters:", triggerTapToRadar__queryComponent);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAddingPercentEncodingWithAllowedCharacters:", triggerTapToRadar__queryComponent);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=%@&ComponentName=%@&ComponentVersion=%@&Reproducibility=Not%%20Applicable&ComponentID=%@&Classification=Crash/Hang/Data%%20Loss&Description=%@"), v30, v21, v23, v25, v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "defaultWorkspace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "openURL:configuration:completionHandler:", v27, 0, &__block_literal_global_30);

  }
}

+ (BOOL)askUserIfTTR:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  __CFUserNotification *v8;
  __CFUserNotification *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  SInt32 error;
  _BYTE responseFlags[24];
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C9B830];
  v16[0] = *MEMORY[0x1E0C9B838];
  v16[1] = v3;
  v17[0] = CFSTR("Tap-To-Radar");
  v17[1] = CFSTR("Go away");
  v16[2] = *MEMORY[0x1E0C9B810];
  v4 = a3;
  objc_msgSend(v4, "alert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = *MEMORY[0x1E0C9B800];
  objc_msgSend(v4, "componentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  error = 0;
  v8 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v7);
  if (v8)
  {
    v9 = v8;
    *(_QWORD *)responseFlags = 0;
    CFUserNotificationReceiveResponse(v8, 180.0, (CFOptionFlags *)responseFlags);
    v10 = (responseFlags[0] & 3) == 0;
    CFRelease(v9);
  }
  else
  {
    secLogObjForScope("SecTTR");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", error);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)responseFlags = 138412290;
      *(_QWORD *)&responseFlags[4] = v12;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create notification error %@", responseFlags, 0xCu);

    }
    v10 = 0;
  }

  return v10;
}

uint64_t __35__SecTapToRadar_triggerTapToRadar___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v1 = (void *)triggerTapToRadar__queryComponent;
  triggerTapToRadar__queryComponent = (uint64_t)v0;

  v2 = (void *)triggerTapToRadar__queryComponent;
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  return objc_msgSend((id)triggerTapToRadar__queryComponent, "removeCharactersInString:", CFSTR("&"));
}

@end
