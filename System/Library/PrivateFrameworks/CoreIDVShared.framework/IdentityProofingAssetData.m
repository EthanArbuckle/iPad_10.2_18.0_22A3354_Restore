@implementation IdentityProofingAssetData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared25IdentityProofingAssetData *v5;

  v4 = a3;
  v5 = self;
  IdentityProofingAssetData.encode(with:)((NSCoder)v4);

}

- (_TtC13CoreIDVShared25IdentityProofingAssetData)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared25IdentityProofingAssetData *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared25IdentityProofingAssetData *)sub_1CF9A4168();

  return v4;
}

- (_TtC13CoreIDVShared25IdentityProofingAssetData)init
{
  _TtC13CoreIDVShared25IdentityProofingAssetData *result;

  result = (_TtC13CoreIDVShared25IdentityProofingAssetData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared25IdentityProofingAssetData_twoX), *(_QWORD *)&self->twoX[OBJC_IVAR____TtC13CoreIDVShared25IdentityProofingAssetData_twoX]);
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared25IdentityProofingAssetData_threeX), *(_QWORD *)&self->twoX[OBJC_IVAR____TtC13CoreIDVShared25IdentityProofingAssetData_threeX]);
  swift_bridgeObjectRelease();
}

@end
