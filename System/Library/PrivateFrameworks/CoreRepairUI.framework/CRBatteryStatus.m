@implementation CRBatteryStatus

- (CRBatteryStatus)init
{
  CRBatteryStatus *v2;
  CRBatteryStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRBatteryStatus;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", CFSTR("Battery"));
  return v3;
}

- (int64_t)copyComponentStatus
{
  void *v2;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[16];

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("bcrt")) & 1) == 0
    && !objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("vcrt")))
  {
    return 0;
  }
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
      return -1;
    -[CRComponentAuth findUnsealedData](self, "findUnsealedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    if ((objc_msgSend(v6, "deviceSupportsRepairBootIntent") & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bcrt"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

        goto LABEL_15;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vcrt"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
LABEL_15:
        -[CRComponentAuth _getObjectForKeyFromDefaults:](self, "_getObjectForKeyFromDefaults:", CFSTR("cachedPreFlightResults"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x24BE27E78];
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("failComponents"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "extractComponentsAndIdentifiers:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bcrt"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)0x24BDBC000;
        if (v13)
        {
          v15 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bcrt"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setWithArray:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bcrt"));
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setWithArray:", v2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqualToSet:", v14) & 1) != 0)
          {

LABEL_24:
            sub_22AC82A9C(0);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22AC64000, v27, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
            }

            goto LABEL_27;
          }
          v30 = v17;
          v31 = v16;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vcrt"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v29 = v2;
          v33 = v9;
          v20 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vcrt"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setWithArray:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x24BDBCF20];
          v32 = v12;
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("vcrt"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setWithArray:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v22, "isEqualToSet:", v25);

          if (v13)
          {

          }
          v12 = v32;
          v9 = v33;
          if ((v26 & 1) != 0)
            goto LABEL_24;
        }
        else
        {

          if (v13)
          {

          }
        }

        v4 = -3;
        goto LABEL_31;
      }
    }
    else
    {

    }
LABEL_27:
    v4 = -[CRComponentAuth getAuthCPComponentStatus:](self, "getAuthCPComponentStatus:", CFSTR("Battery"));
LABEL_31:

    return v4;
  }
  return -3;
}

- (BOOL)isComponentFailed
{
  return -[CRComponentAuth getAuthCPComponentStatus:](self, "getAuthCPComponentStatus:", CFSTR("Battery")) == -1;
}

@end
