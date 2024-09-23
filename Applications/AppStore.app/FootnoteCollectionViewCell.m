@implementation FootnoteCollectionViewCell

- (_TtC8AppStore26FootnoteCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26FootnoteCollectionViewCell *)sub_100400E74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26FootnoteCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _TtC8AppStore26FootnoteCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_footnoteView;
  v8 = type metadata accessor for FootnoteView();
  v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v8));
  v10 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v9, "init");

  result = (_TtC8AppStore26FootnoteCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/FootnoteCollectionViewCell.swift", 41, 2, 30, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC8AppStore26FootnoteCollectionViewCell *v2;

  v2 = self;
  sub_100400DB4();

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
  -[FootnoteCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_footnoteView];
  v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  v5 = sub_10003D7F8();
  *(_QWORD *)&v6 = LayoutMarginsAware<>.layoutFrame.getter(v5).n128_u64[0];
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[FootnoteCollectionViewCell isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC8AppStore26FootnoteCollectionViewCell *v4;

  v4 = self;
  sub_100401220(a3);

}

- (_TtC8AppStore12FootnoteView)accessibilityFootnoteView
{
  return (_TtC8AppStore12FootnoteView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                + OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_footnoteView));
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_footnoteView));
}

@end
