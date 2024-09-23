@implementation HDRequiredFeatureSettingsValidator

- (HDRequiredFeatureSettingsValidator)initWithRequiredSettingsKeys:(id)a3
{
  id v4;
  HDRequiredFeatureSettingsValidator *v5;
  uint64_t v6;
  NSArray *requiredSettingsKeys;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDRequiredFeatureSettingsValidator;
  v5 = -[HDRequiredFeatureSettingsValidator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requiredSettingsKeys = v5->_requiredSettingsKeys;
    v5->_requiredSettingsKeys = (NSArray *)v6;

  }
  return v5;
}

- (id)featureSettingsGivenBaseSettings:(id)a3 onboardingCompletion:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Expected feature settings but no feature settings present"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    goto LABEL_10;
  }
  objc_msgSend(v9, "keyValueStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hk_containsObjectsInArray:", self->_requiredSettingsKeys);

  if (!v13)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    -[NSArray componentsJoinedByString:](self->_requiredSettingsKeys, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyValueStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_assignError:code:format:", a5, 3, CFSTR("Expected feature settings keys [%@] but received keys [%@]"), v17, v20);

LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v14 = v9;
LABEL_11:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredSettingsKeys, 0);
}

@end
