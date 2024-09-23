@implementation CollectionLockupArtwork

- (_TtC22SubscribePageExtension23CollectionLockupArtwork)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension23CollectionLockupArtwork *)sub_1000584B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension23CollectionLockupArtwork)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100059CA4();
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC22SubscribePageExtension23CollectionLockupArtwork *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v3 = (objc_class *)type metadata accessor for CollectionLockupArtwork();
  v12.receiver = self;
  v12.super_class = v3;
  v4 = self;
  -[CollectionLockupArtwork layoutSubviews](&v12, "layoutSubviews");
  sub_100058984(v9);
  v5 = v10;
  v6 = v11;
  sub_100011064(v9, v10);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(v3);
  v8 = -[CollectionLockupArtwork traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v8, v5, v6, v7);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension23CollectionLockupArtwork *v5;
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
  sub_100058984(v14);
  v7 = v15;
  v8 = v16;
  sub_100011064(v14, v15);
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v7, v8, width, height);
  v11 = v10;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CollectionLockupArtwork_icon1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CollectionLockupArtwork_icon2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CollectionLockupArtwork_icon3));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CollectionLockupArtwork_icon4));
}

@end
