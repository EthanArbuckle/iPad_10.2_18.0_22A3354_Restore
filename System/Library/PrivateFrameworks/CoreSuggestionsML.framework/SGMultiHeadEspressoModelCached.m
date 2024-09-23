@implementation SGMultiHeadEspressoModelCached

- (SGMultiHeadEspressoModelCached)initWithEspressoModelFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGMultiHeadEspressoModelCached *v12;
  SGMultiHeadEspressoModelCached *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGMultiHeadEspressoModelCached;
  v12 = -[SGMultiHeadEspressoModelCached init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_espressoModelFile, a3);
    objc_storeStrong((id *)&v13->_inputName, a4);
    objc_storeStrong((id *)&v13->_headDimensionality, a5);
  }

  return v13;
}

- (id)predict:(id)a3 heads:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[SGMultiHeadEspressoModelCache sharedInstance](SGMultiHeadEspressoModelCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predict:heads:withFile:inputName:headDimensionality:", v7, v6, self->_espressoModelFile, self->_inputName, self->_headDimensionality);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predict:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[SGMultiHeadEspressoModelCache sharedInstance](SGMultiHeadEspressoModelCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predict:withFile:inputName:headDimensionality:", v4, self->_espressoModelFile, self->_inputName, self->_headDimensionality);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)inputNumParameters
{
  void *v3;
  unint64_t v4;

  +[SGMultiHeadEspressoModelCache sharedInstance](SGMultiHeadEspressoModelCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inputNumParametersWithFile:inputName:headDimensionality:", self->_espressoModelFile, self->_inputName, self->_headDimensionality);

  return v4;
}

- (id)headDimensionality
{
  void *v3;
  void *v4;

  +[SGMultiHeadEspressoModelCache sharedInstance](SGMultiHeadEspressoModelCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headDimensionalityWithFile:inputName:headDimensionality:", self->_espressoModelFile, self->_inputName, self->_headDimensionality);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headDimensionality, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_espressoModelFile, 0);
}

+ (id)classifierWithEspressoModelFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length")
    && (+[SGMultiHeadEspressoModelCache sharedInstance](SGMultiHeadEspressoModelCache, "sharedInstance"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "setCachedEspressoClassifierWithFile:inputName:headDimensionality:", v8, v9, v10),
        v11,
        v12))
  {
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEspressoModelFile:inputName:headDimensionality:", v8, v9, v10);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
