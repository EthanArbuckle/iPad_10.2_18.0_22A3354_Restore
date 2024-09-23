@implementation CPSDedicatedCameraResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSDedicatedCameraResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSDedicatedCameraResponse;
  return -[CPSDedicatedCameraResponse init](&v4, sel_init, a3);
}

@end
