@implementation DOCFeatureStateFFSetting

- (DOCFeatureStateFFSetting)initWithDomainID:(id)a3 featureID:(id)a4 overrideKey:(id)a5 valueMode:(int64_t)a6 requirements:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  DOCFeatureStateFFSetting *v17;
  DOCFeatureStateFFSetting *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  objc_super v34;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)DOCFeatureStateFFSetting;
  v17 = -[DOCFeatureStateFFSetting init](&v34, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domainID, a3);
    objc_storeStrong((id *)&v18->_featureID, a4);
    v18->_valueMode = a6;
    objc_msgSend((id)objc_opt_class(), "defaultsOverrideForDomainID:featureID:overrideKey:", v13, v14, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __90__DOCFeatureStateFFSetting_initWithDomainID_featureID_overrideKey_valueMode_requirements___block_invoke;
    v32 = &unk_24C0FE738;
    v21 = v20;
    v33 = v21;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v29);
    if (objc_msgSend(v21, "count"))
    {
      -[DOCFeatureState setIsEnabled:](v18, "setIsEnabled:", 0);
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("forced off (unsatisfied = %@)"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v19)
      {
        -[DOCFeatureState setIsEnabled:](v18, "setIsEnabled:", objc_msgSend(v19, "BOOLValue"));
        v25 = (void *)MEMORY[0x24BDD17C8];
        v26 = CFSTR("DEBUG override");
      }
      else if (a6)
      {
        -[DOCFeatureState setIsEnabled:](v18, "setIsEnabled:", a6 == 1);
        v25 = (void *)MEMORY[0x24BDD17C8];
        v26 = CFSTR("forced value");
      }
      else
      {
        objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
        objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
        -[DOCFeatureState setIsEnabled:](v18, "setIsEnabled:", _os_feature_enabled_impl());
        v25 = (void *)MEMORY[0x24BDD17C8];
        v26 = CFSTR("user setting");
      }
      objc_msgSend(v25, "stringWithFormat:", v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("feature flag (%@): %@.%@"), v24, v13, v14, v29, v30, v31, v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _FFInitLog(v27, -[DOCFeatureState isEnabled](v18, "isEnabled"));

  }
  return v18;
}

+ (id)defaultsOverrideForDomainID:(id)a3 featureID:(id)a4 overrideKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  id v11;
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
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("UIKit")) & 1) != 0)
  {
    v10 = CFSTR("com.apple.UIKit");
    if (v9)
    {
LABEL_3:
      v11 = v9;
      goto LABEL_6;
    }
  }
  else
  {
    v10 = CFSTR("com.apple.DocumentManager.defaults");
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DOCFeature.override.%@.%@"), v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = v11;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DocumentManager.defaults"));
    objc_msgSend(v15, "valueForKey:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      v24[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "registerDefaults:", v18);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKey:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v10);
    objc_msgSend(v21, "valueForKey:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

void __90__DOCFeatureStateFFSetting_initWithDomainID_featureID_overrideKey_valueMode_requirements___block_invoke(uint64_t a1, void *a2)
{
  uint64_t (**v3)(void);
  char v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "requirementValidationBlock");
  v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v4 = v3[2]();

  if ((v4 & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (NSString)domainID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDomainID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)featureID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFeatureID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)valueMode
{
  return self->_valueMode;
}

- (void)setValueMode:(int64_t)a3
{
  self->_valueMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureID, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
}

@end
