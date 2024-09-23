@implementation IdentityProofingStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared22IdentityProofingStatus)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared22IdentityProofingStatus *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared22IdentityProofingStatus *)sub_1CF993338(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared22IdentityProofingStatus *v5;

  v4 = a3;
  v5 = self;
  IdentityProofingStatus.encode(with:)((NSCoder)v4);

}

- (_TtC13CoreIDVShared22IdentityProofingStatus)init
{
  _TtC13CoreIDVShared22IdentityProofingStatus *result;

  result = (_TtC13CoreIDVShared22IdentityProofingStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
