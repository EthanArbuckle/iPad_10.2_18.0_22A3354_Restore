@implementation NSLayoutPoint

- (id)ruleEqualToLayoutPoint:(id)a3
{
  return -[NSLayoutPointRule initWithFirstLayoutPoint:secondLayoutPoint:]([NSLayoutPointRule alloc], self, a3);
}

- (_QWORD)initWithXAxisAnchor:(void *)a3 yAxisAnchor:
{
  _QWORD *v3;
  objc_super v7;

  v3 = a1;
  if (!a1)
    return v3;
  if (a2)
  {
    if (a3)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithXAxisAnchor_yAxisAnchor_, a1, CFSTR("NSLayoutGeometry.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("xAxisAnchor != nil"));
    if (a3)
      goto LABEL_4;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithXAxisAnchor_yAxisAnchor_, v3, CFSTR("NSLayoutGeometry.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("yAxisAnchor != nil"));
LABEL_4:
  v7.receiver = v3;
  v7.super_class = (Class)NSLayoutPoint;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    v3[1] = objc_msgSend(a2, "copy");
    v3[2] = objc_msgSend(a3, "copy");
  }
  return v3;
}

- (NSLayoutPoint)initWithCoder:(id)a3
{
  NSLayoutPoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSLayoutPoint;
  v4 = -[NSLayoutPoint init](&v6, sel_init);
  if (v4)
  {
    v4->_xAxisAnchor = (NSLayoutXAxisAnchor *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutXAxisAnchor"));
    v4->_yAxisAnchor = (NSLayoutYAxisAnchor *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutYAxisAnchor"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_xAxisAnchor, CFSTR("NSLayoutXAxisAnchor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_yAxisAnchor, CFSTR("NSLayoutYAxisAnchor"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSLayoutPoint;
  -[NSLayoutPoint dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSLayoutAnchor isEqual:](self->_xAxisAnchor, "isEqual:", *((_QWORD *)a3 + 1));
    if (v5)
      LOBYTE(v5) = -[NSLayoutAnchor isEqual:](self->_yAxisAnchor, "isEqual:", *((_QWORD *)a3 + 2));
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (NSLayoutPoint)layoutPointWithXAxisAnchor:(id)a3 yAxisAnchor:(id)a4
{
  return (NSLayoutPoint *)-[NSLayoutPoint initWithXAxisAnchor:yAxisAnchor:]([NSLayoutPoint alloc], a3, a4);
}

- (id)layoutPointByOffsettingWithXOffset:(double)a3 yOffset:(double)a4
{
  NSLayoutXAxisAnchor *xAxisAnchor;
  NSLayoutYAxisAnchor *yAxisAnchor;

  xAxisAnchor = self->_xAxisAnchor;
  if (a3 != 0.0)
    xAxisAnchor = -[NSLayoutXAxisAnchor anchorByOffsettingWithConstant:](self->_xAxisAnchor, "anchorByOffsettingWithConstant:");
  yAxisAnchor = self->_yAxisAnchor;
  if (a4 != 0.0)
    yAxisAnchor = -[NSLayoutYAxisAnchor anchorByOffsettingWithConstant:](self->_yAxisAnchor, "anchorByOffsettingWithConstant:", a4);
  return +[NSLayoutPoint layoutPointWithXAxisAnchor:yAxisAnchor:](NSLayoutPoint, "layoutPointWithXAxisAnchor:yAxisAnchor:", xAxisAnchor, yAxisAnchor);
}

- (id)layoutPointByOffsettingWithXOffsetDimension:(id)a3 yOffsetDimension:(id)a4
{
  NSLayoutXAxisAnchor *xAxisAnchor;
  NSLayoutYAxisAnchor *yAxisAnchor;

  xAxisAnchor = self->_xAxisAnchor;
  if (a3)
    xAxisAnchor = -[NSLayoutXAxisAnchor anchorByOffsettingWithDimension:](self->_xAxisAnchor, "anchorByOffsettingWithDimension:");
  yAxisAnchor = self->_yAxisAnchor;
  if (a4)
    yAxisAnchor = -[NSLayoutYAxisAnchor anchorByOffsettingWithDimension:](self->_yAxisAnchor, "anchorByOffsettingWithDimension:", a4);
  return +[NSLayoutPoint layoutPointWithXAxisAnchor:yAxisAnchor:](NSLayoutPoint, "layoutPointWithXAxisAnchor:yAxisAnchor:", xAxisAnchor, yAxisAnchor);
}

- (id)constraintsEqualToLayoutPoint:(id)a3
{
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutPoint xAxisAnchor](self, "xAxisAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "xAxisAnchor"));
  v6[1] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutPoint yAxisAnchor](self, "yAxisAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "yAxisAnchor"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
}

- (NSLayoutXAxisAnchor)xAxisAnchor
{
  return (NSLayoutXAxisAnchor *)objc_getProperty(self, a2, 8, 1);
}

- (NSLayoutYAxisAnchor)yAxisAnchor
{
  return (NSLayoutYAxisAnchor *)objc_getProperty(self, a2, 16, 1);
}

- (CGPoint)valueInItem:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[NSLayoutAnchor valueInItem:](-[NSLayoutPoint xAxisAnchor](self, "xAxisAnchor"), "valueInItem:", a3);
  v6 = v5;
  -[NSLayoutAnchor valueInItem:](-[NSLayoutPoint yAxisAnchor](self, "yAxisAnchor"), "valueInItem:", a3);
  v8 = v7;
  v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

@end
