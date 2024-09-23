@implementation AAMessagingCapability

- (AAMessagingCapability)initWithCapabilityType:(int64_t)a3
{
  AAMessagingCapability *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAMessagingCapability;
  result = -[AAMessagingCapability init](&v5, sel_init);
  if (result)
    result->_capability = a3;
  return result;
}

- (NSString)capabilityString
{
  unint64_t capability;

  capability = self->_capability;
  if (capability > 2)
    return (NSString *)CFSTR("IDSRegistrationPropertyUnknown");
  else
    return &off_1E416E280[capability]->isa;
}

- (AAMessagingCapability)initWithCoder:(id)a3
{
  id v4;
  AAMessagingCapability *v5;

  v4 = a3;
  v5 = -[AAMessagingCapability init](self, "init");
  if (v5)
    v5->_capability = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("capability"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_capability, CFSTR("capability"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)capability
{
  return self->_capability;
}

@end
