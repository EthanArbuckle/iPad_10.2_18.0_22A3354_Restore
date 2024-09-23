@implementation MOApplicationCategoryShieldPolicySettingMetadata

- (MOApplicationCategoryShieldPolicy)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOApplicationCategoryShieldPolicySettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (MOApplicationCategoryShieldPolicy *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)valueFromPersistableValue:(id)a3
{
  return +[MOApplicationCategoryShieldPolicy initializeWithPersistableValue:](MOApplicationCategoryShieldPolicy, "initializeWithPersistableValue:", a3);
}

- (id)persistableValueFromValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "persistableValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MOApplicationCategoryShieldPolicySettingMetadata)initWithSettingName:(id)a3 defaultPolicy:(id)a4 maximumCategoryCount:(unint64_t)a5 maximumActivityCount:(unint64_t)a6 isPublic:(BOOL)a7 scope:(id)a8 isPrivacySensitive:(BOOL)a9
{
  MOApplicationCategoryShieldPolicySettingMetadata *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MOApplicationCategoryShieldPolicySettingMetadata;
  result = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v12, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, a3, a4, a7, a8, a9);
  result->_maximumCategoryCount = a5;
  result->_maximumActivityCount = a6;
  return result;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t maximumActivityCount;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (+[MOApplicationCategoryShieldPolicy isValidPersistableRepresentation:](MOApplicationCategoryShieldPolicy, "isValidPersistableRepresentation:", v4))
  {
    +[MOApplicationCategoryShieldPolicy initializeWithPersistableValue:](MOApplicationCategoryShieldPolicy, "initializeWithPersistableValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specificCategories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") <= self->_maximumCategoryCount)
    {
      objc_msgSend(v5, "excludedContent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      maximumActivityCount = self->_maximumActivityCount;

      if (v9 <= maximumActivityCount)
      {
        objc_msgSend(v5, "specificCategories");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOCategory all](MOCategory, "all");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "containsObject:", v13);

        if (v14)
        {
          objc_msgSend(v5, "excludedContent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[MOCategoryShieldPolicy allPolicyWithExcludedContent:](MOApplicationCategoryShieldPolicy, "allPolicyWithExcludedContent:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "persistableValue");
          v7 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v7 = v4;
        }
        goto LABEL_7;
      }
    }
    else
    {

    }
    v7 = 0;
LABEL_7:

    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  -[MOApplicationCategoryShieldPolicySettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOApplicationCategoryShieldPolicySettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!v8)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v13 = v8;
    goto LABEL_7;
  }
  if (!v8)
  {
    v13 = v7;
LABEL_7:
    v12 = v13;
    goto LABEL_9;
  }
  +[MOApplicationCategoryShieldPolicy initializeWithPersistableValue:](MOApplicationCategoryShieldPolicy, "initializeWithPersistableValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOApplicationCategoryShieldPolicy initializeWithPersistableValue:](MOApplicationCategoryShieldPolicy, "initializeWithPersistableValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOApplicationCategoryShieldPolicySettingMetadata _combine:with:](self, "_combine:with:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistableValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  MOApplicationCategoryShieldPolicy *v8;
  uint64_t v9;
  MOApplicationCategoryShieldPolicy *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MOApplicationCategoryShieldPolicy *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MOApplicationCategoryShieldPolicy *v27;
  void *v28;
  void *v29;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "policy");
  if (v7 == 2)
  {
    v9 = objc_msgSend(v6, "policy");
    if ((unint64_t)(v9 - 1) >= 2)
      goto LABEL_9;
    goto LABEL_13;
  }
  if (v7 == 1)
  {
    v9 = objc_msgSend(v6, "policy");
    if (v9 != 2)
    {
      if (v9 != 1)
      {
LABEL_9:
        if (!v9)
        {
          v8 = (MOApplicationCategoryShieldPolicy *)v5;
          goto LABEL_11;
        }
LABEL_12:
        v10 = 0;
        goto LABEL_16;
      }
      v19 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v5, "specificCategories");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithArray:", v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "specificCategories");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectsFromArray:", v21);

      v22 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v5, "excludedContent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithArray:", v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "excludedContent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithArray:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "intersectSet:", v26);

      v27 = [MOApplicationCategoryShieldPolicy alloc];
      objc_msgSend(v13, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[MOCategoryShieldPolicy initWithPolicy:specificCategories:excludedContent:](v27, "initWithPolicy:specificCategories:excludedContent:", 1, v28, v29);

LABEL_15:
      goto LABEL_16;
    }
LABEL_13:
    v11 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v5, "excludedContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "excludedContent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intersectSet:", v16);

    v17 = [MOApplicationCategoryShieldPolicy alloc];
    objc_msgSend(v13, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MOCategoryShieldPolicy initWithPolicy:specificCategories:excludedContent:](v17, "initWithPolicy:specificCategories:excludedContent:", 2, 0, v18);
    goto LABEL_15;
  }
  if (v7)
    goto LABEL_12;
  v8 = (MOApplicationCategoryShieldPolicy *)v6;
LABEL_11:
  v10 = v8;
LABEL_16:

  return v10;
}

- (unint64_t)maximumActivityCount
{
  return self->_maximumActivityCount;
}

- (unint64_t)maximumCategoryCount
{
  return self->_maximumCategoryCount;
}

@end
