@implementation CRBackGlassStatus

- (CRBackGlassStatus)init
{
  CRBackGlassStatus *v2;
  CRBackGlassStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRBackGlassStatus;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", CFSTR("BackGlass"));
  return v3;
}

- (int64_t)copyComponentStatus
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[16];

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("bCfg")) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("LCfg")))
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v5 = 0;
LABEL_28:
      v8 = -3;
      goto LABEL_29;
    }
    -[CRComponentAuth findUnsealedData](self, "findUnsealedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    if ((objc_msgSend(v6, "deviceSupportsRepairBootIntent") & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bCfg"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

        goto LABEL_12;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LCfg"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
LABEL_12:
        -[CRComponentAuth _getObjectForKeyFromDefaults:](self, "_getObjectForKeyFromDefaults:", CFSTR("cachedPreFlightResults"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x24BE27E78];
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("failComponents"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "extractComponentsAndIdentifiers:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bCfg"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bCfg"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setWithArray:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("bCfg"));
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setWithArray:", v2);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqualToSet:", v3) & 1) != 0)
          {

LABEL_21:
            sub_22AC82A9C(0);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22AC64000, v29, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
            }

            goto LABEL_24;
          }
          v31 = v17;
          v33 = v16;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LCfg"), v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v35 = v10;
          v20 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LCfg"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setWithArray:", v21);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v13;
          v24 = (void *)v22;
          v25 = (void *)MEMORY[0x24BDBCF20];
          v34 = v23;
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("LCfg"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setWithArray:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v24, "isEqualToSet:", v27);

          if (v14)
          {

          }
          v13 = v34;
          v10 = v35;
          if ((v28 & 1) != 0)
            goto LABEL_21;
        }
        else
        {

          if (v14)
          {

          }
        }

        goto LABEL_28;
      }
    }
    else
    {

    }
LABEL_24:
    v8 = 1;
    goto LABEL_29;
  }
  v5 = 0;
  v8 = 0;
LABEL_29:

  return v8;
}

@end
