@implementation AMSUIWebRestrictedFeatureAction

- (AMSUIWebRestrictedFeatureAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebRestrictedFeatureAction *v7;
  void *v8;
  NSNumber *v9;
  NSNumber *enabled;
  void *v11;
  NSString *v12;
  NSString *identifier;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebRestrictedFeatureAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v15, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    enabled = v7->_enabled;
    v7->_enabled = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    identifier = v7->_identifier;
    v7->_identifier = v12;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebRestrictedFeatureAction;
  v3 = -[AMSUIWebAction runAction](&v19, sel_runAction);
  -[AMSUIWebRestrictedFeatureAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebRestrictedFeatureAction _featureWithIdentifier:](self, "_featureWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebRestrictedFeatureAction enabled](self, "enabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((objc_msgSend(MEMORY[0x24BE08328], "BOOLForEntitlement:", CFSTR("com.apple.managedconfiguration.profiled-access")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "OSLogObject");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = objc_opt_class();
          AMSLogKey();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v23 = v10;
          v24 = 2114;
          v25 = v11;
          v26 = 2114;
          v27 = CFSTR("com.apple.managedconfiguration.profiled-access");
          _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Missing %{public}@ entitlement", buf, 0x20u);

        }
      }
      objc_msgSend(v6, "setBoolValue:forSetting:", objc_msgSend(v7, "BOOLValue"), v5);
    }
    v12 = (void *)MEMORY[0x24BE08340];
    v20[0] = CFSTR("locked");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isBoolSettingLockedDownByRestrictions:", v5));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = CFSTR("state");
    v21[0] = v13;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "effectiveBoolValueForSetting:", v5));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "promiseWithResult:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x24BE08340];
    -[AMSUIWebRestrictedFeatureAction _unknownIdentifierError](self, "_unknownIdentifierError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "promiseWithError:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_featureWithIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _featureWithIdentifier__ams_once_token___COUNTER__;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_featureWithIdentifier__ams_once_token___COUNTER__, &__block_literal_global_29);
  objc_msgSend((id)_featureWithIdentifier__ams_once_object___COUNTER__, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __58__AMSUIWebRestrictedFeatureAction__featureWithIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("explicitContentAllowed");
  v3[0] = *MEMORY[0x24BE63918];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_featureWithIdentifier__ams_once_object___COUNTER__;
  _featureWithIdentifier__ams_once_object___COUNTER__ = v0;

}

- (int64_t)_translateState:(int)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v3 = *(_QWORD *)&a3;
  if (_translateState__ams_once_token___COUNTER__ != -1)
    dispatch_once(&_translateState__ams_once_token___COUNTER__, &__block_literal_global_24);
  v4 = (id)_translateState__ams_once_object___COUNTER__;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __51__AMSUIWebRestrictedFeatureAction__translateState___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CB8C290;
  v2[1] = &unk_24CB8C2C0;
  v3[0] = &unk_24CB8C2A8;
  v3[1] = &unk_24CB8C2D8;
  v2[2] = &unk_24CB8C2F0;
  v3[2] = &unk_24CB8C308;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_translateState__ams_once_object___COUNTER__;
  _translateState__ams_once_object___COUNTER__ = v0;

}

- (id)_unknownIdentifierError
{
  return (id)AMSError();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSNumber)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_enabled, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
