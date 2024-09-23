@implementation CollectionLockupArtwork

- (_TtC8AppStore23CollectionLockupArtwork)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23CollectionLockupArtwork *)sub_10053DAFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23CollectionLockupArtwork)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10053F268();
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC8AppStore23CollectionLockupArtwork *v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v3 = (objc_class *)type metadata accessor for CollectionLockupArtwork();
  v19.receiver = self;
  v19.super_class = v3;
  v4 = self;
  -[CollectionLockupArtwork layoutSubviews](&v19, "layoutSubviews");
  sub_10053DFC8(v16, v5);
  v6 = v17;
  v7 = v18;
  sub_100060B40(v16, v17);
  *(_QWORD *)&v8 = LayoutMarginsAware<>.layoutFrame.getter(v3).n128_u64[0];
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[CollectionLockupArtwork traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v15, v6, v7, v8, v10, v12, v14);

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v16);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore23CollectionLockupArtwork *v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[CollectionLockupArtwork traitCollection](v5, "traitCollection");
  sub_10053DFC8(v15, v7);
  v8 = v16;
  v9 = v17;
  sub_100060B40(v15, v16);
  v10 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v8, v9, width, height);
  v12 = v11;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v15);

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void).cxx_destruct
{

}

@end
