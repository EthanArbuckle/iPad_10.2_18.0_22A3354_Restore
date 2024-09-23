@implementation _NSArithmeticLayoutDimension

- (_NSArithmeticLayoutDimension)initWithMultiplier:(double)a3 dimension:(id)a4 constant:(double)a5
{
  _NSArithmeticLayoutDimension *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NSArithmeticLayoutDimension;
  v8 = -[NSLayoutAnchor init](&v10, sel_init);
  if (v8)
  {
    v8->_rootLayoutDimension = (NSLayoutDimension *)objc_msgSend(a4, "copy");
    v8->_multiplier = a3;
    v8->_constant = a5;
  }
  return v8;
}

- (_NSArithmeticLayoutDimension)initWithAnchor:(id)a3
{
  _NSArithmeticLayoutDimension *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSArithmeticLayoutDimension;
  v4 = -[NSLayoutAnchor initWithAnchor:](&v6, sel_initWithAnchor_);
  if (v4)
  {
    v4->_rootLayoutDimension = (NSLayoutDimension *)objc_msgSend(*((id *)a3 + 8), "copy");
    v4->_multiplier = *((double *)a3 + 9);
    v4->_constant = *((double *)a3 + 10);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSArithmeticLayoutDimension;
  -[NSLayoutAnchor dealloc](&v3, sel_dealloc);
}

- (_NSArithmeticLayoutDimension)initWithCoder:(id)a3
{
  _NSArithmeticLayoutDimension *v5;
  void *v6;
  int v7;
  double v8;
  float v9;
  int v10;
  double v11;
  float v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_NSArithmeticLayoutDimension;
  v5 = -[NSLayoutAnchor initWithCoder:](&v14, sel_initWithCoder_);
  if (v5)
  {
    v6 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_firstChildAnchor"));
    if (!v6)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("NSDerivativeLayoutAnchor.m"), 52, CFSTR("%@ decoded with empty root dimension"), v5);
    v5->_rootLayoutDimension = (NSLayoutDimension *)objc_msgSend(v6, "copy");
    v7 = objc_msgSend(a3, "containsValueForKey:", CFSTR("NSLayoutAnchor_multiplier"));
    v8 = 1.0;
    if (v7)
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("NSLayoutAnchor_multiplier"), 1.0);
      v8 = v9;
    }
    v5->_multiplier = v8;
    v10 = objc_msgSend(a3, "containsValueForKey:", CFSTR("NSLayoutAnchor_constant"));
    v11 = 0.0;
    if (v10)
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("NSLayoutAnchor_constant"), 0.0);
      v11 = v12;
    }
    v5->_constant = v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double multiplier;
  double constant;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NSArithmeticLayoutDimension;
  -[NSLayoutAnchor encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_rootLayoutDimension, CFSTR("NSLayoutAnchor_firstChildAnchor"));
  multiplier = self->_multiplier;
  if (multiplier != 1.0)
  {
    *(float *)&multiplier = multiplier;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("NSLayoutAnchor_multiplier"), multiplier);
  }
  constant = self->_constant;
  if (constant != 0.0)
  {
    *(float *)&constant = constant;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("NSLayoutAnchor_constant"), constant);
  }
}

- (id)_nearestAncestorLayoutItem
{
  return -[NSLayoutAnchor _nearestAncestorLayoutItem](self->_rootLayoutDimension, "_nearestAncestorLayoutItem");
}

- (id)_expressionInContext:(id *)a3
{
  NSLayoutDimension *rootLayoutDimension;
  id v6;
  id v7;
  $2DD436A466EE1EEA4ACD552B66BBE03E v9;

  rootLayoutDimension = self->_rootLayoutDimension;
  v9 = *a3;
  v6 = -[NSLayoutAnchor _expressionInContext:](rootLayoutDimension, "_expressionInContext:", &v9);
  v7 = +[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", objc_msgSend(v6, "variableCount"), a3->var2);
  objc_msgSend(v7, "addExpression:times:", v6, self->_multiplier);
  objc_msgSend(v7, "incrementConstant:", self->_constant);
  return v7;
}

- (double)_valueInEngine:(id)a3
{
  double multiplier;
  double v5;

  multiplier = self->_multiplier;
  -[NSLayoutAnchor _valueInEngine:](self->_rootLayoutDimension, "_valueInEngine:", a3);
  return self->_constant + multiplier * v5;
}

- (id)equationDescription
{
  void *v3;
  void *v4;
  double multiplier;
  double v6;
  double constant;
  double v8;
  const __CFString *v9;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v4 = v3;
  multiplier = self->_multiplier;
  if (multiplier != 0.0)
  {
    if (multiplier < 0.0)
    {
      objc_msgSend(v3, "appendString:", CFSTR("-"));
      multiplier = self->_multiplier;
    }
    v6 = fabs(multiplier);
    if (v6 != 1.0)
      objc_msgSend(v4, "appendFormat:", CFSTR("%g*"), *(_QWORD *)&v6);
    objc_msgSend(v4, "appendFormat:", CFSTR("%@"), -[NSLayoutAnchor _equationDescriptionInParent](self->_rootLayoutDimension, "_equationDescriptionInParent"));
  }
  constant = self->_constant;
  if (constant != 0.0)
  {
    v8 = fabs(constant);
    if (constant >= 0.0)
      v9 = CFSTR("+%g");
    else
      v9 = CFSTR("-%g");
    objc_msgSend(v4, "appendFormat:", v9, *(_QWORD *)&v8);
  }
  objc_msgSend(v4, "appendString:", CFSTR(")"));
  return (id)objc_msgSend(v4, "copy");
}

- (NSArray)_childAnchors
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_rootLayoutDimension;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

@end
