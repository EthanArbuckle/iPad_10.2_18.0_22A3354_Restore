@implementation AppPromotionScrollableContentContainerView

- (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView)init
{
  return (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *)sub_1003819B8();
}

- (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_protectionMode) = (Class)1;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_isCollapsing) = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  v6 = enum case for MediaOverlayStyle.matchSystem(_:);
  v7 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_contentBasedProtectionView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_fullProtectionView) = 0;
  v8 = a3;

  result = (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/AppPromotionScrollableContentContainerView.swift", 69, 2, 47, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *v2;

  v2 = self;
  sub_1003825AC();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_100382698((uint64_t)a4, x, y);

  return v10;
}

- (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *result;

  result = (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.AppPromotionScrollableContentContainerView", 63, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100382C80(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_protectionMode));
  v3 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_contentBasedProtectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_fullProtectionView));
}

@end
