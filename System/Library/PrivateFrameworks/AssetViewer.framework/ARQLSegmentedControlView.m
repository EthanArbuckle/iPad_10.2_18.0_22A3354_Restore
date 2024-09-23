@implementation ARQLSegmentedControlView

- (_TtC11AssetViewer24ARQLSegmentedControlView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11AssetViewer24ARQLSegmentedControlView *result;

  v5 = OBJC_IVAR____TtC11AssetViewer24ARQLSegmentedControlView_visualEffectView;
  v6 = objc_allocWithZone((Class)ASVBlurredBackgroundView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_backgroundStyle_controlStyle_, 0, 0, 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer24ARQLSegmentedControlView_controlStyle) = 0;

  result = (_TtC11AssetViewer24ARQLSegmentedControlView *)sub_1D94D382C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ARQLSegmentedControlView();
  v2 = v3.receiver;
  -[ARQLSegmentedControlView layoutSubviews](&v3, sel_layoutSubviews);
  sub_1D94A8920();

}

- (_TtC11AssetViewer24ARQLSegmentedControlView)initWithFrame:(CGRect)a3
{
  _TtC11AssetViewer24ARQLSegmentedControlView *result;

  result = (_TtC11AssetViewer24ARQLSegmentedControlView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer24ARQLSegmentedControlView_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer24ARQLSegmentedControlView_segmentedControl));
}

@end
