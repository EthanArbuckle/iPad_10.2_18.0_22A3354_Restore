@implementation WideFlowLayout

- (_TtC26GameCenterMessageExtension14WideFlowLayout)init
{
  return (_TtC26GameCenterMessageExtension14WideFlowLayout *)sub_100022FB8();
}

- (_TtC26GameCenterMessageExtension14WideFlowLayout)initWithCoder:(id)a3
{
  return (_TtC26GameCenterMessageExtension14WideFlowLayout *)sub_1000230D4(a3);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize);
  v3 = *(double *)&self->maxRowsPerSection[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareLayout
{
  _TtC26GameCenterMessageExtension14WideFlowLayout *v2;

  v2 = self;
  sub_1000236A8();

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC26GameCenterMessageExtension14WideFlowLayout *v7;
  id v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_100023E10(x, y, width, height);

  if (v8)
  {
    sub_100025030();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC26GameCenterMessageExtension14WideFlowLayout *v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  v15 = sub_100024418(v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_itemAttributes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes));
}

@end
