@implementation QuoteCollectionViewCell

- (_TtC8AppStore23QuoteCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23QuoteCollectionViewCell *)sub_1001E23F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23QuoteCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _TtC8AppStore23QuoteCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore23QuoteCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore23QuoteCollectionViewCell_preferredArtworkSize);
  *v7 = 0;
  v7[1] = 0;
  v8 = a3;

  result = (_TtC8AppStore23QuoteCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/QuoteCollectionViewCell.swift", 38, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  -[QuoteCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore23QuoteCollectionViewCell_quoteView];
  v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  v5 = sub_10003D7F8();
  *(_QWORD *)&v6 = LayoutMarginsAware<>.layoutFrame.getter(v5).n128_u64[0];
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore23QuoteCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23QuoteCollectionViewCell_quoteView));
}

@end
