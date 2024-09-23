@implementation CollectionLockupArtwork

- (_TtC20ProductPageExtension23CollectionLockupArtwork)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23CollectionLockupArtwork *)sub_10040D920(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23CollectionLockupArtwork)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10040F08C();
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC20ProductPageExtension23CollectionLockupArtwork *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v3 = (objc_class *)type metadata accessor for CollectionLockupArtwork();
  v18.receiver = self;
  v18.super_class = v3;
  v4 = self;
  -[CollectionLockupArtwork layoutSubviews](&v18, "layoutSubviews");
  sub_10040DDEC(v15);
  v5 = v16;
  v6 = v17;
  sub_100010F08(v15, v16);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(v3);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[CollectionLockupArtwork traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v14, v5, v6, v7, v9, v11, v13);

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v15);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension23CollectionLockupArtwork *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[CollectionLockupArtwork traitCollection](v5, "traitCollection");
  sub_10040DDEC(v14);
  v7 = v15;
  v8 = v16;
  sub_100010F08(v14, v15);
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v7, v8, width, height);
  v11 = v10;
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23CollectionLockupArtwork_icon1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23CollectionLockupArtwork_icon2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23CollectionLockupArtwork_icon3));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23CollectionLockupArtwork_icon4));
}

@end
