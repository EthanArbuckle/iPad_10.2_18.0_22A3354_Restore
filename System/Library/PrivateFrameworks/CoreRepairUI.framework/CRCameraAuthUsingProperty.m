@implementation CRCameraAuthUsingProperty

- (CRCameraAuthUsingProperty)init
{
  CRCameraAuthUsingProperty *v2;
  CRCameraAuthUsingProperty *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRCameraAuthUsingProperty;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", CFSTR("Camera"));
  return v3;
}

- (int64_t)copyComponentStatus
{
  CRCameraAuthUsingProperty *v2;
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t v19[16];

  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRPropertySupported:", CFSTR("RCSn")) & 1) != 0)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v3 = 0;
LABEL_16:
      v4 = -3;
      goto LABEL_17;
    }
    -[CRComponentAuth findUnsealedData](v2, "findUnsealedData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    if ((objc_msgSend(v5, "deviceSupportsRepairBootIntent") & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RCSn"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
LABEL_14:
        v4 = 1;
        goto LABEL_17;
      }
      -[CRComponentAuth _getObjectForKeyFromDefaults:](v2, "_getObjectForKeyFromDefaults:", CFSTR("cachedPreFlightResults"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE27E78];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("failComponents"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "extractComponentsAndIdentifiers:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RCSn"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_15;
      v11 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RCSn"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RCSn"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v13, "isEqualToSet:", v16);

      if (!(_DWORD)v14)
      {
LABEL_15:

        goto LABEL_16;
      }
      sub_22AC82A9C(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_22AC64000, v17, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", v19, 2u);
      }

    }
    goto LABEL_14;
  }
  v3 = 0;
  v4 = 0;
LABEL_17:

  objc_sync_exit(v2);
  return v4;
}

@end
