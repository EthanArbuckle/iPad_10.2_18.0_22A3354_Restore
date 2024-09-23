@implementation InteractiveTimelineCollectionViewLayout

- (NSString)description
{
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_2318D63CC();
  sub_2318D56A0();
  swift_bridgeObjectRelease();
  sub_2318D56A0();
  sub_2318D6138();

  v4 = (void *)sub_2318D558C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout)initWithCoder:(id)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  id v7;
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *result;

  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_itemHeight;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_contentSize;
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_computedAttributes;
  v7 = a3;
  *(Class *)((char *)&self->super.super.isa + v6) = (Class)sub_2317FB2C4(MEMORY[0x24BEE4AF8]);

  result = (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *)sub_2318D6150();
  __break(1u);
  return result;
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for InteractiveTimelineCollectionViewLayoutAttributes();
  return (Class)swift_getObjCClassFromMetadata();
}

+ (Class)invalidationContextClass
{
  type metadata accessor for InteractiveTimelineCollectionViewLayoutInvalidationContext();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareLayout
{
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *v2;

  v2 = self;
  sub_2318735A0();

}

- (CGSize)collectionViewContentSize
{
  double *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_contentSize);
  v3 = 0.0;
  v4 = 0.0;
  if ((*((_BYTE *)&self->super._collectionViewBoundsSize.width
        + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_contentSize) & 1) == 0)
  {
    v4 = *v2;
    v3 = v2[1];
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *v7;
  id v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = -[InteractiveTimelineCollectionViewLayout collectionView](v7, sel_collectionView);
  if (v8)
    sub_231873758(v8, x, y, width, height);

  sub_2318750C8();
  v9 = (void *)sub_2318D5778();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *v8;
  char *v9;
  uint64_t v11;

  v4 = sub_2318D2B80();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2B38();
  v8 = self;
  v9 = sub_231873B20((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *v5;

  v4 = a3;
  v5 = self;
  sub_231873EE8(v4);

}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *v7;
  _BYTE *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_23187415C(x, y, width, height);

  return v8;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x;
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  x = a3.x;
  v5 = self;
  v6 = sub_231874F5C(x);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[InteractiveTimelineCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, 0.0, 0.0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout)init
{
  _TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *result;

  result = (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._insertedSupplementaryIndexPathsDict
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_config));
  swift_bridgeObjectRelease();
}

@end
