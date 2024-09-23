@implementation BaseCollectionCompositionalLayout

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject(&unk_10076BDD8, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  return (_TtC8AppStore33BaseCollectionCompositionalLayout *)sub_100031174((uint64_t)sub_10004AFFC, v6, a4);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8AppStore33BaseCollectionCompositionalLayout *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_10001E210(x, y, width, height);

  return v8;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8AppStore33BaseCollectionCompositionalLayout *v7;
  char v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1000398F8(x, y, width, height);

  return v8 & 1;
}

- (void)prepareLayout
{
  char *v2;
  uint64_t *v3;
  void (*v4)(char *, __n128);
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
  v2 = (char *)v9.receiver;
  -[BaseCollectionCompositionalLayout prepareLayout](&v9, "prepareLayout");
  v3 = (uint64_t *)&v2[OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  v4 = *(void (**)(char *, __n128))&v2[OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  if (v4)
  {
    v5 = v3[1];
    v6 = swift_retain(v5);
    v4(v2, v6);
    sub_10003A350((uint64_t)v4, v5);
    v7 = *v3;
  }
  else
  {
    v7 = 0;
  }
  v8 = v3[1];
  *v3 = 0;
  v3[1] = 0;
  sub_10003A350(v7, v8);

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  NSArray v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
  v7 = v16.receiver;
  v8 = -[BaseCollectionCompositionalLayout layoutAttributesForElementsInRect:](&v16, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (v8)
  {
    v9 = v8;
    v10 = sub_1000548C4();
    v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

    v12 = v7;
    v13 = sub_100324100(v11);

    swift_bridgeObjectRelease(v11);
    v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v13);
  }
  else
  {

    v14.super.isa = 0;
  }
  return v14.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8AppStore33BaseCollectionCompositionalLayout *v9;
  Class isa;
  objc_class *v11;
  char *v12;
  char *v13;
  objc_super v15;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v11 = (objc_class *)type metadata accessor for BaseCollectionCompositionalLayout();
  v15.receiver = v9;
  v15.super_class = v11;
  v12 = (char *)-[BaseCollectionCompositionalLayout layoutAttributesForItemAtIndexPath:](&v15, "layoutAttributesForItemAtIndexPath:", isa);

  if (v12)
  {
    v13 = v12;
    v12 = sub_100323D34(v13);

    v9 = (_TtC8AppStore33BaseCollectionCompositionalLayout *)v13;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v12;
}

+ (Class)layoutAttributesClass
{
  uint64_t v2;

  v2 = type metadata accessor for BaseCollectionViewLayoutAttributes();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore33BaseCollectionCompositionalLayout *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_indexPathsRequiringRubberbanding) = (Class)&_swiftEmptySetSingleton;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/BaseCollectionCompositionalLayout.swift", 48, 2, 138, 0);
  __break(1u);
  return result;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_100323BEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_layoutAttributesForSupplementaryViewOfKind_atIndexPath_);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_100323BEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_layoutAttributesForDecorationViewOfKind_atIndexPath_);
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3
{
  id v3;
  _TtC8AppStore33BaseCollectionCompositionalLayout *result;

  v3 = a3;
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer("AppStore.BaseCollectionCompositionalLayout", 42, "init(section:)", 14, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  _TtC8AppStore33BaseCollectionCompositionalLayout *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer("AppStore.BaseCollectionCompositionalLayout", 42, "init(section:configuration:)", 28, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v3;
  _TtC8AppStore33BaseCollectionCompositionalLayout *result;

  v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer("AppStore.BaseCollectionCompositionalLayout", 42, "init(sectionProvider:)", 22, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  _TtC8AppStore33BaseCollectionCompositionalLayout *result;

  _Block_copy(a4);
  v7 = a3;
  v8 = a5;
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer("AppStore.BaseCollectionCompositionalLayout", 42, "init(section:sectionProvider:configuration:)", 44, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_indexPathsRequiringRubberbanding));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver), *(_QWORD *)&self->indexPathsRequiringRubberbanding[OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver]);
}

@end
