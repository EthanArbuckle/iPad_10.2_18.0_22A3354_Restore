@implementation CRDisplayStatus

- (CRDisplayStatus)init
{
  CRDisplayStatus *v2;
  CRDisplayStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRDisplayStatus;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", CFSTR("Display"));
  return v3;
}

- (int64_t)copyComponentStatus
{
  void *v2;
  void *v3;
  void *v4;
  int v6;
  int v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  char v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[16];

  v6 = objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("tcrt"));
  v7 = objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("dCfg"));
  if ((v6 & 1) != 0 || v7)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v8 = 0;
LABEL_34:
      v9 = -3;
      goto LABEL_35;
    }
    if (v6 && _os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v8 = 0;
      v9 = -1;
      goto LABEL_35;
    }
    -[CRComponentAuth findUnsealedData](self, "findUnsealedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    if ((objc_msgSend(v10, "deviceSupportsRepairBootIntent") & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tcrt"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

        goto LABEL_18;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dCfg"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
LABEL_18:
        -[CRComponentAuth _getObjectForKeyFromDefaults:](self, "_getObjectForKeyFromDefaults:", CFSTR("cachedPreFlightResults"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BE27E78];
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("failComponents"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "extractComponentsAndIdentifiers:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tcrt"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v17 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tcrt"));
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setWithArray:", v4);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tcrt"));
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          v21 = (void *)v18;
          objc_msgSend(v20, "setWithArray:", v2);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqualToSet:", v3) & 1) != 0)
          {

            goto LABEL_27;
          }
          v35 = v21;
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dCfg"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v32 = v3;
          v33 = v2;
          v34 = v4;
          v36 = v13;
          v23 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dCfg"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setWithArray:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dCfg"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setWithArray:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v25, "isEqualToSet:", v28);

          if (v37)
          {

          }
          v13 = v36;
          if ((v29 & 1) != 0)
          {
LABEL_27:
            sub_22AC82A9C(0);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22AC64000, v30, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
            }

            if ((v6 & 1) == 0)
              goto LABEL_30;
            goto LABEL_16;
          }
        }
        else
        {

          if (v37)
          {

          }
        }

        goto LABEL_34;
      }
    }
    else
    {

    }
    if (!v6)
    {
LABEL_30:
      v9 = 1;
      goto LABEL_35;
    }
LABEL_16:
    v9 = -[CRComponentAuth getAuthCPComponentStatus:](self, "getAuthCPComponentStatus:", CFSTR("TouchController"));
    goto LABEL_35;
  }
  v8 = 0;
  v9 = 0;
LABEL_35:

  return v9;
}

- (BOOL)isComponentFailed
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("tcrt"));
  if (v3)
    LOBYTE(v3) = -[CRComponentAuth getAuthCPComponentStatus:](self, "getAuthCPComponentStatus:", CFSTR("TouchController")) == -1;
  return v3;
}

@end
