@implementation RevealingImageView

- (_TtC20ProductPageExtension18RevealingImageView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension18RevealingImageView *)sub_10031C108(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension18RevealingImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10031CD40();
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
  sub_10031B340(v3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_imageView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_artworkLayoutWithMetrics));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_pageGrid, &qword_10082AF10);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_currentArtworkTemplate, &qword_100808E90);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_currentArtworkHandlerKey, &qword_100816410);
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_delegate);
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingImageView_mirrorDelegate);
}

@end
