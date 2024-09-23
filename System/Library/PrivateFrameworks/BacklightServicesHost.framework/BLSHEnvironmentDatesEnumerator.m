@implementation BLSHEnvironmentDatesEnumerator

+ (id)createWithInitialSpecifier:(id)a3 enumerator:(id)a4 dateInterval:(id)a5 environment:(id)a6 sourceModel:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[BLSHEnvironmentDatesEnumerator initWithInitialSpecifier:enumerator:dateInterval:environment:sourceModel:]((id *)[BLSHEnvironmentDatesEnumerator alloc], v15, v14, v13, v12, v11);

  return v16;
}

- (id)initWithInitialSpecifier:(void *)a3 enumerator:(void *)a4 dateInterval:(void *)a5 environment:(void *)a6 sourceModel:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  id v18;
  objc_super v19;

  v18 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)BLSHEnvironmentDatesEnumerator;
    v16 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (BLSAlwaysOnDateSpecifier)specifier
{
  BLSAlwaysOnDateSpecifier *specifier;
  BLSAlwaysOnDateSpecifier *v3;
  id v4;
  void *v5;

  specifier = self->_specifier;
  if (specifier)
  {
    v3 = specifier;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BE0B818]);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (BLSAlwaysOnDateSpecifier *)objc_msgSend(v4, "initWithDate:fidelity:", v5, 0);

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightSceneHostEnvironment identifier](self->_environment, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("environment"));

  -[BLSAlwaysOnDateSpecifier bls_shortLoggingString](self->_specifier, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("next"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifier, a3);
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (BLSHEnvironmentDatesModel)sourceModel
{
  return self->_sourceModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceModel, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
