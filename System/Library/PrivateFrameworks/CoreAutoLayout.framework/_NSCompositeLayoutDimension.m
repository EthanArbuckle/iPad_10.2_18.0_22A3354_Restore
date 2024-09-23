@implementation _NSCompositeLayoutDimension

- (_NSCompositeLayoutDimension)initWithDimension:(id)a3 plusDimension:(id)a4 times:(double)a5
{
  _NSCompositeLayoutDimension *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NSCompositeLayoutDimension;
  v8 = -[NSLayoutAnchor init](&v10, sel_init);
  if (v8)
  {
    v8->_firstLayoutDimension = (NSLayoutDimension *)objc_msgSend(a3, "copy");
    v8->_secondLayoutDimensionMultiplier = a5;
    v8->_secondLayoutDimension = (NSLayoutDimension *)objc_msgSend(a4, "copy");
  }
  return v8;
}

- (_NSCompositeLayoutDimension)initWithAnchor:(id)a3
{
  _NSCompositeLayoutDimension *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSCompositeLayoutDimension;
  v4 = -[NSLayoutAnchor initWithAnchor:](&v6, sel_initWithAnchor_);
  if (v4)
  {
    v4->_firstLayoutDimension = (NSLayoutDimension *)objc_msgSend(*((id *)a3 + 8), "copy");
    v4->_secondLayoutDimensionMultiplier = *((double *)a3 + 9);
    v4->_secondLayoutDimension = (NSLayoutDimension *)objc_msgSend(*((id *)a3 + 10), "copy");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSCompositeLayoutDimension;
  -[NSLayoutAnchor dealloc](&v3, sel_dealloc);
}

- (_NSCompositeLayoutDimension)initWithCoder:(id)a3
{
  _NSCompositeLayoutDimension *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  float v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_NSCompositeLayoutDimension;
  v5 = -[NSLayoutAnchor initWithCoder:](&v12, sel_initWithCoder_);
  if (v5)
  {
    v6 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_firstChildAnchor"));
    v7 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_secondChildAnchor"));
    if (!v6)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("NSDerivativeLayoutAnchor.m"), 146, CFSTR("%@ decoded with empty first dimension"), v5);
    if (!v7)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("NSDerivativeLayoutAnchor.m"), 147, CFSTR("%@ decoded with empty second dimension"), v5);
    v5->_firstLayoutDimension = (NSLayoutDimension *)objc_msgSend(v6, "copy");
    v5->_secondLayoutDimension = (NSLayoutDimension *)objc_msgSend(v7, "copy");
    v8 = objc_msgSend(a3, "containsValueForKey:", CFSTR("NSLayoutAnchor_multiplier"));
    v9 = 1.0;
    if (v8)
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("NSLayoutAnchor_multiplier"), 1.0);
      v9 = v10;
    }
    v5->_secondLayoutDimensionMultiplier = v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double secondLayoutDimensionMultiplier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSCompositeLayoutDimension;
  -[NSLayoutAnchor encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_firstLayoutDimension, CFSTR("NSLayoutAnchor_firstChildAnchor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_secondLayoutDimension, CFSTR("NSLayoutAnchor_secondChildAnchor"));
  secondLayoutDimensionMultiplier = self->_secondLayoutDimensionMultiplier;
  if (secondLayoutDimensionMultiplier != 1.0)
  {
    *(float *)&secondLayoutDimensionMultiplier = secondLayoutDimensionMultiplier;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("NSLayoutAnchor_multiplier"), secondLayoutDimensionMultiplier);
  }
}

- (_NSCompositeLayoutDimension)initWithDimension:(id)a3 plusDimension:(id)a4
{
  return -[_NSCompositeLayoutDimension initWithDimension:plusDimension:times:](self, "initWithDimension:plusDimension:times:", a3, a4, 1.0);
}

- (id)_expressionInContext:(id *)a3
{
  NSLayoutDimension *firstLayoutDimension;
  id v6;
  NSLayoutDimension *secondLayoutDimension;
  id v8;
  id v9;
  $2DD436A466EE1EEA4ACD552B66BBE03E v11;

  firstLayoutDimension = self->_firstLayoutDimension;
  v11 = *a3;
  v6 = -[NSLayoutAnchor _expressionInContext:](firstLayoutDimension, "_expressionInContext:", &v11);
  secondLayoutDimension = self->_secondLayoutDimension;
  v11 = *a3;
  v8 = -[NSLayoutAnchor _expressionInContext:](secondLayoutDimension, "_expressionInContext:", &v11);
  v9 = +[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", objc_msgSend(v8, "variableCount") + objc_msgSend(v6, "variableCount"), a3->var2);
  objc_msgSend(v9, "addExpression:times:", v6, 1.0);
  objc_msgSend(v9, "addExpression:times:", v8, self->_secondLayoutDimensionMultiplier);
  return v9;
}

- (double)_valueInEngine:(id)a3
{
  double v5;
  double v6;
  double secondLayoutDimensionMultiplier;
  double v8;

  -[NSLayoutAnchor _valueInEngine:](self->_firstLayoutDimension, "_valueInEngine:");
  v6 = v5;
  secondLayoutDimensionMultiplier = self->_secondLayoutDimensionMultiplier;
  -[NSLayoutAnchor _valueInEngine:](self->_secondLayoutDimension, "_valueInEngine:", a3);
  return v6 + secondLayoutDimensionMultiplier * v8;
}

- (id)equationDescription
{
  void *v3;
  void *v4;
  double secondLayoutDimensionMultiplier;
  const __CFString *v6;
  double v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("(%@"), -[NSLayoutAnchor _equationDescriptionInParent](self->_firstLayoutDimension, "_equationDescriptionInParent"));
  v4 = v3;
  secondLayoutDimensionMultiplier = self->_secondLayoutDimensionMultiplier;
  if (secondLayoutDimensionMultiplier != 0.0)
  {
    if (secondLayoutDimensionMultiplier >= 0.0)
      v6 = CFSTR("+");
    else
      v6 = CFSTR("-");
    objc_msgSend(v3, "appendString:", v6);
    v7 = fabs(self->_secondLayoutDimensionMultiplier);
    if (v7 != 1.0)
      objc_msgSend(v4, "appendFormat:", CFSTR("%g*"), *(_QWORD *)&v7);
    objc_msgSend(v4, "appendFormat:", CFSTR("%@"), -[NSLayoutAnchor _equationDescriptionInParent](self->_secondLayoutDimension, "_equationDescriptionInParent"));
  }
  objc_msgSend(v4, "appendString:", CFSTR(")"));
  return (id)objc_msgSend(v4, "copy");
}

- (NSArray)_childAnchors
{
  NSLayoutDimension *secondLayoutDimension;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  secondLayoutDimension = self->_secondLayoutDimension;
  v4[0] = self->_firstLayoutDimension;
  v4[1] = secondLayoutDimension;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
}

@end
