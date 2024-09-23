@implementation MLLazyUnionBatchProvider

- (MLLazyUnionBatchProvider)initWithFeaturesFrom:(id)a3 addedToFeaturesFrom:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  MLLazyUnionBatchProvider *v12;
  id *p_isa;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "count");
  if (v11 == objc_msgSend(v10, "count"))
  {
    v17.receiver = self;
    v17.super_class = (Class)MLLazyUnionBatchProvider;
    v12 = -[MLLazyUnionBatchProvider init](&v17, sel_init);
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_first, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    a5 = (id *)&self->super.isa;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Cannot merge batch of size %@ with batch of size %@"), v14, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return (MLLazyUnionBatchProvider *)a5;
}

- (int64_t)count
{
  return -[MLBatchProvider count](self->_first, "count");
}

- (id)featuresAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[MLBatchProvider featuresAtIndex:](self->_first, "featuresAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLBatchProvider featuresAtIndex:](self->_second, "featuresAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:](MLFeatureProviderUtils, "lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MLBatchProvider)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
  objc_storeStrong((id *)&self->_first, a3);
}

- (MLBatchProvider)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
  objc_storeStrong((id *)&self->_second, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end
