@implementation FCNewsPersonalizationAggregateModificationConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateModificationData, 0);
  objc_storeStrong((id *)&self->_baselineModificationData, 0);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationAggregateModificationConfiguration *v5;
  void *v6;
  FCNewsPersonalizationAggregateModificationData *v7;
  FCNewsPersonalizationAggregateModificationData *v8;
  FCNewsPersonalizationAggregateModificationData *v9;
  void *v10;
  FCNewsPersonalizationAggregateModificationData *v11;
  FCNewsPersonalizationAggregateModificationData *v12;
  FCNewsPersonalizationAggregateModificationData *v13;
  FCNewsPersonalizationAggregateModificationData *aggregateModificationData;
  FCNewsPersonalizationAggregateModificationConfiguration *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCNewsPersonalizationAggregateModificationConfiguration;
  v5 = -[FCNewsPersonalizationAggregateModificationConfiguration init](&v17, sel_init);
  if (!v5)
    goto LABEL_5;
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("baselineModificationData"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCNewsPersonalizationAggregateModificationData initWithDictionary:]([FCNewsPersonalizationAggregateModificationData alloc], "initWithDictionary:", v6);
  if (!v7)
  {
LABEL_7:

    v15 = 0;
    goto LABEL_8;
  }
  v8 = v7;
  v9 = v7;
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("aggregateModificationData"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCNewsPersonalizationAggregateModificationData initWithDictionary:]([FCNewsPersonalizationAggregateModificationData alloc], "initWithDictionary:", v10);
  v12 = v11;
  if (!v11)
  {

    goto LABEL_7;
  }
  v13 = v11;
  objc_storeStrong((id *)&v5->_baselineModificationData, v8);
  aggregateModificationData = v5->_aggregateModificationData;
  v5->_aggregateModificationData = v13;

LABEL_5:
  v15 = v5;
LABEL_8:

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationAggregateModificationConfiguration baselineModificationData](self, "baselineModificationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; baselineModificationData: %@"), v4);

  -[FCNewsPersonalizationAggregateModificationConfiguration aggregateModificationData](self, "aggregateModificationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; aggregateModificationData: %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (FCNewsPersonalizationAggregateModificationData)baselineModificationData
{
  return self->_baselineModificationData;
}

- (void)setBaselineModificationData:(id)a3
{
  objc_storeStrong((id *)&self->_baselineModificationData, a3);
}

- (FCNewsPersonalizationAggregateModificationData)aggregateModificationData
{
  return self->_aggregateModificationData;
}

- (void)setAggregateModificationData:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateModificationData, a3);
}

@end
