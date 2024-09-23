@implementation CREnclosureStatus

- (CREnclosureStatus)init
{
  CREnclosureStatus *v2;
  CREnclosureStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CREnclosureStatus;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", CFSTR("Enclosure"));
  return v3;
}

- (int64_t)copyComponentStatus
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint8_t v22[16];

  if (objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("NBCl")))
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v3 = 0;
LABEL_16:
      v4 = -3;
      goto LABEL_17;
    }
    -[CRComponentAuth findUnsealedData](self, "findUnsealedData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    if ((objc_msgSend(v5, "deviceSupportsRepairBootIntent") & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NBCl"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[CRComponentAuth _getObjectForKeyFromDefaults:](self, "_getObjectForKeyFromDefaults:", CFSTR("cachedPreFlightResults"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x24BE27E78];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("failComponents"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "extractComponentsAndIdentifiers:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NBCl"));
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_15;
        v12 = (void *)v11;
        v13 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NBCl"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NBCl"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v15, "isEqualToSet:", v18);

        if (!v19)
        {
LABEL_15:

          goto LABEL_16;
        }
        sub_22AC82A9C(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_22AC64000, v20, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", v22, 2u);
        }

      }
    }
    else
    {

    }
    v4 = 1;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
LABEL_17:

  return v4;
}

@end
