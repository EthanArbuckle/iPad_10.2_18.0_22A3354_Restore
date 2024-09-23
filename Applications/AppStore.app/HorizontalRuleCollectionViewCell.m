@implementation HorizontalRuleCollectionViewCell

- (_TtC8AppStore32HorizontalRuleCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32HorizontalRuleCollectionViewCell *)sub_10061EB38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32HorizontalRuleCollectionViewCell)initWithCoder:(id)a3
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
  uint64_t v14;
  uint64_t v15;
  _TtC8AppStore32HorizontalRuleCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_lineLayer;
  v8 = objc_allocWithZone((Class)CAShapeLayer);
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "init");
  v10 = (char *)self + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_style;
  v11 = enum case for HorizontalRule.Style.solid(_:);
  v12 = type metadata accessor for HorizontalRule.Style(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);
  v13 = OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_lineColor;
  v14 = sub_100008FE4(0, (unint64_t *)&qword_10082A430, UIColor_ptr);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)static UIColor.defaultLine.getter(v14, v15);

  result = (_TtC8AppStore32HorizontalRuleCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/HorizontalRuleCollectionViewCell.swift", 47, 2, 50, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore32HorizontalRuleCollectionViewCell *v2;

  v2 = self;
  sub_10061EE7C();

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _TtC8AppStore32HorizontalRuleCollectionViewCell *v2;

  v2 = self;
  sub_10061F05C();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_lineLayer));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_style;
  v4 = type metadata accessor for HorizontalRule.Style(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_lineColor));
}

@end
