@implementation ReviewLockupDetails

+ (BOOL)supportsSecureCoding
{
  return static ReviewLockupDetails.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ReviewLockupDetails.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC20AppleMediaServicesUI19ReviewLockupDetails *v5;

  v4 = a3;
  v5 = self;
  sub_2112300BC(v4);

}

- (_TtC20AppleMediaServicesUI19ReviewLockupDetails)initWithCoder:(id)a3
{
  return (_TtC20AppleMediaServicesUI19ReviewLockupDetails *)ReviewLockupDetails.init(coder:)(a3);
}

- (_TtC20AppleMediaServicesUI19ReviewLockupDetails)init
{
  ReviewLockupDetails.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
