@implementation MODataSettingMetadata

- (MODataSettingMetadata)initWithSettingName:(id)a3 defaultData:(id)a4 combineOperator:(int64_t)a5 isPublic:(BOOL)a6 scope:(id)a7 isPrivacySensitive:(BOOL)a8
{
  MODataSettingMetadata *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MODataSettingMetadata;
  result = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v10, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, a3, a4, a6, a7, a8);
  result->_combineOperator = a5;
  return result;
}

- (NSData)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MODataSettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)sanitizePersistableValue:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  -[MODataSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MODataSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
    {
      -[MODataSettingMetadata _combine:with:](self, "_combine:with:", v7, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v7;
    }
  }
  else
  {
    v9 = v8;
  }
  v10 = v9;

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
  if (combineOperator == 1)
  {
    if (objc_msgSend(v7, "length"))
      v10 = v8;
    else
      v10 = v6;
    goto LABEL_9;
  }
  if (!combineOperator)
  {
    if (objc_msgSend(v6, "length"))
      v10 = v6;
    else
      v10 = v8;
LABEL_9:
    self = v10;
  }

  return self;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

@end
