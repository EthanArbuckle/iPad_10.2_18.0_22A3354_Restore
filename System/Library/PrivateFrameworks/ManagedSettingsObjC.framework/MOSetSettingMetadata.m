@implementation MOSetSettingMetadata

- (NSSet)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOSetSettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (MOSetSettingMetadata)initWithSettingName:(id)a3 defaultSet:(id)a4 combineOperator:(int64_t)a5 maximumCount:(unint64_t)a6 isPublic:(BOOL)a7 scope:(id)a8 isPrivacySensitive:(BOOL)a9
{
  MOSetSettingMetadata *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MOSetSettingMetadata;
  result = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v12, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, a3, a4, a7, a8, a9);
  result->_combineOperator = a5;
  result->_maximumCount = a6;
  return result;
}

- (id)persistableValueFromValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "allObjects");
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
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v5 = v4;
  if (objc_msgSend(v5, "count") > self->_maximumCount)
  {

LABEL_4:
    v5 = 0;
  }

  return v5;
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
  -[MOSetSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSetSettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
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
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSetSettingMetadata _combine:with:](self, "_combine:with:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t combineOperator;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  v8 = v7;
  combineOperator = self->_combineOperator;
  if (combineOperator == 1)
  {
    objc_msgSend(v7, "unionSet:", v6);
  }
  else if (!combineOperator)
  {
    objc_msgSend(v7, "intersectSet:", v6);
  }
  v10 = (void *)objc_msgSend(v8, "copy");

  return v10;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

@end
