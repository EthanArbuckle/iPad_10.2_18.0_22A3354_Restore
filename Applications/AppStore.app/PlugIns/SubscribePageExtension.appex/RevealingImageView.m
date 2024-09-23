@implementation RevealingImageView

- (_TtC22SubscribePageExtension18RevealingImageView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18RevealingImageView *)sub_100454114(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18RevealingImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100454D4C();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)layoutSubviews
{
  id v2;
  __n128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RevealingImageView(0);
  v2 = v4.receiver;
  -[RevealingImageView layoutSubviews](&v4, "layoutSubviews");
  sub_10045334C(v3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_imageView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_artworkLayoutWithMetrics));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_pageGrid, &qword_1008027B0);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_currentArtworkTemplate, &qword_1007F8EC0);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_currentArtworkHandlerKey, &qword_100810860);
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_delegate);
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_mirrorDelegate);
}

@end
