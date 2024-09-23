@implementation CLConstraint

- (id)initConstraint
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLConstraint;
  return -[CLCondition initCondition](&v3, sel_initCondition);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLConstraint;
  -[CLCondition dealloc](&v2, sel_dealloc);
}

- (id)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLConstraint;
  return -[CLCondition copy](&v3, sel_copy);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLConstraint;
  return -[CLCondition copy](&v4, sel_copy, a3);
}

- (CLConstraint)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLConstraint;
  return -[CLCondition initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end
