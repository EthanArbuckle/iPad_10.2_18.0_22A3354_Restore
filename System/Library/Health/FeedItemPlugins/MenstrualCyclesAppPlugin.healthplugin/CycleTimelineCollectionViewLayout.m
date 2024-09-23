@implementation CycleTimelineCollectionViewLayout

- (NSString)description
{
  _TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_231CA2D0C();
  sub_231CA1CC8();
  swift_bridgeObjectRelease();
  sub_231CA1CC8();
  sub_231CA29AC();

  v4 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231C9C934();
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for CycleTimelineCollectionViewLayoutAttributes();
  return (Class)swift_getObjCClassFromMetadata();
}

+ (Class)invalidationContextClass
{
  type metadata accessor for CycleTimelineCollectionViewLayoutInvalidationContext();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareLayout
{
  _TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *v2;

  v2 = self;
  sub_231C9B180();

}

- (CGSize)collectionViewContentSize
{
  double *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize);
  v3 = 0.0;
  v4 = 0.0;
  if ((*((_BYTE *)&self->super._collectionViewBoundsSize.width
        + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize) & 1) == 0)
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
  _TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *v7;
  id v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = -[CycleTimelineCollectionViewLayout collectionView](v7, sel_collectionView);
  if (v8)
    sub_231C9B664(v8, x, y, width, height);

  sub_231C661D4();
  v9 = (void *)sub_231CA1D94();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *v8;
  char *v9;
  uint64_t v11;

  v4 = sub_231C9D438();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v8 = self;
  v9 = sub_231C9B9F8((uint64_t)v7);

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
  _TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *v5;

  v4 = a3;
  v5 = self;
  sub_231C9BD80(v4);

}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *v7;
  _BYTE *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_231C9BFE0(x, y, width, height);

  return v8;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat y;
  double x;
  uint64_t v7;
  _TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *v8;
  id v9;
  void *v10;
  CGFloat Width;
  double v12;
  double v13;
  CGPoint result;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v7 = sub_231C9D438();
  MEMORY[0x24BDAC7A8](v7);
  v8 = self;
  v9 = -[CycleTimelineCollectionViewLayout collectionView](v8, sel_collectionView);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_bounds);
    Width = CGRectGetWidth(v15);
    sub_231C9C18C(v10, x + Width * 0.5);
  }

  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[CycleTimelineCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, 0.0, 0.0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout)init
{
  _TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *result;

  result = (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
