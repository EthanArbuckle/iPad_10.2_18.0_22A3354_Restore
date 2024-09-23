@implementation EditorsChoiceCollectionViewCell

- (_TtC20ProductPageExtension31EditorsChoiceCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31EditorsChoiceCollectionViewCell *)sub_1004E85C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31EditorsChoiceCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  _TtC20ProductPageExtension31EditorsChoiceCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView;
  v6 = type metadata accessor for EditorsChoiceReviewView();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");
  v9 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_itemLayoutContext;
  v10 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);

  result = (_TtC20ProductPageExtension31EditorsChoiceCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/EditorsChoiceCollectionViewCell.swift", 58, 2, 46, 0);
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
  sub_1002AF474(0, 0);

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31EditorsChoiceCollectionViewCell *v2;

  v2 = self;
  sub_1004E89A4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  _TtC20ProductPageExtension31EditorsChoiceCollectionViewCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView);
  v4 = self;
  CGSize.subtracting(insets:)(-[EditorsChoiceCollectionViewCell layoutMargins](v4, "layoutMargins"));
  objc_msgSend(v3, "sizeThatFits:");
  v6 = v5;
  v8 = v7;
  v9 = -[EditorsChoiceCollectionViewCell layoutMargins](v4, "layoutMargins");
  v14 = CGSize.adding(outsets:)(v9, v10, v11, v12, v13, v6, v8);
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)moreFrom:(id)a3
{
  char *v3;
  void (*v4)(uint64_t);
  uint64_t v6;
  id v7;
  uint64_t v8;
  _TtC20ProductPageExtension31EditorsChoiceCollectionViewCell *v9;

  v3 = *(char **)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
     + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_moreTapHandler;
  v4 = *(void (**)(uint64_t))v3;
  if (*(_QWORD *)v3)
  {
    v6 = *((_QWORD *)v3 + 1);
    v7 = a3;
    v9 = self;
    v8 = sub_100018918((uint64_t)v4, v6);
    v4(v8);
    sub_100018908((uint64_t)v4, v6);

  }
}

- (_TtC20ProductPageExtension17EditorsChoiceView)accessibilityBadgeView
{
  return (_TtC20ProductPageExtension17EditorsChoiceView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                                  + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_badgeView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_textLabel));
}

- (BOOL)accessibilityShowsBadge
{
  return (*(_BYTE **)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView))[OBJC_IVAR____TtC20ProductPageExtension23EditorsChoiceReviewView_showsBadge];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_editorsChoiceReviewView));
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31EditorsChoiceCollectionViewCell_itemLayoutContext);
}

@end
