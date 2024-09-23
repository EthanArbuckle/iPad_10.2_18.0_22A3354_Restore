@implementation NullCodecCapability

- (NullCodecCapability)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NullCodecCapability;
  return -[AUPasscodeCodecCapability initWithAlgorithmName:](&v3, sel_initWithAlgorithmName_, CFSTR("null"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NullCodecCapability)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NullCodecCapability;
  return -[AUPasscodeCodecCapability initWithAlgorithmName:](&v4, sel_initWithAlgorithmName_, CFSTR("null"));
}

@end
