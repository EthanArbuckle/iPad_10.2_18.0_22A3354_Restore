@implementation STKImageGlyphCollectionViewLayout

- (STKImageGlyphCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  return (STKImageGlyphCollectionViewLayout *)sub_234684364((uint64_t)sub_2346863E4, v6, a4);
}

- (STKImageGlyphCollectionViewLayout)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_234686300();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  STKImageGlyphCollectionViewLayout *v3;
  uint64_t v4;
  void *v5;

  v3 = self;
  v4 = sub_234684540();

  if (v4)
  {
    sub_2346862C4();
    v5 = (void *)sub_2347178A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[STKImageGlyphCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, 0.0, 0.0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  STKImageGlyphCollectionViewLayout *v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v8 = self;
  v9 = sub_2346846C4(v7, v6, x, y);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  STKImageGlyphCollectionViewLayout *v7;
  BOOL v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_23468480C(x, y, width, height);

  return v8;
}

- (CGSize)collectionViewContentSize
{
  STKImageGlyphCollectionViewLayout *v2;
  char *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = self;
  v3 = sub_234684254();
  sub_234631424();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  STKImageGlyphCollectionViewLayout *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v4 = sub_234715B64();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  v8 = self;
  v9 = sub_234684254();
  v10 = sub_234631F88();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = sub_234715B34();
    v13 = sub_2345CE544(v12);

  }
  else
  {

    v13 = 0;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v13;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  STKImageGlyphCollectionViewLayout *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v5 = sub_234715B64();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  v9 = self;
  v10 = sub_234684254();
  v11 = sub_234631F88();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = sub_234715B34();
    v14 = (void *)sub_2345D1F84(v13);

  }
  else
  {

    v14 = 0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v14;
}

- (id)targetIndexPathForInteractivelyMovingItem:(id)a3 withPosition:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  STKImageGlyphCollectionViewLayout *v14;
  void (*v15)(char *, uint64_t);
  void *v16;
  uint64_t v18;

  y = a4.y;
  x = a4.x;
  v7 = sub_234715B64();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - v12;
  sub_234715B1C();
  v14 = self;
  sub_234684D9C(x, y);

  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v10, v7);
  v16 = (void *)sub_234715B10();
  v15(v13, v7);
  return v16;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  STKImageGlyphCollectionViewLayout *v11;
  void *v12;
  objc_class *v13;
  id v14;
  objc_super v16;

  y = a4.y;
  x = a4.x;
  v7 = sub_234715B64();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___STKImageGlyphCollectionViewLayout_isRearranging) = 1;
  v11 = self;
  v12 = (void *)sub_234715B10();
  v13 = (objc_class *)type metadata accessor for ImageGlyphCollectionViewLayout();
  v16.receiver = v11;
  v16.super_class = v13;
  v14 = -[STKImageGlyphCollectionViewLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v16, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, v12, x, y);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)invalidationContextForInteractivelyMovingItems:(id)a3 withTargetPosition:(CGPoint)a4 previousIndexPaths:(id)a5 previousPosition:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  STKImageGlyphCollectionViewLayout *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  y = a6.y;
  x = a6.x;
  v8 = a4.y;
  v9 = a4.x;
  sub_234715B64();
  sub_2347178BC();
  sub_2347178BC();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___STKImageGlyphCollectionViewLayout_isRearranging) = 0;
  v11 = self;
  v12 = (void *)sub_2347178A4();
  v13 = (void *)sub_2347178A4();
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for ImageGlyphCollectionViewLayout();
  v14 = -[STKImageGlyphCollectionViewLayout invalidationContextForInteractivelyMovingItems:withTargetPosition:previousIndexPaths:previousPosition:](&v16, sel_invalidationContextForInteractivelyMovingItems_withTargetPosition_previousIndexPaths_previousPosition_, v12, v13, v9, v8, x, y);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

- (id)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(id)a3 previousIndexPaths:(id)a4 movementCancelled:(BOOL)a5
{
  _BOOL8 v5;
  STKImageGlyphCollectionViewLayout *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v5 = a5;
  sub_234715B64();
  sub_2347178BC();
  sub_2347178BC();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___STKImageGlyphCollectionViewLayout_isRearranging) = 0;
  v7 = self;
  v8 = (void *)sub_2347178A4();
  v9 = (void *)sub_2347178A4();
  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for ImageGlyphCollectionViewLayout();
  v10 = -[STKImageGlyphCollectionViewLayout invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:previousIndexPaths:movementCancelled:](&v12, sel_invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths_previousIndexPaths_movementCancelled_, v8, v9, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v10;
}

- (void)invalidateLayout
{
  STKImageGlyphCollectionViewLayout *v2;
  char *v3;
  objc_super v4;

  v2 = self;
  v3 = sub_234684254();
  sub_234632128();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for ImageGlyphCollectionViewLayout();
  -[STKImageGlyphCollectionViewLayout invalidateLayout](&v4, sel_invalidateLayout);

}

- (void)prepareLayout
{
  STKImageGlyphCollectionViewLayout *v2;

  v2 = self;
  sub_2346855C0();

}

- (id)paginationOriginForContentOffset:(CGPoint)a3
{
  double x;
  STKImageGlyphCollectionViewLayout *v4;
  char *v5;
  uint64_t v6;
  char v7;
  char v8;
  id v9;

  x = a3.x;
  v4 = self;
  v5 = sub_234684254();
  v6 = sub_234631DB4(x);
  v8 = v7;

  if ((v8 & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&v6);

  return v9;
}

- (CGRect)targetRectForSectionIndex:(int64_t)a3
{
  STKImageGlyphCollectionViewLayout *v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[5];
  _BYTE v15[32];
  char v16;
  CGRect result;

  v4 = self;
  v5 = sub_234684254();
  sub_234631E40(a3, (uint64_t)v14);
  v6 = *(double *)v14;
  v7 = *(double *)&v14[1];
  v8 = *(double *)&v14[2];
  v9 = *(double *)&v14[3];

  sub_234686204((uint64_t)v14, (uint64_t)v15);
  v10 = 0.0;
  if ((v16 & 1) != 0)
    v11 = 0.0;
  else
    v11 = v8;
  if ((v16 & 1) != 0)
    v12 = 0.0;
  else
    v12 = v9;
  if ((v16 & 1) != 0)
    v13 = 0.0;
  else
    v13 = v6;
  if ((v16 & 1) == 0)
    v10 = v7;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v13;
  return result;
}

- (void)dealloc
{
  STKImageGlyphCollectionViewLayout *v2;

  v2 = self;
  ImageGlyphCollectionViewLayout.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___STKImageGlyphCollectionViewLayout____lazy_storage___layoutSolver));
}

- (STKImageGlyphCollectionViewLayout)initWithSection:(id)a3
{
  id v3;
  STKImageGlyphCollectionViewLayout *result;

  v3 = a3;
  result = (STKImageGlyphCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (STKImageGlyphCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  STKImageGlyphCollectionViewLayout *result;

  v5 = a3;
  v6 = a4;
  result = (STKImageGlyphCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (STKImageGlyphCollectionViewLayout)initWithSectionProvider:(id)a3
{
  void *v3;
  STKImageGlyphCollectionViewLayout *result;

  v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (STKImageGlyphCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (STKImageGlyphCollectionViewLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  STKImageGlyphCollectionViewLayout *result;

  _Block_copy(a4);
  v7 = a3;
  v8 = a5;
  result = (STKImageGlyphCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
