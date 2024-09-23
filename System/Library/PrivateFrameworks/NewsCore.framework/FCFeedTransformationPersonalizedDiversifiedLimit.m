@implementation FCFeedTransformationPersonalizedDiversifiedLimit

+ (id)transformationWithFunctionProvider:(id)a3
{
  return (id)objc_msgSend(a1, "transformationWithFunctionProvider:limit:", a3, -1);
}

+ (id)transformationWithFunctionProvider:(id)a3 limit:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setLimit:", a4);
  objc_msgSend(v6, "setFunctionProvider:", v5);

  return v6;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FCFeedTransformationPersonalizedDiversifiedLimit transformFeedItems:withRespectToLimit:](self, "transformFeedItems:withRespectToLimit:", v4, -[FCFeedTransformationPersonalizedDiversifiedLimit limit](self, "limit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transformFeedItems:(id)a3 withRespectToLimit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[FCFeedTransformationPersonalizedDiversifiedLimit functionProvider](self, "functionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FCFeedTransformationPersonalizedDiversifiedLimit functionProvider](self, "functionProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diversifyItems:limit:", v6, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (FCPersonalizationFunctionProviding)functionProvider
{
  return self->_functionProvider;
}

- (void)setFunctionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_functionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionProvider, 0);
}

@end
