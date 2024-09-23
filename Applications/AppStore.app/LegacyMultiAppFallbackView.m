@implementation LegacyMultiAppFallbackView

- (_TtC8AppStore26LegacyMultiAppFallbackView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26LegacyMultiAppFallbackView *)sub_1005C0594(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26LegacyMultiAppFallbackView)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore26LegacyMultiAppFallbackView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26LegacyMultiAppFallbackView_imageLayers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26LegacyMultiAppFallbackView_configuration) = 0;
  v4 = a3;

  result = (_TtC8AppStore26LegacyMultiAppFallbackView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/LegacyMultiAppFallbackView.swift", 41, 2, 82, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC8AppStore26LegacyMultiAppFallbackView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1005C1498();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore26LegacyMultiAppFallbackView *v2;

  v2 = self;
  sub_1005C1090();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore26LegacyMultiAppFallbackView_imageLayers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore26LegacyMultiAppFallbackView_backingImageLayers));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore26LegacyMultiAppFallbackView_configuration));
}

@end
