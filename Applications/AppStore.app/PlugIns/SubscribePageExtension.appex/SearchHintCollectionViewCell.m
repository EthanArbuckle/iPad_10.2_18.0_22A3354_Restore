@implementation SearchHintCollectionViewCell

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchHintCollectionViewCell();
  return -[SearchHintCollectionViewCell isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SearchHintCollectionViewCell();
  v4 = v5.receiver;
  -[SearchHintCollectionViewCell setHighlighted:](&v5, "setHighlighted:", v3);
  sub_100536C18();

}

- (_TtC22SubscribePageExtension28SearchHintCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28SearchHintCollectionViewCell *)sub_100536CD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28SearchHintCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC22SubscribePageExtension28SearchHintCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension28SearchHintCollectionViewCell_hintView;
  v6 = objc_allocWithZone((Class)type metadata accessor for SearchHintView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC22SubscribePageExtension28SearchHintCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/SearchHintCollectionViewCell.swift", 57, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SearchHintCollectionViewCell();
  v2 = (char *)v13.receiver;
  -[SearchHintCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension28SearchHintCollectionViewCell_hintView];
  v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension28SearchHintCollectionViewCell *v2;

  v2 = self;
  sub_100536F84();

}

- (_TtC22SubscribePageExtension14SearchHintView)accessibilityHintView
{
  return (_TtC22SubscribePageExtension14SearchHintView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC22SubscribePageExtension28SearchHintCollectionViewCell_hintView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28SearchHintCollectionViewCell_hintView));
}

@end
