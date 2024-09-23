@implementation NSLayoutRectRule

- (_QWORD)initWithFirstLayoutRect:(void *)a3 secondLayoutRect:
{
  _QWORD *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)NSLayoutRectRule;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = objc_msgSend(a2, "copy");
    v5[2] = objc_msgSend(a3, "copy");
    v5[3] = 0;
  }
  return v5;
}

- (_QWORD)initWithFirstLayoutRect:(void *)a3 secondLayoutRect:(uint64_t)a4 relation:
{
  _QWORD *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)NSLayoutRectRule;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = objc_msgSend(a2, "copy");
    v7[2] = objc_msgSend(a3, "copy");
    v7[3] = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSLayoutRectRule;
  -[NSLayoutRectRule dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSLayoutRect hash](self->_firstLayoutRect, "hash");
  return -[NSLayoutRect hash](self->_secondLayoutRect, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSLayoutRect *firstLayoutRect;
  NSLayoutRect *secondLayoutRect;

  if (self == a3)
    goto LABEL_8;
  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  v5 = objc_msgSend(a3, "isMemberOfClass:", NSLayoutRectRule);
  if (v5)
  {
    firstLayoutRect = self->_firstLayoutRect;
    if (firstLayoutRect == *((NSLayoutRect **)a3 + 1)
      || (v5 = -[NSLayoutRect isEqual:](firstLayoutRect, "isEqual:")) != 0)
    {
      secondLayoutRect = self->_secondLayoutRect;
      if (secondLayoutRect != *((NSLayoutRect **)a3 + 2))
      {
        LOBYTE(v5) = -[NSLayoutRect isEqual:](secondLayoutRect, "isEqual:");
        return v5;
      }
LABEL_8:
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (NSString)identifier
{
  return 0;
}

- (id)makeChildRules
{
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v4[0] = -[NSLayoutAnchor ruleEqualToAnchor:](-[NSLayoutRect leadingAnchor](self->_firstLayoutRect, "leadingAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect leadingAnchor](self->_secondLayoutRect, "leadingAnchor"));
  v4[1] = -[NSLayoutAnchor ruleEqualToAnchor:](-[NSLayoutRect leadingAnchor](self->_firstLayoutRect, "leadingAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect leadingAnchor](self->_secondLayoutRect, "leadingAnchor"));
  v4[2] = -[NSLayoutAnchor ruleEqualToAnchor:](-[NSLayoutRect leadingAnchor](self->_firstLayoutRect, "leadingAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect leadingAnchor](self->_secondLayoutRect, "leadingAnchor"));
  v4[3] = -[NSLayoutAnchor ruleEqualToAnchor:](-[NSLayoutRect leadingAnchor](self->_firstLayoutRect, "leadingAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect leadingAnchor](self->_secondLayoutRect, "leadingAnchor"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), NSStringFromClass(v4), self, -[NSLayoutRectRule ruleDescription](self, "ruleDescription"));
}

- (NSString)ruleDescription
{
  void *v3;
  int64_t relation;
  const __CFString *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v3, "addObject:", -[NSLayoutRect description](self->_firstLayoutRect, "description"));
  relation = self->_relation;
  if (!relation)
  {
    v5 = CFSTR("==");
    goto LABEL_5;
  }
  if (relation == 1)
  {
    v5 = CFSTR("contains");
LABEL_5:
    objc_msgSend(v3, "addObject:", v5);
  }
  objc_msgSend(v3, "addObject:", -[NSLayoutRect description](self->_secondLayoutRect, "description"));
  return (NSString *)objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
}

- (NSLayoutRect)firstLayoutRect
{
  return (NSLayoutRect *)objc_getProperty(self, a2, 8, 1);
}

- (NSLayoutRect)secondLayoutRect
{
  return (NSLayoutRect *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)relation
{
  return self->_relation;
}

- (void)setRelation:(int64_t)a3
{
  self->_relation = a3;
}

@end
