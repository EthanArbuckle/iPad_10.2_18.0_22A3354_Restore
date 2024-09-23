@implementation IdentityProofingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared29IdentityProofingConfiguration *v5;

  v4 = a3;
  v5 = self;
  IdentityProofingConfiguration.encode(with:)((NSCoder)v4);

}

- (_TtC13CoreIDVShared29IdentityProofingConfiguration)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared29IdentityProofingConfiguration *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared29IdentityProofingConfiguration *)sub_1CF992E54(v3);

  return v4;
}

- (_TtC13CoreIDVShared29IdentityProofingConfiguration)init
{
  _TtC13CoreIDVShared29IdentityProofingConfiguration *result;

  result = (_TtC13CoreIDVShared29IdentityProofingConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC13CoreIDVShared29IdentityProofingConfiguration_supplementalProvisioningData), *(_QWORD *)&self->state[OBJC_IVAR____TtC13CoreIDVShared29IdentityProofingConfiguration_supplementalProvisioningData]);
}

- (NSString)description
{
  _TtC13CoreIDVShared29IdentityProofingConfiguration *v2;
  void *v3;

  v2 = self;
  IdentityProofingConfiguration.description.getter();

  v3 = (void *)sub_1CFB01A04();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
