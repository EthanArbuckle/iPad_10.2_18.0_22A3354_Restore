@implementation CRCameraAuth

- (CRCameraAuth)init
{
  CRCameraAuth *v2;
  CRCameraAuth *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRCameraAuth;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", CFSTR("Camera"));
  return v3;
}

- (int64_t)copyComponentStatus
{
  CRCameraAuth *v2;
  void *v3;
  void *v4;
  int64_t v5;
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
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("CmCl")) & 1) != 0)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v3 = 0;
      v4 = 0;
LABEL_23:
      v5 = -3;
      goto LABEL_25;
    }
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v3 = 0;
      v4 = 0;
    }
    else
    {
      -[CRComponentAuth findUnsealedData](v2, "findUnsealedData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_opt_new();
      if ((objc_msgSend(v6, "deviceSupportsRepairBootIntent") & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CmCl"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[CRComponentAuth _getObjectForKeyFromDefaults:](v2, "_getObjectForKeyFromDefaults:", CFSTR("cachedPreFlightResults"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)MEMORY[0x24BE27E78];
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("failComponents"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "extractComponentsAndIdentifiers:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CmCl"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
            goto LABEL_22;
          v13 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CmCl"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setWithArray:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CmCl"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setWithArray:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = objc_msgSend(v15, "isEqualToSet:", v18);

          if (!(_DWORD)v16)
          {
LABEL_22:

            v3 = 0;
            goto LABEL_23;
          }
          sub_22AC82A9C(0);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v22) = 0;
            _os_log_impl(&dword_22AC64000, v19, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", (uint8_t *)&v22, 2u);
          }

        }
      }
      else
      {

      }
      -[CRCameraAuth getCmClValidationStatus](v2, "getCmClValidationStatus");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      sub_22AC82A9C(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v3;
        _os_log_impl(&dword_22AC64000, v20, OS_LOG_TYPE_DEFAULT, "FDR Validation status:%@", (uint8_t *)&v22, 0xCu);
      }

      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fail")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) == 0)
      {
        v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("Pass"));
        goto LABEL_25;
      }
    }
    v5 = -1;
  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 1;
  }
LABEL_25:

  objc_sync_exit(v2);
  return v5;
}

- (BOOL)isComponentFailed
{
  void *v2;
  char v3;

  -[CRCameraAuth getCmClValidationStatus](self, "getCmClValidationStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Fail")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Invalid"));

  return v3;
}

- (id)getCmClValidationStatus
{
  io_registry_entry_t v2;
  void *CFProperty;
  NSObject *v4;

  if (!objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("CmCl")))
  {
LABEL_7:
    CFProperty = 0;
    return CFProperty;
  }
  v2 = sub_22AC7DB80();
  if (!v2)
  {
    sub_22AC82A9C(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_22AC86020();

    goto LABEL_7;
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v2, CFSTR("CmClValidationStatus"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  return CFProperty;
}

@end
