@implementation _CDPrivacyPolicy

- (double)temporalPrecision
{
  return self->temporalPrecision;
}

- (BOOL)canPersistOnStorage
{
  return self->canPersistOnStorage;
}

- (_CDPrivacyPolicy)initWithTemporalPrecision:(double)a3 canPersistOnStorage:(BOOL)a4
{
  _CDPrivacyPolicy *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CDPrivacyPolicy;
  result = -[_CDPrivacyPolicy init](&v7, sel_init);
  if (result)
  {
    result->temporalPrecision = a3;
    result->canPersistOnStorage = a4;
  }
  return result;
}

+ (id)sharedPrivacyPolicy
{
  if (sharedPrivacyPolicy_onceToken != -1)
    dispatch_once(&sharedPrivacyPolicy_onceToken, &__block_literal_global_7);
  return (id)sharedPrivacyPolicy__sharedPrivacyPolicy;
}

- (_CDPrivacyPolicy)init
{
  return -[_CDPrivacyPolicy initWithTemporalPrecision:canPersistOnStorage:](self, "initWithTemporalPrecision:canPersistOnStorage:", 0, 64.0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { temporalPrecision=%f, canPersistOnStorage=%d }"), v5, *(_QWORD *)&self->temporalPrecision, self->canPersistOnStorage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
