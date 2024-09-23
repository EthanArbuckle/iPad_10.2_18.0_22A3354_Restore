@implementation CMIImmutableSmartStyleV1

- (CMIImmutableSmartStyleV1)initWithCastType:(id)a3 castIntensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6
{
  id v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  CMIImmutableSmartStyleV1 *v15;
  CMIImmutableSmartStyleV1 *v16;
  objc_super v18;

  v11 = a3;
  if ((isValidCastType(v11) & 1) == 0
    || (a4 >= 0.0 ? (v12 = a4 > 1.0) : (v12 = 1),
        v12 || (a5 >= -1.0 ? (v13 = a5 > 1.0) : (v13 = 1), v13 || (a6 >= -1.0 ? (v14 = a6 > 1.0) : (v14 = 1), v14))))
  {
    FigDebugAssert3();

    v16 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CMIImmutableSmartStyleV1;
    v15 = -[CMIImmutableSmartStyleV1 init](&v18, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_castType, a3);
      v16->_castIntensity = a4;
      v16->_toneBias = a5;
      v16->_colorBias = a6;
    }
    else
    {
      FigDebugAssert3();
    }
  }

  return v16;
}

- (unsigned)smartStyleVersion
{
  return 1;
}

- (id)mutableCopy
{
  CMISmartStyleV1 *v3;
  double v4;
  double v5;
  double v6;

  v3 = [CMISmartStyleV1 alloc];
  *(float *)&v4 = self->_castIntensity;
  *(float *)&v5 = self->_toneBias;
  *(float *)&v6 = self->_colorBias;
  return -[CMISmartStyleV1 initWithCastType:castIntensity:toneBias:colorBias:](v3, "initWithCastType:castIntensity:toneBias:colorBias:", self->_castType, v4, v5, v6);
}

- (NSString)castType
{
  return self->_castType;
}

- (float)castIntensity
{
  return self->_castIntensity;
}

- (float)toneBias
{
  return self->_toneBias;
}

- (float)colorBias
{
  return self->_colorBias;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_castType, 0);
}

@end
