@implementation NSLayoutPointRule

- (_QWORD)initWithFirstLayoutPoint:(void *)a3 secondLayoutPoint:
{
  _QWORD *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)NSLayoutPointRule;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = objc_msgSend(a2, "copy");
    v5[2] = objc_msgSend(a3, "copy");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSLayoutPointRule;
  -[NSLayoutPointRule dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSLayoutPoint hash](self->_firstLayoutPoint, "hash");
  return -[NSLayoutPoint hash](self->_secondLayoutPoint, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSLayoutPoint *firstLayoutPoint;
  NSLayoutPoint *secondLayoutPoint;

  if (self == a3)
    goto LABEL_8;
  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  v5 = objc_msgSend(a3, "isMemberOfClass:", NSLayoutPointRule);
  if (v5)
  {
    firstLayoutPoint = self->_firstLayoutPoint;
    if (firstLayoutPoint == *((NSLayoutPoint **)a3 + 1)
      || (v5 = -[NSLayoutPoint isEqual:](firstLayoutPoint, "isEqual:")) != 0)
    {
      secondLayoutPoint = self->_secondLayoutPoint;
      if (secondLayoutPoint != *((NSLayoutPoint **)a3 + 2))
      {
        LOBYTE(v5) = -[NSLayoutPoint isEqual:](secondLayoutPoint, "isEqual:");
        return v5;
      }
LABEL_8:
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)makeChildRules
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = -[NSLayoutAnchor ruleEqualToAnchor:](-[NSLayoutPoint xAxisAnchor](self->_firstLayoutPoint, "xAxisAnchor"), "ruleEqualToAnchor:", -[NSLayoutPoint xAxisAnchor](self->_secondLayoutPoint, "xAxisAnchor"));
  v4[1] = -[NSLayoutAnchor ruleEqualToAnchor:](-[NSLayoutPoint yAxisAnchor](self->_firstLayoutPoint, "yAxisAnchor"), "ruleEqualToAnchor:", -[NSLayoutPoint yAxisAnchor](self->_secondLayoutPoint, "yAxisAnchor"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
}

- (NSString)identifier
{
  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), NSStringFromClass(v4), self, -[NSLayoutPointRule ruleDescription](self, "ruleDescription"));
}

- (NSString)ruleDescription
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v3, "addObject:", -[NSLayoutPoint description](self->_firstLayoutPoint, "description"));
  objc_msgSend(v3, "addObject:", CFSTR("=="));
  objc_msgSend(v3, "addObject:", -[NSLayoutPoint description](self->_secondLayoutPoint, "description"));
  return (NSString *)objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
}

- (NSLayoutPoint)firstLayoutPoint
{
  return (NSLayoutPoint *)objc_getProperty(self, a2, 8, 1);
}

- (NSLayoutPoint)secondLayoutPoint
{
  return (NSLayoutPoint *)objc_getProperty(self, a2, 16, 1);
}

@end
