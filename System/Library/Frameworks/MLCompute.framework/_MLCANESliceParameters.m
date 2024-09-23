@implementation _MLCANESliceParameters

+ (id)sliceUnitParametersWith:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSliceParams:", v4);

  return v5;
}

- (_MLCANESliceParameters)initWithSliceParams:(id)a3
{
  id v5;
  _MLCANESliceParameters *v6;
  _MLCANESliceParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANESliceParameters;
  v6 = -[_MLCANESliceParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sliceParams, a3);

  return v7;
}

- (NSArray)sliceParams
{
  return self->_sliceParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliceParams, 0);
}

@end
