@implementation _NSCompositeLayoutYAxisAnchor

- (_NSCompositeLayoutYAxisAnchor)initWithAnchor:(id)a3 plusDimension:(id)a4 times:(double)a5 plus:(double)a6
{
  _NSCompositeLayoutYAxisAnchor *v10;
  uint64_t v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_NSCompositeLayoutYAxisAnchor;
  v10 = -[NSLayoutAnchor init](&v14, sel_init);
  if (v10)
  {
    v10->_yAxisAnchor = (NSLayoutYAxisAnchor *)objc_msgSend(a3, "copy");
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

- (_NSCompositeLayoutYAxisAnchor)initWithAnchor:(id)a3
{
  _NSCompositeLayoutYAxisAnchor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSCompositeLayoutYAxisAnchor;
  v4 = -[NSLayoutAnchor initWithAnchor:](&v6, sel_initWithAnchor_);
  if (v4)
  {
    v4->_yAxisAnchor = (NSLayoutYAxisAnchor *)objc_msgSend(*((id *)a3 + 8), "copy");
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
  v3.super_class = (Class)_NSCompositeLayoutYAxisAnchor;
  -[NSLayoutAnchor dealloc](&v3, sel_dealloc);
}

- (_NSCompositeLayoutYAxisAnchor)initWithCoder:(id)a3
{
  _NSCompositeLayoutYAxisAnchor *v4;
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
  v14.super_class = (Class)_NSCompositeLayoutYAxisAnchor;
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
    v4->_yAxisAnchor = (NSLayoutYAxisAnchor *)objc_msgSend(v5, "copy");
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
  v9.super_class = (Class)_NSCompositeLayoutYAxisAnchor;
  -[NSLayoutAnchor encodeWithCoder:](&v9, sel_encodeWithCoder_);
  dimension = self->_dimension;
  dimensionMultiplier = self->_dimensionMultiplier;
  constant = self->_constant;
  objc_msgSend(a3, "encodeObject:forKey:", self->_yAxisAnchor, CFSTR("NSLayoutAnchor_firstChildAnchor"));
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
  NSLayoutYAxisAnchor *yAxisAnchor;
  NSLayoutDimension *dimension;
  double dimensionMultiplier;
  double constant;
  id var2;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  id v17;

  yAxisAnchor = self->_yAxisAnchor;
  dimension = self->_dimension;
  dimensionMultiplier = self->_dimensionMultiplier;
  constant = self->_constant;
  var2 = a3->var2;
  v15 = *(_OWORD *)&a3->var0;
  v16 = *(_OWORD *)&a3->var0;
  v17 = var2;
  v8 = -[NSLayoutAnchor _expressionInContext:](yAxisAnchor, "_expressionInContext:", &v16);
  v9 = v8;
  if (dimension)
  {
    v16 = v15;
    v17 = var2;
    dimension = -[NSLayoutAnchor _expressionInContext:](dimension, "_expressionInContext:", &v16);
    v10 = objc_msgSend(v9, "variableCount");
    if (dimension)
    {
      v11 = -[NSLayoutDimension variableCount](dimension, "variableCount");
      v12 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v10 = objc_msgSend(v8, "variableCount");
  }
  v11 = 0;
  v12 = 1;
LABEL_6:
  v13 = +[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", v11 + v10, var2);
  objc_msgSend(v13, "addExpression:times:", v9, 1.0);
  if ((v12 & 1) == 0)
    objc_msgSend(v13, "addExpression:times:", dimension, dimensionMultiplier);
  objc_msgSend(v13, "incrementConstant:", constant);
  return v13;
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
  -[NSLayoutAnchor _valueInEngine:](self->_yAxisAnchor, "_valueInEngine:");
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
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("(%@"), -[NSLayoutAnchor _equationDescriptionInParent](self->_yAxisAnchor, "_equationDescriptionInParent"));
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
    v6[0] = self->_yAxisAnchor;
    v6[1] = dimension;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = 2;
  }
  else
  {
    v6[0] = self->_yAxisAnchor;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = 1;
  }
  return (NSArray *)objc_msgSend(v3, "arrayWithObjects:count:", v6, v4);
}

@end
