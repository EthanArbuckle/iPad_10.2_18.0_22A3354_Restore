@implementation ArtworkSectionBackgroundView

- (_TtC8AppStore28ArtworkSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28ArtworkSectionBackgroundView *)sub_1001DF348(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28ArtworkSectionBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001DF858();
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ArtworkSectionBackgroundView();
  v2 = (char *)v8.receiver;
  -[ArtworkSectionBackgroundView layoutSubviews](&v8, "layoutSubviews");
  objc_msgSend(v2, "bounds", v8.receiver, v8.super_class);
  CGRect.subtracting(insets:)(*(double *)&v2[OBJC_IVAR____TtC8AppStore28ArtworkSectionBackgroundView_insets], *(double *)&v2[OBJC_IVAR____TtC8AppStore28ArtworkSectionBackgroundView_insets + 8], *(double *)&v2[OBJC_IVAR____TtC8AppStore28ArtworkSectionBackgroundView_insets + 16], *(double *)&v2[OBJC_IVAR____TtC8AppStore28ArtworkSectionBackgroundView_insets + 24], v3, v4, v5, v6);
  ArtworkView.frame.setter(v7);

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkSectionBackgroundView();
  v2 = v3.receiver;
  -[ArtworkSectionBackgroundView prepareForReuse](&v3, "prepareForReuse");
  ArtworkView.image.setter(0);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28ArtworkSectionBackgroundView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28ArtworkSectionBackgroundView_artworkView));
}

@end
