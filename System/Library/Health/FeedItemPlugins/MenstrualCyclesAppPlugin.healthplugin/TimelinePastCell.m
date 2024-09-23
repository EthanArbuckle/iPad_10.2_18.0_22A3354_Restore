@implementation TimelinePastCell

- (id)initWithFrame:(double)a3
{
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a2, a3, a4, a5);
}

- (id)initWithCoder:(uint64_t)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, a3);
}

@end
