@implementation ClimateZonesSyncedServiceButton

- (_TtC7Climate31ClimateZonesSyncedServiceButton)init
{
  _TtC7Climate31ClimateZonesSyncedServiceButton *result;

  result = (_TtC7Climate31ClimateZonesSyncedServiceButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x800000010008BB20, "Climate/ClimateZonesSyncedServiceButton.swift", 45, 2, 56, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate31ClimateZonesSyncedServiceButton_zonesSynced));
}

- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate31ClimateZonesSyncedServiceButton *v6;

  v5 = a3;
  v6 = self;
  sub_10007813C();
  -[ClimateZonesSyncedServiceButton setEnabled:](v6, "setEnabled:", (unint64_t)sub_1000130CC() < 8);
  sub_100066A90();
  sub_100066C24();

}

@end
