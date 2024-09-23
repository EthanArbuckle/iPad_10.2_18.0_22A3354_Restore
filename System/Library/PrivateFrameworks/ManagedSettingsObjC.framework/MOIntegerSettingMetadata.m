@implementation MOIntegerSettingMetadata

- (MOIntegerSettingMetadata)initWithSettingName:(id)a3 defaultInt:(int64_t)a4 combineOperator:(int64_t)a5 lowerBound:(int64_t)a6 upperBound:(int64_t)a7 isPublic:(BOOL)a8 scope:(id)a9 isPrivacySensitive:(BOOL)a10
{
  _BOOL8 v10;
  void *v17;
  id v18;
  id v19;
  void *v20;
  MOIntegerSettingMetadata *v21;
  objc_super v23;

  v10 = a8;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = a9;
  v19 = a3;
  objc_msgSend(v17, "numberWithInteger:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)MOIntegerSettingMetadata;
  v21 = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v23, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, v19, v20, v10, v18, a10);

  v21->_combineOperator = a5;
  v21->_lowerBound = a6;
  v21->_upperBound = a7;
  return v21;
}

- (NSNumber)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOIntegerSettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4;
  int64_t v5;
  int64_t lowerBound;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "integerValue");
    lowerBound = self->_lowerBound;
    if (v5 >= lowerBound)
    {
      if (v5 >= self->_upperBound)
        lowerBound = self->_upperBound;
      else
        lowerBound = v5;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", lowerBound);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  -[MOIntegerSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOIntegerSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MOIntegerSettingMetadata _combine:with:](self, "_combine:with:", objc_msgSend(v7, "integerValue"), objc_msgSend(v8, "integerValue")));
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

- (int64_t)_combine:(int64_t)a3 with:(int64_t)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)(self + 40);
  if (v4)
  {
    if (v4 == 1)
    {
      if (a3 <= a4)
        return a4;
      else
        return a3;
    }
  }
  else if (a3 >= a4)
  {
    return a4;
  }
  else
  {
    return a3;
  }
  return self;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

- (int64_t)lowerBound
{
  return self->_lowerBound;
}

- (int64_t)upperBound
{
  return self->_upperBound;
}

@end
