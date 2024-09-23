@implementation MADTextInputSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextInputSegment)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MADTextInputSegment;
  return -[MADTextInputSegment init](&v4, sel_init, a3);
}

- (int64_t)type
{
  return 0;
}

@end
