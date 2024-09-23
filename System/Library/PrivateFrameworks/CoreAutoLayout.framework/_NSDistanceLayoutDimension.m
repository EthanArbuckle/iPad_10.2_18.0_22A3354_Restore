@implementation _NSDistanceLayoutDimension

+ (id)distanceFromAnchor:(id)a3 toAnchor:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMinuend:subtrahend:", a4, a3);
}

- (_NSDistanceLayoutDimension)initWithMinuend:(id)a3 subtrahend:(id)a4
{
  _NSDistanceLayoutDimension *v8;
  _NSDistanceLayoutDimension *v9;
  _NSDistanceLayoutDimension *v10;
  objc_super v12;

  if (!a3 || !a4)
  {
    v9 = self;
    if (a3)
    {
      if (a4)
        goto LABEL_10;
    }
    else
    {
      if (a4)
        goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(a3, "isCompatibleWithAnchor:", a4) & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)_NSDistanceLayoutDimension;
    v8 = -[NSLayoutAnchor init](&v12, sel_init);
    if (v8)
    {
      v8->_minuend = (NSLayoutAnchor *)objc_msgSend(a3, "copy");
      v8->_subtrahend = (NSLayoutAnchor *)objc_msgSend(a4, "copy");
    }
    return v8;
  }
  v10 = self;
LABEL_10:
  if ((objc_msgSend(a3, "isCompatibleWithAnchor:", a4) & 1) == 0)
  return 0;
}

- (_NSDistanceLayoutDimension)initWithAnchor:(id)a3
{
  _NSDistanceLayoutDimension *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSDistanceLayoutDimension;
  v4 = -[NSLayoutAnchor initWithAnchor:](&v6, sel_initWithAnchor_);
  if (v4)
  {
    v4->_minuend = (NSLayoutAnchor *)objc_msgSend(*((id *)a3 + 8), "copy");
    v4->_subtrahend = (NSLayoutAnchor *)objc_msgSend(*((id *)a3 + 9), "copy");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSDistanceLayoutDimension;
  -[NSLayoutAnchor dealloc](&v3, sel_dealloc);
}

- (_NSDistanceLayoutDimension)initWithCoder:(id)a3
{
  _NSDistanceLayoutDimension *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NSDistanceLayoutDimension;
  v5 = -[NSLayoutAnchor initWithCoder:](&v9, sel_initWithCoder_);
  if (v5)
  {
    v6 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_firstChildAnchor"));
    v7 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_secondChildAnchor"));
    if (!v6)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("NSDerivativeLayoutAnchor.m"), 249, CFSTR("%@ decoded with empty first anchor (minuend)"), v5);
    if (!v7)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("NSDerivativeLayoutAnchor.m"), 250, CFSTR("%@ decoded with empty second anchor (subtrahend)"), v5);
    v5->_minuend = (NSLayoutAnchor *)objc_msgSend(v6, "copy");
    v5->_subtrahend = (NSLayoutAnchor *)objc_msgSend(v7, "copy");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NSDistanceLayoutDimension;
  -[NSLayoutAnchor encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_minuend, CFSTR("NSLayoutAnchor_firstChildAnchor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_subtrahend, CFSTR("NSLayoutAnchor_secondChildAnchor"));
}

- (id)_expressionInContext:(id *)a3
{
  NSLayoutAnchor *minuend;
  id v6;
  NSLayoutAnchor *subtrahend;
  id v8;
  double v9;
  int64_t var0;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  BOOL v15;
  id v16;
  $2DD436A466EE1EEA4ACD552B66BBE03E v18;

  minuend = self->_minuend;
  v18 = *a3;
  v6 = -[NSLayoutAnchor _expressionInContext:](minuend, "_expressionInContext:", &v18);
  subtrahend = self->_subtrahend;
  v18 = *a3;
  v8 = -[NSLayoutAnchor _expressionInContext:](subtrahend, "_expressionInContext:", &v18);
  v9 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    var0 = a3->var0;
    v11 = -[NSLayoutAnchor _directionAbstraction](self->_minuend, "_directionAbstraction");
    v12 = -[NSLayoutAnchor _directionAbstraction](self->_subtrahend, "_directionAbstraction");
    if (var0 != 1
      || (v11 != 1 ? (v13 = v12 == 1) : (v13 = 1),
          v13 ? (v14 = 0) : (v14 = 1),
          (v9 = -1.0, v11) ? (v15 = v12 == 0) : (v15 = 1),
          !v15 && (v14 & 1) == 0))
    {
      v9 = 1.0;
    }
  }
  v16 = +[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", objc_msgSend(v8, "variableCount") + objc_msgSend(v6, "variableCount"), a3->var2);
  objc_msgSend(v16, "addExpression:times:", v6, v9);
  objc_msgSend(v16, "addExpression:times:", v8, -v9);
  return v16;
}

- (double)_valueInEngine:(id)a3
{
  double v5;
  double v6;
  double v7;

  -[NSLayoutAnchor _valueInEngine:](self->_minuend, "_valueInEngine:");
  v6 = v5;
  -[NSLayoutAnchor _valueInEngine:](self->_subtrahend, "_valueInEngine:", a3);
  return v6 - v7;
}

- (id)equationDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ - %@)"), -[NSLayoutAnchor _equationDescriptionInParent](self->_minuend, "_equationDescriptionInParent"), -[NSLayoutAnchor _equationDescriptionInParent](self->_subtrahend, "_equationDescriptionInParent"));
}

- (NSArray)_childAnchors
{
  NSLayoutAnchor *subtrahend;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  subtrahend = self->_subtrahend;
  v4[0] = self->_minuend;
  v4[1] = subtrahend;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
}

@end
