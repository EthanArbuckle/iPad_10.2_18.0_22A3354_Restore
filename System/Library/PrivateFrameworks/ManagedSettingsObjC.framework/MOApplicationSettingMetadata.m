@implementation MOApplicationSettingMetadata

- (MOApplicationSettingMetadata)initWithSettingName:(id)a3 defaultApplication:(id)a4 combineOperator:(int64_t)a5 isPublic:(BOOL)a6 scope:(id)a7 isPrivacySensitive:(BOOL)a8
{
  MOApplicationSettingMetadata *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MOApplicationSettingMetadata;
  result = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v10, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, a3, a4, a6, a7, a8);
  result->_combineOperator = a5;
  return result;
}

- (MOApplication)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOApplicationSettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (MOApplication *)(id)objc_claimAutoreleasedReturnValue();
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

- (id)valueFromPersistableValue:(id)a3
{
  return +[MOApplication initializeWithPersistableValue:](MOApplication, "initializeWithPersistableValue:", a3);
}

- (id)sanitizePersistableValue:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (+[MOApplication isValidPersistableRepresentation:](MOApplication, "isValidPersistableRepresentation:", v3))
  {
    v4 = v3;
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
  -[MOApplicationSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOApplicationSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
    {
      -[MOApplicationSettingMetadata _combine:with:](self, "_combine:with:", v7, v8);
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

- (id)_combine:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t combineOperator;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  combineOperator = self->_combineOperator;
  v10 = v6;
  if (!combineOperator)
    goto LABEL_4;
  if (combineOperator == 1)
  {
    v10 = v7;
LABEL_4:
    self = v10;
  }

  return self;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

@end
