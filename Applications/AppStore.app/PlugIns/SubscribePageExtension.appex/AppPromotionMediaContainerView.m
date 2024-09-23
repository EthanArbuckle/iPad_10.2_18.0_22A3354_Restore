@implementation AppPromotionMediaContainerView

- (_TtC22SubscribePageExtension30AppPromotionMediaContainerView)init
{
  return (_TtC22SubscribePageExtension30AppPromotionMediaContainerView *)sub_1000D6320();
}

- (_TtC22SubscribePageExtension30AppPromotionMediaContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000D7ECC();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self, a2);
  -[AppPromotionMediaContainerView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC22SubscribePageExtension30AppPromotionMediaContainerView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v19.receiver = self;
  v19.super_class = ObjectType;
  v9 = self;
  -[AppPromotionMediaContainerView frame](&v19, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = v9;
  v18.super_class = ObjectType;
  -[AppPromotionMediaContainerView setFrame:](&v18, "setFrame:", x, y, width, height);
  sub_1000D66A8(v11, v13, v15, v17);

}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC22SubscribePageExtension30AppPromotionMediaContainerView *v3;

  v3 = self;
  sub_1000D68F4((uint64_t)v3, v2);

}

- (void)videoTapGestureRecognized
{
  _TtC22SubscribePageExtension30AppPromotionMediaContainerView *v2;

  v2 = self;
  sub_1000D6B90();

}

- (_TtC22SubscribePageExtension30AppPromotionMediaContainerView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension30AppPromotionMediaContainerView *result;

  result = (_TtC22SubscribePageExtension30AppPromotionMediaContainerView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.AppPromotionMediaContainerView", 53, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30AppPromotionMediaContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30AppPromotionMediaContainerView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30AppPromotionMediaContainerView_artworkFallbackView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension30AppPromotionMediaContainerView_videoView);
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30AppPromotionMediaContainerView_mediaOverlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension30AppPromotionMediaContainerView_refetchArtworkBlock), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC22SubscribePageExtension30AppPromotionMediaContainerView_refetchArtworkBlock]);
}

@end
