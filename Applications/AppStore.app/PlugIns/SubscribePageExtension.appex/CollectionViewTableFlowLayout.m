@implementation CollectionViewTableFlowLayout

- (_TtC22SubscribePageExtension29CollectionViewTableFlowLayout)init
{
  return (_TtC22SubscribePageExtension29CollectionViewTableFlowLayout *)sub_1003F3E24();
}

- (BOOL)sectionHeadersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3
{
  _TtC22SubscribePageExtension29CollectionViewTableFlowLayout *v3;

  v3 = self;
  sub_1003F54DC((void *)0x800000010064A670);

}

- (BOOL)sectionFootersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionFootersPinToVisibleBounds:(BOOL)a3
{
  _TtC22SubscribePageExtension29CollectionViewTableFlowLayout *v3;

  v3 = self;
  sub_1003F54DC((void *)0x800000010064A630);

}

- (void)prepareLayout
{
  _TtC22SubscribePageExtension29CollectionViewTableFlowLayout *v2;

  v2 = self;
  sub_1003F40E4();

}

- (CGSize)collectionViewContentSize
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CollectionViewTableFlowLayout();
  v2 = (char *)v10.receiver;
  -[CollectionViewTableFlowLayout collectionViewContentSize](&v10, "collectionViewContentSize");
  v4 = v3;
  v6 = v5;
  v7 = *(double *)&v2[OBJC_IVAR____TtC22SubscribePageExtension29CollectionViewTableFlowLayout_globalHeaderSize + 8];

  v8 = v6 + v7;
  v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC22SubscribePageExtension29CollectionViewTableFlowLayout *v9;
  id v10;
  uint64_t v12;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = sub_1003F433C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1003F4780(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1003F44B8);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1003F4780(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1003F468C);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC22SubscribePageExtension29CollectionViewTableFlowLayout *v7;
  uint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1003F4854(x, y, width, height);

  if (v8)
  {
    sub_1000CFCE0();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1003F4B74(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_finalLayoutAttributesForDisappearingSupplementaryElementOfKind_atIndexPath_);
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1003F4B74(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_initialLayoutAttributesForAppearingSupplementaryElementOfKind_atIndexPath_);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC22SubscribePageExtension29CollectionViewTableFlowLayout *v7;
  char v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1003F4CA4(x, y, width, height);

  return v8 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC22SubscribePageExtension29CollectionViewTableFlowLayout *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1003F4E38(x, y, width, height);

  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension29CollectionViewTableFlowLayout *v5;

  v4 = a3;
  v5 = self;
  sub_1003F5080(v4);

}

- (void).cxx_destruct
{
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension29CollectionViewTableFlowLayout_pendingPrepareObserver), *(_QWORD *)&self->super.multiColumnMinYBySection[OBJC_IVAR____TtC22SubscribePageExtension29CollectionViewTableFlowLayout_pendingPrepareObserver]);
}

@end
