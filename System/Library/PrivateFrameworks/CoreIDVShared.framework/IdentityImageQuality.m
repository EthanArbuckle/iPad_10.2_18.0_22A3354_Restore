@implementation IdentityImageQuality

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EFBC5390;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EFBC5390 = a3;
}

- (_TtC13CoreIDVShared20IdentityImageQuality)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared20IdentityImageQuality *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared20IdentityImageQuality *)sub_1CFAD5C28(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared20IdentityImageQuality *v5;

  v4 = a3;
  v5 = self;
  IdentityImageQuality.encode(with:)((NSCoder)v4);

}

- (_TtC13CoreIDVShared20IdentityImageQuality)init
{
  _TtC13CoreIDVShared20IdentityImageQuality *result;

  result = (_TtC13CoreIDVShared20IdentityImageQuality *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontScanSettings), *(_QWORD *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontScanSettings]);
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backScanSettings), *(_QWORD *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backScanSettings]);
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontIDSettings), *(_QWORD *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontIDSettings]);
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backIDSettings), *(_QWORD *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backIDSettings]);
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_selfieSettings), *(_QWORD *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_selfieSettings]);
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessSettings), *(_QWORD *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessSettings]);
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_passiveSettings), *(_QWORD *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_passiveSettings]);
  sub_1CF931AB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessBlockingCodes), *(_QWORD *)&self->frontScanSettings[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessBlockingCodes]);

}

@end
