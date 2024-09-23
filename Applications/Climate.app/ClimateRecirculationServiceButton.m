@implementation ClimateRecirculationServiceButton

- (_TtC7Climate33ClimateRecirculationServiceButton)init
{
  uint64_t v3;
  _TtC7Climate33ClimateRecirculationServiceButton *result;

  v3 = OBJC_IVAR____TtC7Climate33ClimateRecirculationServiceButton_autoModeGlyph;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");

  result = (_TtC7Climate33ClimateRecirculationServiceButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x800000010008BB20, "Climate/ClimateRecirculationServiceButton.swift", 47, 2, 73, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate33ClimateRecirculationServiceButton_recirculation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate33ClimateRecirculationServiceButton_autoModeGlyph));
}

- (void)recirculationService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate33ClimateRecirculationServiceButton *v6;

  v5 = a3;
  v6 = self;
  sub_10006CA24();

}

@end
