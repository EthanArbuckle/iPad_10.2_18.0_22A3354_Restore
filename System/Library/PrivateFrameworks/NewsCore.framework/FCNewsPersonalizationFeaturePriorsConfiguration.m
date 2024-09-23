@implementation FCNewsPersonalizationFeaturePriorsConfiguration

- (FCNewsPersonalizationFeaturePriorsConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationFeaturePriorsConfiguration *v5;
  void *v6;
  FCNewsPersonalizationFeaturePrior *v7;
  FCNewsPersonalizationFeaturePrior *v8;
  void *v9;
  FCNewsPersonalizationFeaturePrior *v10;
  FCNewsPersonalizationFeaturePrior *v11;
  FCNewsPersonalizationFeaturePrior *v12;
  FCNewsPersonalizationFeaturePriorsConfiguration *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCNewsPersonalizationFeaturePriorsConfiguration;
  v5 = -[FCNewsPersonalizationFeaturePriorsConfiguration init](&v15, sel_init);
  if (!v5)
    goto LABEL_5;
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("baseline"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCNewsPersonalizationFeaturePrior initWithDictionary:]([FCNewsPersonalizationFeaturePrior alloc], "initWithDictionary:", v6);
  if (!v7)
  {
LABEL_7:

    v13 = 0;
    goto LABEL_8;
  }
  v8 = v7;
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("general"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCNewsPersonalizationFeaturePrior initWithDictionary:]([FCNewsPersonalizationFeaturePrior alloc], "initWithDictionary:", v9);
  v11 = v10;
  if (!v10)
  {

    goto LABEL_7;
  }
  v12 = v10;
  -[FCNewsPersonalizationFeaturePriorsConfiguration setBaselineFeaturePrior:](v5, "setBaselineFeaturePrior:", v8);
  -[FCNewsPersonalizationFeaturePriorsConfiguration setGeneralFeaturePrior:](v5, "setGeneralFeaturePrior:", v12);

LABEL_5:
  v13 = v5;
LABEL_8:

  return v13;
}

- (void)setGeneralFeaturePrior:(id)a3
{
  objc_storeStrong((id *)&self->_generalFeaturePrior, a3);
}

- (void)setBaselineFeaturePrior:(id)a3
{
  objc_storeStrong((id *)&self->_baselineFeaturePrior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generalFeaturePrior, 0);
  objc_storeStrong((id *)&self->_baselineFeaturePrior, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationFeaturePriorsConfiguration baselineFeaturePrior](self, "baselineFeaturePrior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; baselineDictionary: %@"), v4);

  -[FCNewsPersonalizationFeaturePriorsConfiguration generalFeaturePrior](self, "generalFeaturePrior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; generalFeaturePrior: %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (FCNewsPersonalizationFeaturePrior)baselineFeaturePrior
{
  return self->_baselineFeaturePrior;
}

- (FCNewsPersonalizationFeaturePrior)generalFeaturePrior
{
  return self->_generalFeaturePrior;
}

@end
