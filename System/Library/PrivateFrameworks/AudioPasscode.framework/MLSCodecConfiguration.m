@implementation MLSCodecConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MLSCodecConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLSCodecConfiguration;
  return -[MLSCodecConfiguration init](&v3, sel_init);
}

@end
