@implementation MOStringSettingMetadata

- (MOStringSettingMetadata)initWithSettingName:(id)a3 defaultString:(id)a4 combineOperator:(int64_t)a5 rankedAllowedValues:(id)a6 isPublic:(BOOL)a7 scope:(id)a8 isPrivacySensitive:(BOOL)a9
{
  _BOOL8 v10;
  NSDictionary *v15;
  MOStringSettingMetadata *v16;
  NSDictionary *rankedAllowedValues;
  objc_super v19;

  v10 = a7;
  v15 = (NSDictionary *)a6;
  v19.receiver = self;
  v19.super_class = (Class)MOStringSettingMetadata;
  v16 = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v19, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, a3, a4, v10, a8, a9);
  v16->_combineOperator = a5;
  rankedAllowedValues = v16->_rankedAllowedValues;
  v16->_rankedAllowedValues = v15;

  return v16;
}

- (NSString)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOStringSettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_rankedAllowedValues, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  -[MOStringSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOStringSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
    {
      -[MOStringSettingMetadata _combine:with:](self, "_combine:with:", v7, v8);
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
  void *v9;
  int64_t combineOperator;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_rankedAllowedValues, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_rankedAllowedValues, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  combineOperator = self->_combineOperator;
  if (combineOperator == 1)
  {
    v13 = objc_msgSend(v8, "integerValue");
    v12 = v13 > objc_msgSend(v9, "integerValue");
  }
  else
  {
    if (combineOperator)
      goto LABEL_9;
    v11 = objc_msgSend(v8, "integerValue");
    v12 = v11 < objc_msgSend(v9, "integerValue");
  }
  if (v12)
    v14 = v6;
  else
    v14 = v7;
  self = v14;
LABEL_9:

  return self;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

- (NSDictionary)rankedAllowedValues
{
  return self->_rankedAllowedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedAllowedValues, 0);
}

@end
