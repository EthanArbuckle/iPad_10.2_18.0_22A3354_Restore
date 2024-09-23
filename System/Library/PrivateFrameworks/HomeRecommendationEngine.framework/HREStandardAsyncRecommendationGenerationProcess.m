@implementation HREStandardAsyncRecommendationGenerationProcess

- (HREStandardAsyncRecommendationGenerationProcess)initWithHome:(id)a3 sourceItems:(id)a4 accessoryTypeGroup:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  HREStandardAsyncRecommendationGenerationProcess *v14;
  HREStandardAsyncRecommendationGenerationProcess *v15;
  uint64_t v16;
  NSSet *sourceItems;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HREStandardAsyncRecommendationGenerationProcess;
  v14 = -[HREStandardAsyncRecommendationGenerationProcess init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    sourceItems = v15->_sourceItems;
    v15->_sourceItems = (NSSet *)v16;

    objc_storeStrong((id *)&v15->_typeGroup, a5);
    v15->_options = a6;
  }

  return v15;
}

- (BOOL)shouldGenerateRecommendations
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[HREStandardAsyncRecommendationGenerationProcess sourceItems](self, "sourceItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[HREStandardAsyncRecommendationGenerationProcess sourceRecommendableObjects](self, "sourceRecommendableObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      return 0;
  }
  else
  {

  }
  -[HREStandardAsyncRecommendationGenerationProcess typeGroup](self, "typeGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    return 1;
  v8 = (void *)v7;
  -[HREStandardAsyncRecommendationGenerationProcess sourceRecommendableObjects](self, "sourceRecommendableObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "count") != 0;

  return v6;
}

- (id)generateRecommendations
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HREStandardAsyncRecommendationSource.m"), 158, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HREStandardAsyncRecommendationGenerationProcess generateRecommendations]", objc_opt_class());

  return (id)objc_opt_new();
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSSet)sourceItems
{
  return self->_sourceItems;
}

- (void)setSourceItems:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItems, a3);
}

- (HFAccessoryTypeGroup)typeGroup
{
  return self->_typeGroup;
}

- (void)setTypeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_typeGroup, a3);
}

- (NSSet)sourceRecommendableObjects
{
  return self->_sourceRecommendableObjects;
}

- (void)setSourceRecommendableObjects:(id)a3
{
  objc_storeStrong((id *)&self->_sourceRecommendableObjects, a3);
}

- (NSSet)homeRecommendableObjects
{
  return self->_homeRecommendableObjects;
}

- (void)setHomeRecommendableObjects:(id)a3
{
  objc_storeStrong((id *)&self->_homeRecommendableObjects, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeRecommendableObjects, 0);
  objc_storeStrong((id *)&self->_sourceRecommendableObjects, 0);
  objc_storeStrong((id *)&self->_typeGroup, 0);
  objc_storeStrong((id *)&self->_sourceItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
