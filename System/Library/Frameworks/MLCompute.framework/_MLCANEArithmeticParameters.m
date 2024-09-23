@implementation _MLCANEArithmeticParameters

+ (id)arithmeticUnitParametersWith:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArithmeticParams:", v4);

  return v5;
}

- (_MLCANEArithmeticParameters)initWithArithmeticParams:(id)a3
{
  id v5;
  _MLCANEArithmeticParameters *v6;
  _MLCANEArithmeticParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANEArithmeticParameters;
  v6 = -[_MLCANEArithmeticParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_arithmeticParams, a3);

  return v7;
}

- (NSArray)arithmeticParams
{
  return self->_arithmeticParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arithmeticParams, 0);
}

@end
