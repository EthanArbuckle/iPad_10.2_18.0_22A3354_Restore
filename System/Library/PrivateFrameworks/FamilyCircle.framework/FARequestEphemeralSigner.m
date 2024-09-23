@implementation FARequestEphemeralSigner

- (NSDictionary)ephemeralAuthResults
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CAF20388();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setEphemeralAuthResults:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FARequestEphemeralSigner_ephemeralAuthResults) = (Class)sub_1CAF20394();
  swift_bridgeObjectRelease();
}

- (FARequestEphemeralSigner)initWithEphemeralAuthResults:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FARequestEphemeralSigner_ephemeralAuthResults) = (Class)sub_1CAF20394();
  v5.receiver = self;
  v5.super_class = (Class)FARequestEphemeralSigner;
  return -[FARequestEphemeralSigner init](&v5, sel_init);
}

- (void)signURLRequest:(id)a3
{
  id v4;
  FARequestEphemeralSigner *v5;

  v4 = a3;
  v5 = self;
  sub_1CAF1DC64(v4);

}

- (FARequestEphemeralSigner)init
{
  FARequestEphemeralSigner *result;

  result = (FARequestEphemeralSigner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (ACAccount)account
{
  FARequestEphemeralSigner *v2;
  NSDictionary *v3;
  uint64_t v4;
  id v5;

  v2 = self;
  v3 = -[FARequestEphemeralSigner ephemeralAuthResults](v2, sel_ephemeralAuthResults);
  v4 = sub_1CAF20394();

  v5 = _sSo9ACAccountC12FamilyCircleE10fa_account4withABSgSDySSypG_tFZ_0(v4);
  swift_bridgeObjectRelease();
  return (ACAccount *)v5;
}

- (id)accountInfoPayload
{
  FARequestEphemeralSigner *v2;
  void *v3;

  v2 = self;
  FARequestEphemeralSigner.accountInfoPayload()();

  v3 = (void *)sub_1CAF20388();
  swift_bridgeObjectRelease();
  return v3;
}

@end
