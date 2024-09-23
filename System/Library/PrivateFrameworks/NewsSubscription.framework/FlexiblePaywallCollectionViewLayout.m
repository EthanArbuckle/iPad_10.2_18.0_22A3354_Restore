@implementation FlexiblePaywallCollectionViewLayout

- (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout)initWithCoder:(id)a3
{
  _TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *result;

  result = (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *)sub_1BA438260();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  _TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *v2;

  v2 = self;
  sub_1BA3D5030();

}

- (CGSize)collectionViewContentSize
{
  _TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_layoutProvider), *(_QWORD *)((char *)&self->super._collectionViewBoundsSize.height+ OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_layoutProvider));
  v3 = self;
  swift_retain();
  sub_1BA4364FC();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v6;
  v5 = v7;
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *v9;
  void *v10;
  uint64_t v12;

  v4 = sub_1BA4360C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA4360A0();
  v9 = self;
  v10 = (void *)sub_1BA3D5FF4((uint64_t)v8, &OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_itemAttributes);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v10;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *v10;
  void *v11;
  uint64_t v13;

  v5 = sub_1BA4360C4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA4360A0();
  v10 = self;
  v11 = (void *)sub_1BA3D5FF4((uint64_t)v9, &OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_supplementaryItemAttributes);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v11;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *v7;
  uint64_t v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1BA3D5BBC(x, y, width, height);

  if (v8)
  {
    sub_1BA3D5FB8();
    v9 = (void *)sub_1BA437DC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout)init
{
  _TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *result;

  result = (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_layoutProvider);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
