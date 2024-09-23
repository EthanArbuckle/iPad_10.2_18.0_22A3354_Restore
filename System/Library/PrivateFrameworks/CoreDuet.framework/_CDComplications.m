@implementation _CDComplications

+ (id)sharedComplication
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___CDComplications_sharedComplication__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedComplication_init_once_token != -1)
    dispatch_once(&sharedComplication_init_once_token, block);
  return (id)sharedInstance;
}

- (void)readOutActiveComplications
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  _CDDCurrentActiveComplications();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_msgSend(v9, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, v8);

    }
  }
  -[_CDComplications setActiveComplications:](self, "setActiveComplications:", v3);

}

- (id)initForComplications
{
  _CDComplications *v2;
  NSDictionary *v3;
  NSDictionary *activeComplications;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *complicationQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *meterTokens;
  uint64_t v10;
  NSUserDefaults *pushLimits;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD block[4];
  _CDComplications *v31;
  _QWORD v32[4];
  _CDComplications *v33;
  _QWORD handler[4];
  _CDComplications *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)_CDComplications;
  v2 = -[_CDComplications init](&v36, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    activeComplications = v2->_activeComplications;
    v2->_activeComplications = v3;

    v2->deviceChangeToken = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.complications", v5);
    complicationQueue = v2->complicationQueue;
    v2->complicationQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    meterTokens = v2->meterTokens;
    v2->meterTokens = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.coreduet.complications.pushLimits"));
    pushLimits = v2->pushLimits;
    v2->pushLimits = (NSUserDefaults *)v10;

    if (!v2->pushLimits)
    {
      +[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[_CDComplications initForComplications].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    }
    _CDDComplicationChangeNotificationString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = MEMORY[0x1E0C809B0];
    if (v20)
    {
      v23 = (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      v24 = v2->complicationQueue;
      handler[0] = v22;
      handler[1] = 3221225472;
      handler[2] = __40___CDComplications_initForComplications__block_invoke;
      handler[3] = &unk_1E26E4758;
      v35 = v2;
      notify_register_dispatch(v23, &v2->deviceChangeToken, v24, handler);

    }
    _CDDComplicationChangeOverCloudNotificationString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      v27 = v2->complicationQueue;
      v32[0] = v22;
      v32[1] = 3221225472;
      v32[2] = __40___CDComplications_initForComplications__block_invoke_2;
      v32[3] = &unk_1E26E4758;
      v33 = v2;
      notify_register_dispatch(v26, &v2->deviceChangeToken, v27, v32);

    }
    v28 = v2->complicationQueue;
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __40___CDComplications_initForComplications__block_invoke_3;
    block[3] = &unk_1E26E2F20;
    v31 = v2;
    dispatch_sync(v28, block);

  }
  return v2;
}

- (int)remainingPushesOnComplicationForiOSApplicationWithBundleID:(id)a3
{
  return -[_CDComplications remainingPushesOnComplication:andReduceBy:](self, "remainingPushesOnComplication:andReduceBy:", a3, &unk_1E272A990);
}

- (int)remainingPushesOnComplication:(id)a3 andReduceBy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v6 = a3;
  v7 = a4;
  -[NSUserDefaults objectForKey:](self->pushLimits, "objectForKey:", CFSTR("complicationPushLimits"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = (id)objc_msgSend(v8, "mutableCopy");
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;
  objc_msgSend(v10, "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((int)objc_msgSend(v7, "intValue") >= 1 && objc_msgSend(v12, "integerValue") >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "intValue") - objc_msgSend(v7, "intValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forKey:", v13, v6);

      -[NSUserDefaults setObject:forKey:](self->pushLimits, "setObject:forKey:", v11, CFSTR("complicationPushLimits"));
    }
    v14 = objc_msgSend(v12, "intValue");
  }
  else
  {
    objc_msgSend(v11, "setValue:forKey:", &unk_1E272A9A8, v6);
    -[NSUserDefaults setObject:forKey:](self->pushLimits, "setObject:forKey:", v11, CFSTR("complicationPushLimits"));
    v14 = 50;
  }

  return v14;
}

- (BOOL)watchIsCharging
{
  NSObject *v2;
  BOOL v3;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t v9[12];
  int token;
  uint8_t buf[8];
  int out_token;
  uint64_t state64;

  state64 = 0;
  out_token = 0;
  LOBYTE(v2) = 0;
  if (!notify_register_check("com.apple.coreduetd.nearbydeviceschanged", &out_token))
  {
    if (notify_get_state(out_token, &state64))
      v3 = 0;
    else
      v3 = state64 == 1;
    if (!v3)
    {
      +[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel");
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_INFO, "Watch is not nearby\n", buf, 2u);
      }

      LOBYTE(v2) = 0;
      goto LABEL_24;
    }
    *(_QWORD *)buf = 0;
    token = 0;
    LOBYTE(v2) = 0;
    if (notify_register_check("com.apple.coreduetd.watchischarging", &token))
    {
LABEL_23:
      notify_cancel(token);
LABEL_24:
      notify_cancel(out_token);
      return (char)v2;
    }
    if (notify_get_state(token, (uint64_t *)buf))
      v4 = 0;
    else
      v4 = *(_QWORD *)buf == 1;
    LODWORD(v2) = v4;
    +[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if ((_DWORD)v2 == 1)
    {
      if (v6)
      {
        *(_WORD *)v9 = 0;
        v7 = "Watch is nearby and charging, approving complication push\n";
LABEL_21:
        _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, v7, v9, 2u);
      }
    }
    else if (v6)
    {
      *(_WORD *)v9 = 0;
      v7 = "Watch is nearby but not charging\n";
      goto LABEL_21;
    }

    goto LABEL_23;
  }
  return (char)v2;
}

- (BOOL)admissionCheckOnComplication:(id)a3 forRemote:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *complicationQueue;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    complicationQueue = self->complicationQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65___CDComplications_admissionCheckOnComplication_forRemote_error___block_invoke;
    v13[3] = &unk_1E26E4780;
    v13[4] = self;
    v14 = v8;
    v15 = &v17;
    v16 = a4;
    dispatch_sync(complicationQueue, v13);
    if (a5)
      *a5 = 0;
    v11 = *((_BYTE *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isBundleActiveComplication:(id)a3
{
  id v4;
  NSObject *complicationQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  complicationQueue = self->complicationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___CDComplications_isBundleActiveComplication___block_invoke;
  block[3] = &unk_1E26E47A8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(complicationQueue, block);
  LOBYTE(complicationQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)complicationQueue;
}

- (NSDictionary)activeComplications
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setActiveComplications:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeComplications, 0);
  objc_storeStrong((id *)&self->meterTokens, 0);
  objc_storeStrong((id *)&self->pushLimits, 0);
  objc_storeStrong((id *)&self->complicationQueue, 0);
}

- (void)initForComplications
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "no access to complication push limits (wcd sandbox violation?)\n", a5, a6, a7, a8, 0);
}

@end
