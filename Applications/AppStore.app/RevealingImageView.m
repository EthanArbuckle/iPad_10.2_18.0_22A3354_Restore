@implementation RevealingImageView

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingImageView(0);
  v2 = v3.receiver;
  -[RevealingImageView layoutSubviews](&v3, "layoutSubviews");
  sub_1000401A4();

}

- (_TtC8AppStore18RevealingImageView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore18RevealingImageView *)sub_1001AE4C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (_TtC8AppStore18RevealingImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001B0084();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore18RevealingImageView_artworkLayoutWithMetrics));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_pageGrid, (uint64_t *)&unk_10082C3F0);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_currentArtworkTemplate, &qword_10082CC80);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_currentArtworkHandlerKey, &qword_1008329D8);
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_delegate);
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_mirrorDelegate);
}

@end
