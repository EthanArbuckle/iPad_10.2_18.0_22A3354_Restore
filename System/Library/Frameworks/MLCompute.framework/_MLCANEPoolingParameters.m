@implementation _MLCANEPoolingParameters

+ (id)poolingUnitParametersWith:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPoolingParams:", v4);

  return v5;
}

- (_MLCANEPoolingParameters)initWithPoolingParams:(id)a3
{
  id v5;
  _MLCANEPoolingParameters *v6;
  _MLCANEPoolingParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANEPoolingParameters;
  v6 = -[_MLCANEPoolingParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_poolingParams, a3);

  return v7;
}

- (NSDictionary)poolingParams
{
  return self->_poolingParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poolingParams, 0);
}

@end
