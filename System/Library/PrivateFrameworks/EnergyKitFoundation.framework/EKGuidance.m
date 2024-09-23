@implementation EKGuidance

+ (BOOL)supportsSecureCoding
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static EKGuidance.supportsSecureCoding.getter();
  return sub_23A944E68() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  char v3;

  swift_getObjCClassMetadata();
  v3 = sub_23A944E74();
  swift_getObjCClassMetadata();
  static EKGuidance.supportsSecureCoding.setter(v3 & 1);
}

- (_TtC19EnergyKitFoundation10EKGuidance)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC19EnergyKitFoundation10EKGuidance *)EKGuidance.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC19EnergyKitFoundation10EKGuidance *v5;

  v4 = a3;
  v5 = self;
  sub_23A92E160(a3);

}

- (_TtC19EnergyKitFoundation10EKGuidance)init
{
  return (_TtC19EnergyKitFoundation10EKGuidance *)EKGuidance.init()();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  sub_23A902B6C();
  v3 = OBJC_IVAR____TtC19EnergyKitFoundation10EKGuidance_start;
  v2 = sub_23A944D00();
  (*(void (**)(char *))(*(_QWORD *)(v2 - 8) + 8))((char *)self + v3);
  sub_23A9034E0();
}

@end
