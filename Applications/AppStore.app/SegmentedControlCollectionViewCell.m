@implementation SegmentedControlCollectionViewCell

- (_TtC8AppStore34SegmentedControlCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34SegmentedControlCollectionViewCell *)sub_10054A254(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34SegmentedControlCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore34SegmentedControlCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_isFirstSetup) = 1;
  v7 = a3;

  result = (_TtC8AppStore34SegmentedControlCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/SegmentedControlCollectionViewCell.swift", 49, 2, 43, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC8AppStore34SegmentedControlCollectionViewCell *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v4 = self;
  -[SegmentedControlCollectionViewCell layoutSubviews](&v9, "layoutSubviews");
  *(_QWORD *)&v10.origin.x = LayoutMarginsAware<>.layoutFrame.getter(ObjectType).n128_u64[0];
  CGRectGetWidth(v10);
  v5 = *(Class *)((char *)&v4->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_segmentedControl);
  LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "sizeThatFits:", v6, v7, v9.receiver, v9.super_class);
  *(_QWORD *)&v8 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType).n128_u64[0];
  LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "setFrame:", v8);

}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_segmentedControl));
}

@end
