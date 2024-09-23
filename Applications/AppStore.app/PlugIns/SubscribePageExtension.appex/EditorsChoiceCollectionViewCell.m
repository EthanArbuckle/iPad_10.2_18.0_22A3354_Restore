@implementation EditorsChoiceCollectionViewCell

- (_TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell *)sub_1000AFF04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  _TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView;
  v6 = type metadata accessor for EditorsChoiceReviewView();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");
  v9 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_itemLayoutContext;
  v10 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);

  result = (_TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/EditorsChoiceCollectionViewCell.swift", 60, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EditorsChoiceCollectionViewCell(0);
  v2 = v3.receiver;
  -[EditorsChoiceCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1003EB5CC(0, 0);

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell *v2;

  v2 = self;
  sub_1000B02E8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  _TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView);
  v4 = self;
  CGSize.subtracting(insets:)(-[EditorsChoiceCollectionViewCell layoutMargins](v4, "layoutMargins"));
  objc_msgSend(v3, "sizeThatFits:");
  v5 = CGSize.adding(outsets:)(-[EditorsChoiceCollectionViewCell layoutMargins](v4, "layoutMargins"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)moreFrom:(id)a3
{
  char *v3;
  void (*v4)(uint64_t);
  uint64_t v6;
  id v7;
  uint64_t v8;
  _TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell *v9;

  v3 = *(char **)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
     + OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_moreTapHandler;
  v4 = *(void (**)(uint64_t))v3;
  if (*(_QWORD *)v3)
  {
    v6 = *((_QWORD *)v3 + 1);
    v7 = a3;
    v9 = self;
    v8 = sub_100019320((uint64_t)v4, v6);
    v4(v8);
    sub_100019310((uint64_t)v4, v6);

  }
}

- (_TtC22SubscribePageExtension17EditorsChoiceView)accessibilityBadgeView
{
  return (_TtC22SubscribePageExtension17EditorsChoiceView *)*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView) + OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_badgeView);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_textLabel));
}

- (BOOL)accessibilityShowsBadge
{
  return (*(_BYTE **)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView))[OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_showsBadge];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView));
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31EditorsChoiceCollectionViewCell_itemLayoutContext);
}

@end
