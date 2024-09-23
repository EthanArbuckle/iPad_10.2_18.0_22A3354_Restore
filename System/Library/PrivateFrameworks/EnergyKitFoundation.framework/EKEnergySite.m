@implementation EKEnergySite

+ (BOOL)supportsSecureCoding
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static EKEnergySite.supportsSecureCoding.getter();
  return sub_23A944E68() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  char v3;

  swift_getObjCClassMetadata();
  v3 = sub_23A944E74();
  swift_getObjCClassMetadata();
  static EKEnergySite.supportsSecureCoding.setter(v3 & 1);
}

- (_TtC19EnergyKitFoundation12EKEnergySite)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC19EnergyKitFoundation12EKEnergySite *)EKEnergySite.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC19EnergyKitFoundation12EKEnergySite *v5;

  v4 = a3;
  v5 = self;
  sub_23A93DEC4(a3);

}

- (_TtC19EnergyKitFoundation12EKEnergySite)init
{
  return (_TtC19EnergyKitFoundation12EKEnergySite *)EKEnergySite.init()();
}

- (void).cxx_destruct
{
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A94283C((id *)((char *)&self->super.isa + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_location));
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A917DE4((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_currentRatePlan);
  sub_23A918214((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointCustomIndex);
  sub_23A918214((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryCustomIndex);
  sub_23A918214((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockCustomIndex);
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A902B6C();
  sub_23A90A790((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_accessTokenExpirationDate);
  sub_23A90A790((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_utilitySupportedCheckDate);
  sub_23A90A790((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_amiLastRefreshDate);
  sub_23A90A790((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usagePointNextRefreshDate);
  sub_23A90A790((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_usageSummaryNextRefreshDate);
  sub_23A90A790((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_intervalBlockNextRefreshDate);
  sub_23A90A790((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionCreationDate);
  sub_23A90A790((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_subscriptionStartDate);
  sub_23A90A790((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_siteTombstone);
  sub_23A9034E0();
  sub_23A936F58((uint64_t)self + OBJC_IVAR____TtC19EnergyKitFoundation12EKEnergySite_unknownFields);
  swift_release();
}

@end
