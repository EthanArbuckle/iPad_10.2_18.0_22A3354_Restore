@implementation _NSConstraintDescriptionLayoutRuleNode

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSConstraintDescriptionLayoutRuleNode;
  -[_NSLayoutRuleNode dealloc](&v3, sel_dealloc);
}

- (NSLayoutConstraint)ownedConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOwnedConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
