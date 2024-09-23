@implementation HorizontalRuleCollectionViewCell

- (_TtC20ProductPageExtension32HorizontalRuleCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32HorizontalRuleCollectionViewCell *)sub_10006BEEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension32HorizontalRuleCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC20ProductPageExtension32HorizontalRuleCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension32HorizontalRuleCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC20ProductPageExtension32HorizontalRuleCollectionViewCell_lineLayer;
  v8 = objc_allocWithZone((Class)CAShapeLayer);
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "init");
  v10 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension32HorizontalRuleCollectionViewCell_style;
  v11 = enum case for HorizontalRule.Style.solid(_:);
  v12 = type metadata accessor for HorizontalRule.Style(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);
  v13 = OBJC_IVAR____TtC20ProductPageExtension32HorizontalRuleCollectionViewCell_lineColor;
  sub_100018B6C(0, (unint64_t *)&qword_100808850, UIColor_ptr);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)static UIColor.defaultLine.getter();

  result = (_TtC20ProductPageExtension32HorizontalRuleCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/HorizontalRuleCollectionViewCell.swift", 59, 2, 50, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension32HorizontalRuleCollectionViewCell *v2;

  v2 = self;
  sub_10006C230();

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  uint64_t v2;
  _TtC20ProductPageExtension32HorizontalRuleCollectionViewCell *v3;

  v3 = self;
  sub_10006C410((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension32HorizontalRuleCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32HorizontalRuleCollectionViewCell_lineLayer));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension32HorizontalRuleCollectionViewCell_style;
  v4 = type metadata accessor for HorizontalRule.Style(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32HorizontalRuleCollectionViewCell_lineColor));
}

@end
