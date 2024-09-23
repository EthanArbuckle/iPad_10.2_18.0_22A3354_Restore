@implementation HorizontalMeterView

- (_TtC16HearingAppPlugin19HorizontalMeterView)initWithCoder:(id)a3
{
  id v4;
  _TtC16HearingAppPlugin19HorizontalMeterView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth) = 0;
  v4 = a3;

  result = (_TtC16HearingAppPlugin19HorizontalMeterView *)sub_2312BC068();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16HearingAppPlugin19HorizontalMeterView *v2;

  v2 = self;
  HorizontalMeterView.layoutSubviews()();

}

- (_TtC16HearingAppPlugin19HorizontalMeterView)initWithFrame:(CGRect)a3
{
  _TtC16HearingAppPlugin19HorizontalMeterView *result;

  result = (_TtC16HearingAppPlugin19HorizontalMeterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_model);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_model));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth));
}

@end
