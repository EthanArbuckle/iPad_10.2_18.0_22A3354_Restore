@implementation UpdatesLockupCollectionViewCell

- (_TtC20ProductPageExtension31UpdatesLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31UpdatesLockupCollectionViewCell *)sub_10035FBD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31UpdatesLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10036196C();
}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpdatesLockupCollectionViewCell(0);
  return -[UpdatesLockupCollectionViewCell backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UpdatesLockupCollectionViewCell(0);
  v4 = a3;
  v5 = v6.receiver;
  -[UpdatesLockupCollectionViewCell setBackgroundColor:](&v6, "setBackgroundColor:", v4);
  sub_100360120();

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31UpdatesLockupCollectionViewCell *v2;

  v2 = self;
  sub_10036024C();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension31UpdatesLockupCollectionViewCell *v2;

  v2 = self;
  sub_100360830();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension31UpdatesLockupCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_100361038(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilitytLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_lockupView));
}

- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC20ProductPageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_expandableTextView);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityVersionMetadata
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_versionMetadata));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_expandableTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_versionMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_separatorView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_fetchingArtworkTemplate, &qword_100808E90);
}

@end
