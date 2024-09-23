@implementation _ACSBatteryServiceOptions

- (_ACSBatteryServiceOptions)init
{
  _ACSBatteryServiceOptions *v2;
  objc_super v4;

  v2 = self;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____ACSBatteryServiceOptions_storage) = (Class)sub_2363702B4(MEMORY[0x24BEE4AF8]);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return -[_ACSBatteryServiceOptions init](&v4, sel_init);
}

- (_ACSBatteryServiceOptions)initWithValues:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____ACSBatteryServiceOptions_storage) = (Class)sub_23637A7FC();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return -[_ACSBatteryServiceOptions init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
