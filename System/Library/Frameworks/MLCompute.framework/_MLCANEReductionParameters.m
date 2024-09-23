@implementation _MLCANEReductionParameters

+ (id)reductionUnitParametersWith:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReductionParams:", v4);

  return v5;
}

- (_MLCANEReductionParameters)initWithReductionParams:(id)a3
{
  id v5;
  _MLCANEReductionParameters *v6;
  _MLCANEReductionParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANEReductionParameters;
  v6 = -[_MLCANEReductionParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reductionParams, a3);

  return v7;
}

- (NSDictionary)reductionParams
{
  return self->_reductionParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reductionParams, 0);
}

@end
