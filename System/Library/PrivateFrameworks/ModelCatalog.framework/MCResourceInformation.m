@implementation MCResourceInformation

+ (BOOL)supportsSecureCoding
{
  char v2;

  static ResourceInformation.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ResourceInformation.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  MCResourceInformation *v5;

  v4 = a3;
  v5 = self;
  sub_2420B5AEC(v4);

}

- (MCResourceInformation)initWithCoder:(id)a3
{
  MCResourceInformation *result;

  ResourceInformation.init(coder:)(a3);
  return result;
}

- (NSString)debugDescription
{
  MCResourceInformation *v2;
  void *v3;

  v2 = self;
  sub_2420B63D8();

  v3 = (void *)sub_242132768();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (MCResourceInformation)init
{
  ResourceInformation.init()();
}

- (void).cxx_destruct
{
  sub_2420801DC((uint64_t)self + OBJC_IVAR___MCResourceInformation_location);
  sub_24209773C();
}

@end
