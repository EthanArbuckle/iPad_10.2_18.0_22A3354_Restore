@implementation SGMultiLabelEspressoClassifierCached

- (SGMultiLabelEspressoClassifierCached)initWithEspressoModelFile:(id)a3
{
  id v5;
  SGMultiLabelEspressoClassifierCached *v6;
  SGMultiLabelEspressoClassifierCached *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMultiLabelEspressoClassifierCached;
  v6 = -[SGMultiLabelEspressoClassifierCached init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_espressoModelFile, a3);

  return v7;
}

- (id)predict:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[SGMultiLabelEspressoClassifierCache sharedInstance](SGMultiLabelEspressoClassifierCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predict:withFile:", v4, self->_espressoModelFile);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)outputDimension
{
  void *v3;
  unint64_t v4;

  +[SGMultiLabelEspressoClassifierCache sharedInstance](SGMultiLabelEspressoClassifierCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "outputDimensionWithFile:", self->_espressoModelFile);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoModelFile, 0);
}

+ (id)classifierWithEspressoModelFile:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (+[SGMultiLabelEspressoClassifierCache sharedInstance](SGMultiLabelEspressoClassifierCache, "sharedInstance"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "setCachedEspressoClassifierWithFile:", v4), v5, v6))
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEspressoModelFile:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
