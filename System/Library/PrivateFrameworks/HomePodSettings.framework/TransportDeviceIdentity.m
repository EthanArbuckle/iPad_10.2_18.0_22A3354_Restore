@implementation TransportDeviceIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15HomePodSettings23TransportDeviceIdentity *v5;

  v4 = a3;
  v5 = self;
  sub_22DF8F278();

}

- (_TtC15HomePodSettings23TransportDeviceIdentity)initWithCoder:(id)a3
{
  _TtC15HomePodSettings23TransportDeviceIdentity *result;

  TransportDeviceIdentity.init(coder:)(a3);
  return result;
}

- (_TtC15HomePodSettings23TransportDeviceIdentity)init
{
  TransportDeviceIdentity.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
