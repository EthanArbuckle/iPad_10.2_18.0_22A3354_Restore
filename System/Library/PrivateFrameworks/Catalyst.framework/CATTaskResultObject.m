@implementation CATTaskResultObject

- (CATTaskResultObject)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CATTaskResultObject;
  return -[CATTaskResultObject init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskResultObject)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CATTaskResultObject;
  return -[CATTaskResultObject init](&v4, sel_init, a3);
}

@end
