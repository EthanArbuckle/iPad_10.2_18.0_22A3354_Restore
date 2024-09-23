@implementation APConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->configDictionary, 0);
}

- (NSString)identifier
{
  void *v2;
  const char *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  return (NSString *)objc_msgSend_path(v2, v3, v4);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v3;
  const char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APConfiguration;
  -[APConfiguration methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend_signatureWithObjCTypes_(MEMORY[0x24BDBCEB0], v4, (uint64_t)"@@:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7 = (const char *)objc_msgSend_selector(v4, v5, v6);
  NSStringFromSelector(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ap_propertyName(v8, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_configDictionary(self, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v14, v15, (uint64_t)CFSTR("properties"));
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_valueForKey_(v16, v17, (uint64_t)v8);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      APLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        v32 = (id)objc_opt_class();
        v33 = 2113;
        v34 = v13;
        v20 = v32;
        _os_log_impl(&dword_235C39000, v19, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Forward invocation for %{private}@ value is nil.", buf, 0x16u);

      }
      v21 = (void *)MEMORY[0x24BDD17C8];
      v22 = objc_opt_class();
      objc_msgSend_stringWithFormat_(v21, v23, (uint64_t)CFSTR("[%@] Error: Forward invocation for %@ value is nil."), v22, v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CreateDiagnosticReport();

    }
    objc_msgSend_setReturnValue_(v4, v18, (uint64_t)&v30);
    objc_msgSend_notifier(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recentlyAccessedObject_(v27, v28, (uint64_t)self);

  }
  else
  {
    APLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v32 = (id)objc_opt_class();
      v29 = v32;
      _os_log_impl(&dword_235C39000, v16, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Forward invocation couldn't find property name.", buf, 0xCu);

    }
  }

}

- (APPurgeableCacheNotifierP)notifier
{
  return self->_notifier;
}

- (NSDictionary)configDictionary
{
  return self->configDictionary;
}

- (APConfiguration)initWithConfig:(id)a3 notifier:(id)a4
{
  id v6;
  id v7;
  APConfiguration *v8;
  const char *v9;
  APConfiguration *v10;
  const char *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)APConfiguration;
  v8 = -[APConfiguration init](&v13, sel_init);
  v10 = v8;
  if (v8)
  {
    objc_msgSend_setConfigDictionary_(v8, v9, (uint64_t)v6);
    objc_msgSend_setNotifier_(v10, v11, (uint64_t)v7);
  }

  return v10;
}

- (void)setNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_notifier, a3);
}

- (void)setConfigDictionary:(id)a3
{
  objc_storeStrong((id *)&self->configDictionary, a3);
}

+ (NSString)path
{
  NSObject *v2;
  id v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v5 = 138477827;
    v6 = (id)objc_opt_class();
    v3 = v6;
    _os_log_impl(&dword_235C39000, v2, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Path needs to be implemented for each subclass.", (uint8_t *)&v5, 0xCu);

  }
  APSimulateCrash();
  return (NSString *)&stru_2506FE700;
}

- (int64_t)version
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend_configDictionary(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend_integerValue(v5, v6, v7);
  return v8;
}

@end
