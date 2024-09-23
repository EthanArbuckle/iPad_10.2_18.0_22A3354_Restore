@implementation MADMultiModalInputSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInputSegment)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MADMultiModalInputSegment;
  return -[MADMultiModalInputSegment init](&v4, sel_init, a3);
}

- (int64_t)type
{
  return 0;
}

@end
