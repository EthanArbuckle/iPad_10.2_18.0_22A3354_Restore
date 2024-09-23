@implementation FlashIndicatorView

- (_TtC18CoreIDVRGBLiveness18FlashIndicatorView)initWithCoder:(id)a3
{
  id v4;
  _TtC18CoreIDVRGBLiveness18FlashIndicatorView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18CoreIDVRGBLiveness18FlashIndicatorView____lazy_storage___enabledIcon) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18CoreIDVRGBLiveness18FlashIndicatorView____lazy_storage___disabledIcon) = (Class)1;
  v4 = a3;

  result = (_TtC18CoreIDVRGBLiveness18FlashIndicatorView *)sub_213A146FC();
  __break(1u);
  return result;
}

- (void)toggleHandler
{
  _TtC18CoreIDVRGBLiveness18FlashIndicatorView *v2;

  v2 = self;
  sub_2139F559C();

}

- (_TtC18CoreIDVRGBLiveness18FlashIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC18CoreIDVRGBLiveness18FlashIndicatorView *result;

  result = (_TtC18CoreIDVRGBLiveness18FlashIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2139B96AC(*(id *)((char *)&self->super.super.super.super.super.isa
                      + OBJC_IVAR____TtC18CoreIDVRGBLiveness18FlashIndicatorView____lazy_storage___enabledIcon));
  sub_2139B96AC(*(id *)((char *)&self->super.super.super.super.super.isa
                      + OBJC_IVAR____TtC18CoreIDVRGBLiveness18FlashIndicatorView____lazy_storage___disabledIcon));
}

@end
