@implementation ClimateSeatHeatingCoolingServiceButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateSeatHeatingCoolingServiceButton();
  return -[ClimateButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  _QWORD *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClimateSeatHeatingCoolingServiceButton();
  v4 = (char *)v7.receiver;
  -[ClimateButton setHighlighted:](&v7, "setHighlighted:", v3);
  v5 = *(_QWORD **)&v4[OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_progressView];
  if ((v4[OBJC_IVAR____TtC7Climate13ClimateButton_shouldBeHighlighted] & 1) != 0)
    v6 = 1;
  else
    v6 = (uint64_t)objc_msgSend(v4, "isHighlighted", v7.receiver, v7.super_class);
  (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0xB8))(v6);

}

- (_TtC7Climate38ClimateSeatHeatingCoolingServiceButton)init
{
  _QWORD *v3;
  uint64_t v4;
  _TtC7Climate38ClimateSeatHeatingCoolingServiceButton *result;

  v3 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_symbolName);
  *v3 = 0xD00000000000001BLL;
  v3[1] = 0x800000010008D7E0;
  *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_currentValue) = 0;
  v4 = OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_autoModeGlyph;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v4) = (Class)objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");

  result = (_TtC7Climate38ClimateSeatHeatingCoolingServiceButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x800000010008BB20, "Climate/ClimateSeatHeatingCoolingServiceButton.swift", 52, 2, 85, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.action[OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_symbolName]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_seatHeatingCooling));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_autoModeGlyph));
}

- (void)heatingCoolingService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate38ClimateSeatHeatingCoolingServiceButton *v6;

  v5 = a3;
  v6 = self;
  sub_10003D8B4();

}

- (void)heatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4
{
  id v5;
  _TtC7Climate38ClimateSeatHeatingCoolingServiceButton *v6;

  v5 = a3;
  v6 = self;
  sub_10003D8B4();

}

@end
