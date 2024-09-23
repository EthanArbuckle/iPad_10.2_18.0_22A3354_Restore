@implementation ClimateRecirculationIdicator

- (void).cxx_destruct
{
  sub_10001BF8C((uint64_t)self + OBJC_IVAR____TtC7Climate28ClimateRecirculationIdicator_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateRecirculationIdicator_recirculation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateRecirculationIdicator_recirculationButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateRecirculationIdicator_autoModeGlyph));
}

- (void)recirculationService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate28ClimateRecirculationIdicator *v6;

  v5 = a3;
  v6 = self;
  sub_1000217F0();

}

@end
