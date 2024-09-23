@implementation _HKCompoundDimension

+ (id)dimensionWithBaseDimensions:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBaseDimensions:", v4);

  return v5;
}

- (id)_initWithBaseDimensions:(id)a3
{
  id v4;
  _HKCompoundDimension *v5;
  uint64_t v6;
  _HKFactorization *baseDimensions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKCompoundDimension;
  v5 = -[_HKDimension init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    baseDimensions = v5->_baseDimensions;
    v5->_baseDimensions = (_HKFactorization *)v6;

  }
  return v5;
}

- (id)_baseDimensions
{
  return self->_baseDimensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseDimensions, 0);
}

@end
