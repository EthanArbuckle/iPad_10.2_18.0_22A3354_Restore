@implementation BSUIVibrancyValues

- (BSUIVibrancyValues)init
{
  BSUIVibrancyConfiguration *v3;
  BSUIVibrancyValues *v4;

  v3 = objc_alloc_init(BSUIVibrancyConfiguration);
  v4 = -[BSUIVibrancyValues initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (BSUIVibrancyValues)initWithConfiguration:(id)a3
{
  id v4;
  BSUIVibrancyValues *v5;
  BSUIVibrancyValues *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BSUIVibrancyValues;
  v5 = -[BSUIVibrancyValues init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BSUIVibrancyValues calculateValuesForConfiguration:](v5, "calculateValuesForConfiguration:", v4);

  return v6;
}

- (int64_t)resolvedEffectType
{
  return self->_resolvedEffectType;
}

- (NSString)resolvedGroupName
{
  return self->_resolvedGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedGroupName, 0);
}

@end
