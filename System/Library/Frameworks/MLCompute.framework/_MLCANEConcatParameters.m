@implementation _MLCANEConcatParameters

+ (id)concatUnitParametersWith:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConcatParams:", v4);

  return v5;
}

- (_MLCANEConcatParameters)initWithConcatParams:(id)a3
{
  id v5;
  _MLCANEConcatParameters *v6;
  _MLCANEConcatParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANEConcatParameters;
  v6 = -[_MLCANEConcatParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_concatParams, a3);

  return v7;
}

- (NSDictionary)concatParams
{
  return self->_concatParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concatParams, 0);
}

@end
