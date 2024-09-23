@implementation CMISmartStyleV1

- (CMISmartStyleV1)init
{
  CMISmartStyleV1 *v2;
  CMISmartStyleV1 *v3;
  NSString *castType;
  CMISmartStyleV1 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMISmartStyleV1;
  v2 = -[CMISmartStyleV1 init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    castType = v2->_castType;
    v2->_castType = (NSString *)CFSTR("Standard");

    *(_QWORD *)&v3->_castIntensity = 0;
    v3->_colorBias = 0.0;
    v5 = v3;
  }
  else
  {
    FigDebugAssert3();
  }

  return v3;
}

- (CMISmartStyleV1)initWithCastType:(id)a3 castIntensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6
{
  id v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  CMISmartStyleV1 *v15;
  CMISmartStyleV1 *v16;
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
    v18.super_class = (Class)CMISmartStyleV1;
    v15 = -[CMISmartStyleV1 init](&v18, sel_init);
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

- (void)setCastType:(id)a3
{
  id v5;

  v5 = a3;
  if ((isValidCastType(v5) & 1) != 0)
    objc_storeStrong((id *)&self->_castType, a3);
  else
    FigDebugAssert3();

}

- (void)setCastIntensity:(float)a3
{
  if (a3 < 0.0 || a3 > 1.0)
    FigDebugAssert3();
  else
    self->_castIntensity = a3;
}

- (void)setToneBias:(float)a3
{
  if (a3 < -1.0 || a3 > 1.0)
    FigDebugAssert3();
  else
    self->_toneBias = a3;
}

- (void)setColorBias:(float)a3
{
  if (a3 < -1.0 || a3 > 1.0)
    FigDebugAssert3();
  else
    self->_colorBias = a3;
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
