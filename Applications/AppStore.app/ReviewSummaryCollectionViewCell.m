@implementation ReviewSummaryCollectionViewCell

- (_TtC8AppStore31ReviewSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31ReviewSummaryCollectionViewCell *)sub_100292DF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC8AppStore31ReviewSummaryCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _TtC8AppStore31ReviewSummaryCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_reviewSummaryView;
  v8 = objc_allocWithZone((Class)type metadata accessor for ReviewSummaryView(0));
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8AppStore31ReviewSummaryCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ReviewSummaryCollectionViewCell.swift", 46, 2, 26, 0);
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
  v12.super_class = (Class)type metadata accessor for ReviewSummaryCollectionViewCell(0);
  v2 = (char *)v12.receiver;
  -[ReviewSummaryCollectionViewCell layoutSubviews](&v12, "layoutSubviews");
  v3 = objc_msgSend(v2, "contentView", v12.receiver, v12.super_class);
  v4 = sub_10003D7F8();
  *(_QWORD *)&v5 = LayoutMarginsAware<>.layoutFrame.getter(v4).n128_u64[0];
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_reviewSummaryView], "setFrame:", v5, v7, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore31ReviewSummaryCollectionViewCell *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[ReviewSummaryCollectionViewCell traitCollection](v5, "traitCollection");
  v7 = sub_100589D08((uint64_t)v6, width, height);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_reviewSummaryView));
}

@end
