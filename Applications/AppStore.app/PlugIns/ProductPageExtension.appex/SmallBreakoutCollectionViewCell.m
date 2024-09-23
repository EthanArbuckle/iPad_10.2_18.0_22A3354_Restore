@implementation SmallBreakoutCollectionViewCell

- (_TtC20ProductPageExtension31SmallBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31SmallBreakoutCollectionViewCell *)sub_100543AD8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31SmallBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100544628();
}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[SmallBreakoutCollectionViewCell backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC20ProductPageExtension31SmallBreakoutCollectionViewCell *v7;
  void *v8;
  id v9;
  UIColor *v10;
  objc_super v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v6 = a3;
  v7 = self;
  -[SmallBreakoutCollectionViewCell setBackgroundColor:](&v12, "setBackgroundColor:", v6);
  v8 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_iconView);
  v11.receiver = v7;
  v11.super_class = ObjectType;
  v9 = v8;
  v10 = -[SmallBreakoutCollectionViewCell backgroundColor](&v11, "backgroundColor");
  ArtworkView.backgroundColor.setter(v10);

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31SmallBreakoutCollectionViewCell *v2;

  v2 = self;
  sub_10054401C();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension31SmallBreakoutCollectionViewCell *v2;

  v2 = self;
  sub_1005433B8();

}

- (_TtC20ProductPageExtension19BreakoutDetailsView)accessibilityDetailsView
{
  return (_TtC20ProductPageExtension19BreakoutDetailsView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_detailsView);
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_detailsView));
  swift_unknownObjectRelease();
}

@end
