@implementation AppPromotionScrollableContentContainerView

- (_TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView)init
{
  return (_TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView *)sub_10009F010();
}

- (_TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView_protectionMode) = (Class)1;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView_isCollapsing) = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  v6 = enum case for MediaOverlayStyle.matchSystem(_:);
  v7 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView_contentBasedProtectionView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView_fullProtectionView) = 0;
  v8 = a3;

  result = (_TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/AppPromotionScrollableContentContainerView.swift", 71, 2, 47, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView *v2;

  v2 = self;
  sub_10009FC04();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_10009FCF0((uint64_t)a4, x, y);

  return v10;
}

- (_TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView *result;

  result = (_TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.AppPromotionScrollableContentContainerView", 65, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000A0394(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView_protectionMode));
  v3 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView_contentBasedProtectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension42AppPromotionScrollableContentContainerView_fullProtectionView));
}

@end
