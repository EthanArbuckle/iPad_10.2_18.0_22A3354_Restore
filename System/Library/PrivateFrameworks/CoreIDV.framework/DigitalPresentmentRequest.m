@implementation DigitalPresentmentRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV25DigitalPresentmentRequest *v5;

  v4 = a3;
  v5 = self;
  DigitalPresentmentRequest.encode(with:)((NSCoder)v4);

}

- (_TtC7CoreIDV25DigitalPresentmentRequest)initWithCoder:(id)a3
{
  id v3;
  _TtC7CoreIDV25DigitalPresentmentRequest *v4;

  v3 = a3;
  v4 = (_TtC7CoreIDV25DigitalPresentmentRequest *)sub_20A135E2C();

  return v4;
}

- (_TtC7CoreIDV25DigitalPresentmentRequest)init
{
  _TtC7CoreIDV25DigitalPresentmentRequest *result;

  result = (_TtC7CoreIDV25DigitalPresentmentRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20A127E0C((uint64_t)self + OBJC_IVAR____TtC7CoreIDV25DigitalPresentmentRequest_descriptor, &qword_2545D8970);
  sub_20A127EE4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7CoreIDV25DigitalPresentmentRequest_nonce), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC7CoreIDV25DigitalPresentmentRequest_nonce]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20A127E0C((uint64_t)self + OBJC_IVAR____TtC7CoreIDV25DigitalPresentmentRequest_merchantPrivacyPolicyOverride, (uint64_t *)&unk_2545D8978);
}

@end
