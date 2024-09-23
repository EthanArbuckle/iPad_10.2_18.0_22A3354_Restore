@implementation LegacyMultiAppFallbackView

- (_TtC22SubscribePageExtension26LegacyMultiAppFallbackView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26LegacyMultiAppFallbackView *)sub_1005013F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26LegacyMultiAppFallbackView)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension26LegacyMultiAppFallbackView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26LegacyMultiAppFallbackView_imageLayers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26LegacyMultiAppFallbackView_configuration) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension26LegacyMultiAppFallbackView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/LegacyMultiAppFallbackView.swift", 55, 2, 82, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC22SubscribePageExtension26LegacyMultiAppFallbackView *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  v5 = sub_1005022F4((uint64_t)v3, v4);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension26LegacyMultiAppFallbackView *v2;

  v2 = self;
  sub_100501EEC();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension26LegacyMultiAppFallbackView_imageLayers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension26LegacyMultiAppFallbackView_backingImageLayers));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension26LegacyMultiAppFallbackView_configuration));
}

@end
