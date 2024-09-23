@implementation COMTAlarmCreateResult

- (COMTAlarmCreateResult)initWithActionIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COMTAlarmCreateResult;
  return -[COMTResult initWithActionIdentifier:](&v4, sel_initWithActionIdentifier_, a3);
}

- (COMTAlarmCreateResult)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COMTAlarmCreateResult;
  return -[COMTResult initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COMTAlarmCreateResult;
  -[COMTResult encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
