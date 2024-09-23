@implementation _NSLayoutRuleNode

- (_NSLayoutRuleNode)initWithRule:(id)a3
{
  _NSLayoutRuleNode *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSLayoutRuleNode;
  v4 = -[_NSLayoutRuleNode init](&v6, sel_init);
  if (v4)
    v4->_representedRule = (NSLayoutRule *)objc_msgSend(a3, "copyWithZone:", 0);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSLayoutRuleNode;
  -[_NSLayoutRuleNode dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), NSStringFromClass(v4), self, -[NSLayoutRule description](self->_representedRule, "description"));
}

- (NSLayoutRule)representedRule
{
  return (NSLayoutRule *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRepresentedRule:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (_NSLayoutRuleNodeParent)parentNode
{
  return self->_parentNode;
}

- (void)setParentNode:(id)a3
{
  self->_parentNode = (_NSLayoutRuleNodeParent *)a3;
}

@end
