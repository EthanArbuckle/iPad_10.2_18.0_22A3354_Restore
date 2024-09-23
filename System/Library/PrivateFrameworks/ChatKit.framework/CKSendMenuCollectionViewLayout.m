@implementation CKSendMenuCollectionViewLayout

- (CKSendMenuCollectionViewLayout)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E52E610();
}

+ (Class)invalidationContextClass
{
  type metadata accessor for SendMenuCollectionViewLayoutInvalidationContext();
  return (Class)swift_getObjCClassFromMetadata();
}

- (CGSize)collectionViewContentSize
{
  double *v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR___CKSendMenuCollectionViewLayout_frozenCollectionViewContentSize);
  if ((*((_BYTE *)&self->super.super._collectionViewBoundsSize.width
        + OBJC_IVAR___CKSendMenuCollectionViewLayout_frozenCollectionViewContentSize) & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for SendMenuCollectionViewLayout();
    -[CKSendMenuCollectionViewLayout collectionViewContentSize](&v5, sel_collectionViewContentSize);
  }
  else
  {
    v3 = *v2;
    v4 = v2[1];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  return sub_18E52DAAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18E52B350);
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  CKSendMenuCollectionViewLayout *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[6];

  v7 = self;
  v8 = a3;
  v9 = a4;
  v10 = sub_18E52EAB8(a3, a4);
  v12 = v11;

  if (v10)
  {
    v14[4] = v10;
    v14[5] = v12;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 1107296256;
    v14[2] = sub_18E52BE2C;
    v14[3] = &block_descriptor_4;
    v10 = _Block_copy(v14);
    swift_release();
  }
  return v10;
}

- (void)prepareLayout
{
  CKSendMenuCollectionViewLayout *v2;

  v2 = self;
  sub_18E52BEB0();

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(void);
  CKSendMenuCollectionViewLayout *v9;
  CKSendMenuCollectionViewLayout *v10;
  void *v11;
  id v12;
  objc_class *v13;
  objc_super v15;

  v4 = sub_18E76644C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76641C();
  v8 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x110);
  v9 = self;
  if ((v8() & 1) != 0)
  {
    v10 = (CKSendMenuCollectionViewLayout *)sub_18E52AC48();
    v11 = (void *)sub_18E766410();
    v12 = -[CKSendMenuCollectionViewLayout layoutAttributesForCellAtIndexPath:](v10, sel_layoutAttributesForCellAtIndexPath_, v11);

    v9 = v10;
  }
  else
  {
    v11 = (void *)sub_18E766410();
    v13 = (objc_class *)type metadata accessor for SendMenuCollectionViewLayout();
    v15.receiver = v9;
    v15.super_class = v13;
    v12 = -[CKSendMenuCollectionViewLayout layoutAttributesForItemAtIndexPath:](&v15, sel_layoutAttributesForItemAtIndexPath_, v11);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  return sub_18E52E3AC(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_18E52CA0C);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKSendMenuCollectionViewLayout *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_18E52CC3C(x, y, width, height);

  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SendMenuCollectionViewLayout();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[CKSendMenuCollectionViewLayout invalidateLayoutWithContext:](&v8, sel_invalidateLayoutWithContext_, v4);
  type metadata accessor for SendMenuCollectionViewLayoutInvalidationContext();
  v6 = swift_dynamicCastClass();
  if (v6
    && (*(_BYTE *)(v6
                 + OBJC_IVAR____TtC7ChatKit47SendMenuCollectionViewLayoutInvalidationContext_sectionToMakeVisible
                 + 8) & 1) == 0)
  {
    v7 = &v5[OBJC_IVAR___CKSendMenuCollectionViewLayout_sectionToMakeVisibleInPrepare];
    *(_QWORD *)v7 = *(_QWORD *)(v6
                              + OBJC_IVAR____TtC7ChatKit47SendMenuCollectionViewLayoutInvalidationContext_sectionToMakeVisible);
    v7[8] = 0;
  }

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
  v11.super_class = (Class)type metadata accessor for SendMenuCollectionViewLayout();
  v7 = v11.receiver;
  v8 = -[CKSendMenuCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v11, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height);
  if (v8)
  {
    v9 = sub_18E52AC48();
    objc_msgSend(v9, sel_removeAllBehaviors, v11.receiver, v11.super_class);

  }
  objc_msgSend(v7, sel_stretchSpringsAttachedToCellsForBoundsChange_, x, y, width, height, v11.receiver, v11.super_class);

  return v8;
}

- (CKSendMenuCollectionViewLayout)initWithSection:(id)a3
{
  id v3;
  CKSendMenuCollectionViewLayout *result;

  v3 = a3;
  result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKSendMenuCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  CKSendMenuCollectionViewLayout *result;

  v5 = a3;
  v6 = a4;
  result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKSendMenuCollectionViewLayout)initWithSectionProvider:(id)a3
{
  void *v3;
  CKSendMenuCollectionViewLayout *result;

  v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKSendMenuCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  id v6;
  CKSendMenuCollectionViewLayout *result;

  v5 = _Block_copy(a3);
  v6 = a4;
  _Block_release(v5);
  result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKSendMenuCollectionViewLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  CKSendMenuCollectionViewLayout *result;

  _Block_copy(a4);
  v7 = a3;
  v8 = a5;
  result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKSendMenuCollectionViewLayout_sendMenuLayoutDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuCollectionViewLayout____lazy_storage___dynamicAnimator));
}

- (void)stretchSpringsAttachedToCellsForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CKSendMenuCollectionViewLayout *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_18E52D318(x, y, width, height);

}

@end
