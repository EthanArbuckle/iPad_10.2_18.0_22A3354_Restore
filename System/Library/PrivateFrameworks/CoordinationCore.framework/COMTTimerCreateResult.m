@implementation COMTTimerCreateResult

- (COMTTimerCreateResult)initWithActionIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COMTTimerCreateResult;
  return -[COMTResult initWithActionIdentifier:](&v4, sel_initWithActionIdentifier_, a3);
}

- (COMTTimerCreateResult)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COMTTimerCreateResult;
  return -[COMTResult initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COMTTimerCreateResult;
  -[COMTResult encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
