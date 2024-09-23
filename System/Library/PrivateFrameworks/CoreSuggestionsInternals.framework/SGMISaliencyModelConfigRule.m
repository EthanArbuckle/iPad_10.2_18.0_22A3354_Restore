@implementation SGMISaliencyModelConfigRule

- (SGMISaliencyModelConfigRule)initWithFeatureName:(id)a3 strictLowerBound:(id)a4 strictUpperBound:(id)a5 output:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SGMISaliencyModelConfigRule *v15;
  SGMISaliencyModelConfigRule *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SGMISaliencyModelConfigRule;
  v15 = -[SGMISaliencyModelConfigRule init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_featureName, a3);
    objc_storeStrong((id *)&v16->_strictLowerBound, a4);
    objc_storeStrong((id *)&v16->_strictUpperBound, a5);
    objc_storeStrong((id *)&v16->_output, a6);
  }

  return v16;
}

- (SGMISaliencyModelConfigRule)initWithDictionary:(id)a3
{
  id v4;
  SGMISaliencyModelConfigRule *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSNumber *featureName;
  uint64_t v10;
  NSNumber *strictLowerBound;
  uint64_t v12;
  NSNumber *strictUpperBound;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGMISaliencyModelConfigRule;
  v5 = -[SGMISaliencyModelConfigRule init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feature"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIFeature prettyNamesReverseMapping](SGMIFeature, "prettyNamesReverseMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    featureName = v5->_featureName;
    v5->_featureName = (NSNumber *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("strictLowerBound"));
    v10 = objc_claimAutoreleasedReturnValue();
    strictLowerBound = v5->_strictLowerBound;
    v5->_strictLowerBound = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("strictUpperBound"));
    v12 = objc_claimAutoreleasedReturnValue();
    strictUpperBound = v5->_strictUpperBound;
    v5->_strictUpperBound = (NSNumber *)v12;

  }
  return v5;
}

- (NSNumber)featureName
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)strictLowerBound
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)strictUpperBound
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)output
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_strictUpperBound, 0);
  objc_storeStrong((id *)&self->_strictLowerBound, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
