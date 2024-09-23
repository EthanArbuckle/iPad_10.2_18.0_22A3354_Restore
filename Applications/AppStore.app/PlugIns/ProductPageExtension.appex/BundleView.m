@implementation BundleView

- (_TtC20ProductPageExtension10BundleView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension10BundleView *)sub_100463B70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension10BundleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100464C2C();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension10BundleView *v2;

  v2 = self;
  sub_100464028();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BundleView(0);
  v4 = a3;
  v5 = (char *)v9.receiver;
  -[BundleView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC20ProductPageExtension10BundleView_titleLabel];
  v7 = objc_msgSend(v5, "traitCollection", v9.receiver, v9.super_class);
  v8 = UITraitCollection.prefersAccessibilityLayouts.getter(v7);

  objc_msgSend(v6, "setNumberOfLines:", (v8 & 1) == 0);
  objc_msgSend(v5, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC20ProductPageExtension10BundleView *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  CGSize result;

  width = a3.width;
  v5 = type metadata accessor for Artwork.Style(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v6 + 16))(v9, (char *)self + OBJC_IVAR____TtC20ProductPageExtension10BundleView_iconStyle, v5, v7);
  v10 = self;
  v11 = sub_100464734((uint64_t)v9, v10, width);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension10BundleView_iconStyle;
  v4 = type metadata accessor for Artwork.Style(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10BundleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10BundleView_itemStack));
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension10BundleView_itemReusePool;
  v6 = sub_10000DAF8(&qword_1008250F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
