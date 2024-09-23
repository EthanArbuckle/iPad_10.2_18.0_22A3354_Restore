@implementation ClimateIndicator

- (_TtC7Climate16ClimateIndicator)init
{
  char *v2;
  _TtC7Climate16ClimateIndicator *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Climate16ClimateIndicator_circularBackgroundView) = 0;
  v2 = (char *)self + OBJC_IVAR____TtC7Climate16ClimateIndicator_circleDiameter;
  *(_QWORD *)v2 = 0;
  v2[8] = 1;

  result = (_TtC7Climate16ClimateIndicator *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x800000010008BB20, "Climate/ClimateIndicator.swift", 30, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC7Climate16ClimateIndicator *v2;

  v2 = self;
  sub_100012D0C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate16ClimateIndicator_circularBackgroundView));
}

@end
