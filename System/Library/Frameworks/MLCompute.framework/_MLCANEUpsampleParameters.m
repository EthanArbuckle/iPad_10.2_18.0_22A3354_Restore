@implementation _MLCANEUpsampleParameters

+ (id)upsampleUnitParametersWith:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;

  v8 = a3;
  v9 = objc_alloc((Class)a1);
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  v12 = (void *)objc_msgSend(v9, "initWithUpsampleParams:scaleFactorX:scaleFactorY:", v8, v10, v11);

  return v12;
}

- (_MLCANEUpsampleParameters)initWithUpsampleParams:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5
{
  id v9;
  _MLCANEUpsampleParameters *v10;
  _MLCANEUpsampleParameters *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MLCANEUpsampleParameters;
  v10 = -[_MLCANEUpsampleParameters init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_upsampleParams, a3);
    v11->_scaleFactorX = a4;
    v11->_scaleFactorY = a5;
  }

  return v11;
}

- (NSDictionary)upsampleParams
{
  return self->_upsampleParams;
}

- (float)scaleFactorX
{
  return self->_scaleFactorX;
}

- (float)scaleFactorY
{
  return self->_scaleFactorY;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upsampleParams, 0);
}

@end
