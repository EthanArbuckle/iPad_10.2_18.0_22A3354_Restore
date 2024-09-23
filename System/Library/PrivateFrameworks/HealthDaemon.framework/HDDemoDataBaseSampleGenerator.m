@implementation HDDemoDataBaseSampleGenerator

- (HDDemoDataBaseSampleGenerator)init
{
  HDDemoDataBaseSampleGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataBaseSampleGenerator;
  result = -[HDDemoDataBaseSampleGenerator init](&v3, sel_init);
  if (result)
    result->_createdFromNSKeyedUnarchiver = 0;
  return result;
}

- (BOOL)_createdFromNSKeyedUnarchiver
{
  return self->_createdFromNSKeyedUnarchiver;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDemoDataBaseSampleGenerator)initWithCoder:(id)a3
{
  HDDemoDataBaseSampleGenerator *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDDemoDataBaseSampleGenerator;
  result = -[HDDemoDataBaseSampleGenerator init](&v4, sel_init, a3);
  if (result)
    result->_createdFromNSKeyedUnarchiver = 1;
  return result;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_demoDataGenerator, a3);
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDDemoDataGenerator)demoDataGenerator
{
  return (HDDemoDataGenerator *)objc_loadWeakRetained((id *)&self->_demoDataGenerator);
}

- (void)setDemoDataGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_demoDataGenerator, a3);
}

- (BOOL)createdFromNSKeyedUnarchiver
{
  return self->_createdFromNSKeyedUnarchiver;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_demoDataGenerator);
  objc_destroyWeak((id *)&self->_profile);
}

@end
