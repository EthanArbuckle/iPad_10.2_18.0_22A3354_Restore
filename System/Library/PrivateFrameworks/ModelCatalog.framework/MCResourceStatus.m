@implementation MCResourceStatus

+ (BOOL)supportsSecureCoding
{
  char v2;

  static StatusResponse.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static StatusResponse.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  MCResourceStatus *v5;

  v4 = a3;
  v5 = self;
  sub_2420B5464(v4);

}

- (MCResourceStatus)initWithCoder:(id)a3
{
  MCResourceStatus *result;

  StatusResponse.init(coder:)(a3);
  return result;
}

- (MCResourceStatus)init
{
  StatusResponse.init()();
}

@end
