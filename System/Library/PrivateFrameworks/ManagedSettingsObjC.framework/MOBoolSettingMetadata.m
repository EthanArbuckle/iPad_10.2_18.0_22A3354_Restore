@implementation MOBoolSettingMetadata

- (MOBoolSettingMetadata)initWithSettingName:(id)a3 defaultBool:(BOOL)a4 combineOperator:(int64_t)a5 isPublic:(BOOL)a6 scope:(id)a7 isPrivacySensitive:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v11;
  void *v14;
  id v15;
  id v16;
  void *v17;
  MOBoolSettingMetadata *v18;
  objc_super v20;

  v8 = a8;
  v9 = a6;
  v11 = a4;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a7;
  v16 = a3;
  objc_msgSend(v14, "numberWithBool:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)MOBoolSettingMetadata;
  v18 = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v20, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, v16, v17, v9, v15, v8);

  v18->_combineOperator = a5;
  return v18;
}

- (NSNumber)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOBoolSettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)sanitizePersistableValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  -[MOBoolSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOBoolSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MOBoolSettingMetadata _combine:with:](self, "_combine:with:", objc_msgSend(v7, "BOOLValue"), objc_msgSend(v8, "BOOLValue")));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v7;
    }
  }
  else
  {
    if (!v8)
    {
      v10 = 0;
      goto LABEL_8;
    }
    v9 = v8;
  }
  v10 = v9;
LABEL_8:

  return v10;
}

- (BOOL)_combine:(BOOL)a3 with:(BOOL)a4
{
  char v4;
  int64_t combineOperator;

  v4 = 40;
  combineOperator = self->_combineOperator;
  if (combineOperator)
  {
    if (combineOperator == 1)
      v4 = a3 && a4;
  }
  else
  {
    v4 = a3 || a4;
  }
  return v4 & 1;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

@end
