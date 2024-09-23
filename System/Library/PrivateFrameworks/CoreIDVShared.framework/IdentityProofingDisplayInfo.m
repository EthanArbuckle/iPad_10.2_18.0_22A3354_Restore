@implementation IdentityProofingDisplayInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared27IdentityProofingDisplayInfo)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared27IdentityProofingDisplayInfo *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared27IdentityProofingDisplayInfo *)sub_1CFAE81FC(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared27IdentityProofingDisplayInfo *v5;

  v4 = a3;
  v5 = self;
  IdentityProofingDisplayInfo.encode(with:)((NSCoder)v4);

}

- (_TtC13CoreIDVShared27IdentityProofingDisplayInfo)init
{
  _TtC13CoreIDVShared27IdentityProofingDisplayInfo *result;

  result = (_TtC13CoreIDVShared27IdentityProofingDisplayInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_attributeConfig), *(_QWORD *)&self->proofingUI[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_attributeConfig]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_featureEnablementConfig));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpConfig));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpIQSettings));
}

@end
