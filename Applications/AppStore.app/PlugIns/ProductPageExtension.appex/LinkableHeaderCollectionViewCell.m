@implementation LinkableHeaderCollectionViewCell

- (_TtC20ProductPageExtension32LinkableHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32LinkableHeaderCollectionViewCell *)sub_1000F41F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension32LinkableHeaderCollectionViewCell)initWithCoder:(id)a3
{
  _TtC20ProductPageExtension32LinkableHeaderCollectionViewCell *result;

  result = (_TtC20ProductPageExtension32LinkableHeaderCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/LinkableHeaderCollectionViewCell.swift", 59, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for LinkableHeaderCollectionViewCell();
  v2 = (char *)v12.receiver;
  -[LinkableHeaderCollectionViewCell layoutSubviews](&v12, "layoutSubviews");
  v3 = objc_msgSend(v2, "contentView", v12.receiver, v12.super_class);
  v4 = sub_1000951BC();
  v5 = LayoutMarginsAware<>.layoutFrame.getter(v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension32LinkableHeaderCollectionViewCell_headerView], "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32LinkableHeaderCollectionViewCell_headerView));
}

@end
