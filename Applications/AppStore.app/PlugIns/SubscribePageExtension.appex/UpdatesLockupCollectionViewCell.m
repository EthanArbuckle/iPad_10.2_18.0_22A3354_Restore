@implementation UpdatesLockupCollectionViewCell

- (_TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell *)sub_1003810E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100382E88();
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
  sub_100381638();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell *v2;

  v2 = self;
  sub_100381764();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell *v2;

  v2 = self;
  sub_100381D48();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_100382550(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilitytLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_lockupView));
}

- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC22SubscribePageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_expandableTextView);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityVersionMetadata
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_versionMetadata));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_expandableTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_versionMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_separatorView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_fetchingArtworkTemplate, &qword_1007F8EC0);
}

@end
