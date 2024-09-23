@implementation SGMISaliencyModelFeatureProvider

- (SGMISaliencyModelFeatureProvider)initWithData:(id)a3
{
  id v5;
  SGMISaliencyModelFeatureProvider *v6;
  SGMISaliencyModelFeatureProvider *v7;
  void *v8;
  uint64_t v9;
  NSSet *featureNames;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGMISaliencyModelFeatureProvider;
  v6 = -[SGMISaliencyModelFeatureProvider init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("featureVector"), 0);
    objc_autoreleasePoolPop(v8);
    featureNames = v7->_featureNames;
    v7->_featureNames = (NSSet *)v9;

  }
  return v7;
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (-[NSSet containsObject:](self->_featureNames, "containsObject:", a3))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", self->_data);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MLMultiArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSSet)featureNames
{
  return self->_featureNames;
}

- (void)setFeatureNames:(id)a3
{
  objc_storeStrong((id *)&self->_featureNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
