@implementation _NSCompositeLayoutXAxisAnchor

- (_NSCompositeLayoutXAxisAnchor)initWithAnchor:(id)a3 plusDimension:(id)a4 times:(double)a5 plus:(double)a6
{
  _NSCompositeLayoutXAxisAnchor *v10;
  uint64_t v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  v10 = -[NSLayoutAnchor init](&v14, sel_init);
  if (v10)
  {
    v10->_xAxisAnchor = (NSLayoutXAxisAnchor *)objc_msgSend(a3, "copy");
    v11 = objc_msgSend(a4, "copy");
    v10->_dimension = (NSLayoutDimension *)v11;
    v12 = 0.0;
    if (v11)
      v12 = a5;
    v10->_dimensionMultiplier = v12;
    v10->_constant = a6;
  }
  return v10;
}

- (_NSCompositeLayoutXAxisAnchor)initWithAnchor:(id)a3
{
  _NSCompositeLayoutXAxisAnchor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  v4 = -[NSLayoutAnchor initWithAnchor:](&v6, sel_initWithAnchor_);
  if (v4)
  {
    v4->_xAxisAnchor = (NSLayoutXAxisAnchor *)objc_msgSend(*((id *)a3 + 8), "copy");
    v4->_dimension = (NSLayoutDimension *)objc_msgSend(*((id *)a3 + 11), "copy");
    v4->_dimensionMultiplier = *((double *)a3 + 10);
    v4->_constant = *((double *)a3 + 9);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  -[NSLayoutAnchor dealloc](&v3, sel_dealloc);
}

- (_NSCompositeLayoutXAxisAnchor)initWithCoder:(id)a3
{
  _NSCompositeLayoutXAxisAnchor *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  int v9;
  double v10;
  float v11;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  v4 = -[NSLayoutAnchor initWithCoder:](&v14, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_firstChildAnchor"));
    if (!v5)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _CompositeAxisAnchor_InitWithCoder(NSCoder *, NSLayoutAnchor **, NSLayoutDimension ** _Nullable, CGFloat *, CGFloat *)"), CFSTR("NSDerivativeLayoutAnchor.m"), 306, CFSTR("NSLayoutAxisAnchor decoded with empty base anchor"));
    }
    v6 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_secondChildAnchor"));
    v4->_xAxisAnchor = (NSLayoutXAxisAnchor *)objc_msgSend(v5, "copy");
    v4->_dimension = (NSLayoutDimension *)objc_msgSend(v6, "copy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSLayoutAnchor_multiplier")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("NSLayoutAnchor_multiplier"));
      v8 = v7;
    }
    else
    {
      v8 = 1.0;
      if (!v4->_dimension)
        v8 = 0.0;
    }
    v4->_dimensionMultiplier = v8;
    v9 = objc_msgSend(a3, "containsValueForKey:", CFSTR("NSLayoutAnchor_constant"));
    v10 = 0.0;
    if (v9)
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("NSLayoutAnchor_constant"), 0.0);
      v10 = v11;
    }
    v4->_constant = v10;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSLayoutDimension *dimension;
  double dimensionMultiplier;
  double constant;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  -[NSLayoutAnchor encodeWithCoder:](&v9, sel_encodeWithCoder_);
  dimension = self->_dimension;
  dimensionMultiplier = self->_dimensionMultiplier;
  constant = self->_constant;
  objc_msgSend(a3, "encodeObject:forKey:", self->_xAxisAnchor, CFSTR("NSLayoutAnchor_firstChildAnchor"));
  if (dimension)
  {
    objc_msgSend(a3, "encodeObject:forKey:", dimension, CFSTR("NSLayoutAnchor_secondChildAnchor"));
    v8 = 1.0;
    if (dimensionMultiplier != 1.0)
    {
      *(float *)&v8 = dimensionMultiplier;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("NSLayoutAnchor_multiplier"), v8);
    }
  }
  if (constant != 0.0)
  {
    *(float *)&v8 = constant;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("NSLayoutAnchor_constant"), v8);
  }
}

- (id)_expressionInContext:(id *)a3
{
  int64_t var0;
  double v7;
  NSLayoutXAxisAnchor *xAxisAnchor;
  NSLayoutDimension *dimension;
  double dimensionMultiplier;
  double constant;
  id var2;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  __int128 v20;
  __int128 v21;
  id v22;

  var0 = a3->var0;
  if (-[NSLayoutXAxisAnchor _directionAbstraction](self->_xAxisAnchor, "_directionAbstraction") != 1 && var0 == 1)
    v7 = -1.0;
  else
    v7 = 1.0;
  xAxisAnchor = self->_xAxisAnchor;
  dimension = self->_dimension;
  dimensionMultiplier = self->_dimensionMultiplier;
  constant = self->_constant;
  var2 = a3->var2;
  v21 = *(_OWORD *)&a3->var0;
  v22 = var2;
  v13 = -[NSLayoutAnchor _expressionInContext:](xAxisAnchor, "_expressionInContext:", &v21, v21);
  v14 = v13;
  if (dimension)
  {
    v21 = v20;
    v22 = var2;
    dimension = -[NSLayoutAnchor _expressionInContext:](dimension, "_expressionInContext:", &v21);
    v15 = objc_msgSend(v14, "variableCount");
    if (dimension)
    {
      v16 = -[NSLayoutDimension variableCount](dimension, "variableCount");
      v17 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    v15 = objc_msgSend(v13, "variableCount");
  }
  v16 = 0;
  v17 = 1;
LABEL_12:
  v18 = +[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", v16 + v15, var2);
  objc_msgSend(v18, "addExpression:times:", v14, 1.0);
  if ((v17 & 1) == 0)
    objc_msgSend(v18, "addExpression:times:", dimension, v7 * dimensionMultiplier);
  objc_msgSend(v18, "incrementConstant:", v7 * constant);
  return v18;
}

- (double)_valueInEngine:(id)a3
{
  NSLayoutDimension *dimension;
  double dimensionMultiplier;
  double constant;
  double v7;
  double v8;
  double v9;

  dimension = self->_dimension;
  dimensionMultiplier = self->_dimensionMultiplier;
  constant = self->_constant;
  -[NSLayoutAnchor _valueInEngine:](self->_xAxisAnchor, "_valueInEngine:");
  v8 = v7;
  -[NSLayoutAnchor _valueInEngine:](dimension, "_valueInEngine:", a3);
  return constant + v8 + dimensionMultiplier * v9;
}

- (id)equationDescription
{
  NSLayoutDimension *dimension;
  double dimensionMultiplier;
  double constant;
  void *v5;
  void *v6;
  BOOL v7;
  double v8;
  const __CFString *v9;
  double v10;
  const __CFString *v11;

  dimension = self->_dimension;
  dimensionMultiplier = self->_dimensionMultiplier;
  constant = self->_constant;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("(%@"), -[NSLayoutAnchor _equationDescriptionInParent](self->_xAxisAnchor, "_equationDescriptionInParent"));
  v6 = v5;
  if (dimension)
  {
    v7 = dimensionMultiplier < 0.0;
    if (dimensionMultiplier != 0.0)
    {
      v8 = fabs(dimensionMultiplier);
      if (v7)
        v9 = CFSTR("-");
      else
        v9 = CFSTR("+");
      objc_msgSend(v5, "appendString:", v9);
      if (v8 != 1.0)
        objc_msgSend(v6, "appendFormat:", CFSTR("%g*"), *(_QWORD *)&v8);
      objc_msgSend(v6, "appendFormat:", CFSTR("%@"), -[NSLayoutAnchor _equationDescriptionInParent](dimension, "_equationDescriptionInParent"));
    }
  }
  if (constant != 0.0)
  {
    v10 = fabs(constant);
    if (constant >= 0.0)
      v11 = CFSTR("+%g");
    else
      v11 = CFSTR("-%g");
    objc_msgSend(v6, "appendFormat:", v11, *(_QWORD *)&v10);
  }
  objc_msgSend(v6, "appendString:", CFSTR(")"));
  return (id)objc_msgSend(v6, "copy");
}

- (NSArray)_childAnchors
{
  NSLayoutDimension *dimension;
  void *v3;
  uint64_t v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  dimension = self->_dimension;
  if (dimension)
  {
    v6[0] = self->_xAxisAnchor;
    v6[1] = dimension;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = 2;
  }
  else
  {
    v6[0] = self->_xAxisAnchor;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = 1;
  }
  return (NSArray *)objc_msgSend(v3, "arrayWithObjects:count:", v6, v4);
}

- (int64_t)_directionAbstraction
{
  return -[NSLayoutXAxisAnchor _directionAbstraction](self->_xAxisAnchor, "_directionAbstraction");
}

@end
