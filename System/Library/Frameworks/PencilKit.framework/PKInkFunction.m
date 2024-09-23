@implementation PKInkFunction

- (PKInkFunction)initWithProperty:(unint64_t)a3 input:(unint64_t)a4 inputMask:(unint64_t)a5 deviceMask:(unint64_t)a6 inputPoints:(id)a7 minOutputPoints:(id)a8 maxOutputPoints:(id)a9 outputPoints:(id)a10 controlPoints:(id)a11 functionType:(unint64_t)a12
{
  id v15;
  id v16;
  id v17;
  id v18;
  PKInkFunction *v19;
  PKInkFunction *v20;
  id v26;
  objc_super v27;

  v15 = a7;
  v16 = a8;
  v17 = a9;
  v26 = a10;
  v18 = a11;
  v27.receiver = self;
  v27.super_class = (Class)PKInkFunction;
  v19 = -[PKInkFunction init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_inkProperty = a3;
    v19->_inkInput = a4;
    v19->_inputMask = a5;
    v19->_deviceMask = a6;
    objc_storeStrong((id *)&v19->_inputPoints, a7);
    objc_storeStrong((id *)&v20->_outputPoints, a10);
    objc_storeStrong((id *)&v20->_controlPoints, a11);
    objc_storeStrong((id *)&v20->_minOutputPoints, a8);
    objc_storeStrong((id *)&v20->_maxOutputPoints, a9);
    v20->_functionType = a12;
  }

  return v20;
}

- (PKInkFunction)initWithInputPoints:(id)a3 outputPoints:(id)a4 functionType:(unint64_t)a5
{
  id v9;
  id v10;
  PKInkFunction *v11;
  PKInkFunction *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKInkFunction;
  v11 = -[PKInkFunction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputPoints, a3);
    objc_storeStrong((id *)&v12->_outputPoints, a4);
    objc_storeStrong((id *)&v12->_minOutputPoints, a4);
    objc_storeStrong((id *)&v12->_maxOutputPoints, a4);
    v12->_functionType = a5;
  }

  return v12;
}

- (void)setControlPoints:(id)a3
{
  NSMutableArray **p_controlPoints;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  double v17;
  id v18;

  v18 = a3;
  p_controlPoints = &self->_controlPoints;
  objc_storeStrong((id *)&self->_controlPoints, a3);
  self->_functionType = 0;
  if (-[NSMutableArray count](self->_controlPoints, "count") == 4)
  {
    -[NSMutableArray objectAtIndexedSubscript:](*p_controlPoints, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;
    -[NSMutableArray objectAtIndexedSubscript:](*p_controlPoints, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;
    -[NSMutableArray objectAtIndexedSubscript:](*p_controlPoints, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;
    -[NSMutableArray objectAtIndexedSubscript:](*p_controlPoints, "objectAtIndexedSubscript:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;

    self->_functionType = +[PKInkProperties functionTypeForBezierControlPoints:](PKInkProperties, "functionTypeForBezierControlPoints:", v8, v11, v14, v17);
  }

}

- (double)solveForInput:(double)a3
{
  double (***v4)(_QWORD, double, double);
  double v5;
  _QWORD v7[4];
  double (***v8)(_QWORD, double, double);

  +[PKInkBehavior outputFunctionFromInkFunction:](v7, (uint64_t)PKInkBehavior, self);
  v4 = v8;
  v5 = (**v8)(v8, a3, 0.0);
  ((void (*)(double (***)(_QWORD, double, double)))(*v4)[5])(v4);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  +[PKInkProperties inkPropertyNames](PKInkProperties, "inkPropertyNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_inkProperty);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeysForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKInkProperties inputNames](PKInkProperties, "inputNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_inkInput);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeysForObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<PKInkFunction: %p %@ -> %@>"), self, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)inkProperty
{
  return self->_inkProperty;
}

- (void)setInkProperty:(unint64_t)a3
{
  self->_inkProperty = a3;
}

- (unint64_t)inkInput
{
  return self->_inkInput;
}

- (void)setInkInput:(unint64_t)a3
{
  self->_inkInput = a3;
}

- (unint64_t)inputMask
{
  return self->_inputMask;
}

- (void)setInputMask:(unint64_t)a3
{
  self->_inputMask = a3;
}

- (unint64_t)deviceMask
{
  return self->_deviceMask;
}

- (void)setDeviceMask:(unint64_t)a3
{
  self->_deviceMask = a3;
}

- (NSMutableArray)inputPoints
{
  return self->_inputPoints;
}

- (void)setInputPoints:(id)a3
{
  objc_storeStrong((id *)&self->_inputPoints, a3);
}

- (NSMutableArray)minOutputPoints
{
  return self->_minOutputPoints;
}

- (void)setMinOutputPoints:(id)a3
{
  objc_storeStrong((id *)&self->_minOutputPoints, a3);
}

- (NSMutableArray)maxOutputPoints
{
  return self->_maxOutputPoints;
}

- (void)setMaxOutputPoints:(id)a3
{
  objc_storeStrong((id *)&self->_maxOutputPoints, a3);
}

- (NSMutableArray)outputPoints
{
  return self->_outputPoints;
}

- (void)setOutputPoints:(id)a3
{
  objc_storeStrong((id *)&self->_outputPoints, a3);
}

- (unint64_t)functionType
{
  return self->_functionType;
}

- (void)setFunctionType:(unint64_t)a3
{
  self->_functionType = a3;
}

- (NSMutableArray)controlPoints
{
  return self->_controlPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPoints, 0);
  objc_storeStrong((id *)&self->_outputPoints, 0);
  objc_storeStrong((id *)&self->_maxOutputPoints, 0);
  objc_storeStrong((id *)&self->_minOutputPoints, 0);
  objc_storeStrong((id *)&self->_inputPoints, 0);
}

@end
