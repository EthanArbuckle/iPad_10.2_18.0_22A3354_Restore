@implementation CNAvatarPosterPairCollectionViewLayout

- (_TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18AD46FD0();
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  _TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout *v4;
  void *v5;
  objc_super v6;

  sub_18ACBE1B0(0, &qword_1EDF9A580);
  sub_18AF4FD34();
  v4 = self;
  v5 = (void *)sub_18AF4FD28();
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
  -[CNAvatarPosterPairCollectionViewLayout prepareForCollectionViewUpdates:](&v6, sel_prepareForCollectionViewUpdates_, v5);

  swift_bridgeObjectRelease();
}

- (void)finalizeCollectionViewUpdates
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
  v2 = (char *)v4.receiver;
  -[CNAvatarPosterPairCollectionViewLayout finalizeCollectionViewUpdates](&v4, sel_finalizeCollectionViewUpdates);
  v3 = &v2[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete];
  swift_beginAccess();
  *(_QWORD *)v3 = MEMORY[0x1E0DEE9D8];

  swift_bridgeObjectRelease();
}

- (void)prepareLayout
{
  _TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout *v2;

  v2 = self;
  sub_18AD43770();

}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super._collectionViewBoundsSize.width
                 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds);
  v3 = *(double *)((char *)&self->super._collectionViewBoundsSize.height
                 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return sub_18AD45818(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18AD44DCC);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_18AD45D5C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_18AD450D0);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  return sub_18AD45818(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18AD45244);
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_18AD45D5C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_18AD458C0);
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  void *v3;

  swift_beginAccess();
  sub_18AF4E5B8();
  sub_18AF4E9A8();
  v3 = (void *)sub_18AF4FD28();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout *v7;
  uint64_t v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_18AD45EA0(x, y, width, height);

  if (v8)
  {
    sub_18ACBE1B0(0, &qword_1EDF9A578);
    v9 = (void *)sub_18AF4FD28();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  CGFloat x;
  _TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  x = a3.x;
  v4 = self;
  sub_18AD467D0(x);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (_TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout)init
{
  _TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout *result;

  result = (_TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18ACCDD44(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgressProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18ACCDE68((uint64_t)self+ OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_indexPathToMaintainForTransition, (uint64_t *)&unk_1EDF99400);
}

@end
