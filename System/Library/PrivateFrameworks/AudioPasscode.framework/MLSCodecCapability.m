@implementation MLSCodecCapability

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MLSCodecCapability)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLSCodecCapability;
  return -[AUPasscodeCodecCapability initWithAlgorithmName:](&v3, sel_initWithAlgorithmName_, CFSTR("mls "));
}

- (MLSCodecCapability)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLSCodecCapability;
  return -[AUPasscodeCodecCapability init](&v4, sel_init, a3);
}

@end
