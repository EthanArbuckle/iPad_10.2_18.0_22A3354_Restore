@implementation CKTapbackPickerCollectionViewLayout

- (CKTapbackPickerCollectionViewLayout)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  CKTapbackPickerCollectionViewLayout *result;

  *(UICollectionView **)((char *)&self->super.super._collectionView
                       + OBJC_IVAR___CKTapbackPickerCollectionViewLayout_tapbackPickerLayoutDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___CKTapbackPickerCollectionViewLayout____lazy_storage___dynamicAnimator) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___CKTapbackPickerCollectionViewLayout_lastPanGestureRecognizerPositionInCollectionViewCoordinates);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (CKTapbackPickerCollectionViewLayout *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewLayout();
  v2 = v3.receiver;
  -[CKTapbackPickerCollectionViewLayout prepareLayout](&v3, sel_prepareLayout);
  sub_18E70557C();
  sub_18E705894();

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  CKTapbackPickerCollectionViewLayout *v8;
  void *v9;
  objc_class *v10;
  id v11;
  CKTapbackPickerCollectionViewLayout *v12;
  objc_super v14;

  v4 = sub_18E76644C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76641C();
  v8 = self;
  if (UIAccessibilityIsReduceMotionEnabled() || UIAccessibilityIsVoiceOverRunning())
  {
    v9 = (void *)sub_18E766410();
    v10 = (objc_class *)type metadata accessor for TapbackPickerCollectionViewLayout();
    v14.receiver = v8;
    v14.super_class = v10;
    v11 = -[CKTapbackPickerCollectionViewLayout layoutAttributesForItemAtIndexPath:](&v14, sel_layoutAttributesForItemAtIndexPath_, v9);
  }
  else
  {
    v12 = (CKTapbackPickerCollectionViewLayout *)sub_18E70515C();
    v9 = (void *)sub_18E766410();
    v11 = -[CKTapbackPickerCollectionViewLayout layoutAttributesForCellAtIndexPath:](v12, sel_layoutAttributesForCellAtIndexPath_, v9);

    v8 = v12;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKTapbackPickerCollectionViewLayout *v7;
  uint64_t v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_18E705F0C(x, y, width, height);

  if (v8)
  {
    sub_18E00F31C(0, &qword_1EE0F5098);
    v9 = (void *)sub_18E768AC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  _BOOL4 v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewLayout();
  v7 = v11.receiver;
  v8 = -[CKTapbackPickerCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v11, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height);
  if (v8)
  {
    v9 = sub_18E70515C();
    objc_msgSend(v9, sel_removeAllBehaviors, v11.receiver, v11.super_class);

  }
  sub_18E7061BC(x, y, width, height);

  return v8;
}

- (CKTapbackPickerCollectionViewLayout)initWithSection:(id)a3
{
  id v3;
  CKTapbackPickerCollectionViewLayout *result;

  v3 = a3;
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKTapbackPickerCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  CKTapbackPickerCollectionViewLayout *result;

  v5 = a3;
  v6 = a4;
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKTapbackPickerCollectionViewLayout)initWithSectionProvider:(id)a3
{
  void *v3;
  CKTapbackPickerCollectionViewLayout *result;

  v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKTapbackPickerCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  id v6;
  CKTapbackPickerCollectionViewLayout *result;

  v5 = _Block_copy(a3);
  v6 = a4;
  _Block_release(v5);
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKTapbackPickerCollectionViewLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  CKTapbackPickerCollectionViewLayout *result;

  _Block_copy(a4);
  v7 = a3;
  v8 = a5;
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackPickerCollectionViewLayout_tapbackPickerLayoutDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerCollectionViewLayout____lazy_storage___dynamicAnimator));
}

@end
