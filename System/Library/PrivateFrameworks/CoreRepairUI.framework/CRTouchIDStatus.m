@implementation CRTouchIDStatus

- (CRTouchIDStatus)init
{
  CRTouchIDStatus *v2;
  CRTouchIDStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRTouchIDStatus;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", CFSTR("TouchID"));
  return v3;
}

- (int64_t)copyComponentStatus
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint8_t v21[16];

  if (!MGGetBoolAnswer())
    return 0;
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
      return -3;
    -[CRComponentAuth findUnsealedData](self, "findUnsealedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    if ((objc_msgSend(v5, "deviceSupportsRepairBootIntent") & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MSRk"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_17;
      -[CRComponentAuth _getObjectForKeyFromDefaults:](self, "_getObjectForKeyFromDefaults:", CFSTR("cachedPreFlightResults"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE27E78];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("failComponents"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "extractComponentsAndIdentifiers:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MSRk"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_20;
      v11 = (void *)v10;
      v12 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MSRk"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MSRk"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v14, "isEqualToSet:", v17);

      if (!v18)
      {
LABEL_20:

        v3 = -3;
LABEL_21:

        return v3;
      }
      sub_22AC82A9C(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_22AC64000, v19, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", v21, 2u);
      }

    }
LABEL_17:
    if (-[CRTouchIDStatus isComponentFailed](self, "isComponentFailed"))
      v3 = -1;
    else
      v3 = 1;
    goto LABEL_21;
  }
  return -1;
}

- (BOOL)isComponentFailed
{
  CRTouchIDStatus *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[CRComponentAuth componentName](self, "componentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("Failed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CRComponentAuth _checkForComponentFailureInDefaults:](v2, "_checkForComponentFailureInDefaults:", v4);

  return (char)v2;
}

@end
