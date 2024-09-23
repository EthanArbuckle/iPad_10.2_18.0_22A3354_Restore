@implementation MenuBar

- (_TtC13FTMInternal_47MenuBar)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_47MenuBar *)sub_1001A2D9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_47MenuBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001A3A58();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->animationDuration[OBJC_IVAR____TtC13FTMInternal_47MenuBar_cellId]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_47MenuBar_menuImageNames));
  sub_10014C77C((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_47MenuBar_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_47MenuBar____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_47MenuBar_horizontalBarLeftAnchorConstraint));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13FTMInternal_47MenuBar_numberOfSegments);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13FTMInternal_47MenuBar *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1001A2FA0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13FTMInternal_47MenuBar *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1001A3B68((uint64_t)v10, v13, v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC13FTMInternal_47MenuBar *v15;
  CGFloat v16;
  CGFloat Height;
  double v18;
  double v19;
  uint64_t v20;
  CGSize result;
  CGRect v22;
  CGRect v23;

  v9 = type metadata accessor for IndexPath(0, a2, a3);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  -[MenuBar frame](v15, "frame");
  v16 = CGRectGetWidth(v22)
      / *(double *)((char *)&v15->super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_47MenuBar_segmentWidthMultiplier);
  -[MenuBar frame](v15, "frame");
  Height = CGRectGetHeight(v23);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v18 = v16;
  v19 = Height;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

@end
