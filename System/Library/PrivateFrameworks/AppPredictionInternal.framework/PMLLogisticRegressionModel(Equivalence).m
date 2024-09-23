@implementation PMLLogisticRegressionModel(Equivalence)

- (uint64_t)isEqual:()Equivalence
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = v4;
  if (v4 == a1)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = objc_msgSend(a1, "isEqualToPMLLogisticRegressionModel:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)isEqualToPMLLogisticRegressionModel:()Equivalence
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "weights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asMutableDenseVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "weights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "asMutableDenseVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  return v9;
}

@end
