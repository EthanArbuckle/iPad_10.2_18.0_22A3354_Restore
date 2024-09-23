@implementation GuidedSearchTokenPaletteView

- (_TtC20ProductPageExtension28GuidedSearchTokenPaletteView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension28GuidedSearchTokenPaletteView *result;

  sub_1001FEA2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC20ProductPageExtension28GuidedSearchTokenPaletteView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100203474();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension28GuidedSearchTokenPaletteView *v2;

  v2 = self;
  sub_1001FF534();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _TtC20ProductPageExtension28GuidedSearchTokenPaletteView *v4;
  id v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[GuidedSearchTokenPaletteView traitCollection](v4, "traitCollection");

  v6 = 50.0;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_onSelect), *(_QWORD *)&self->onSelect[OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_onSelect]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_tokens));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_maskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_leadingGradientMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_trailingGradientMask));
  swift_release();
  swift_release();
  swift_release();
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_containerImpressionMetrics, &qword_1008131E0);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  id v13;
  _TtC20ProductPageExtension28GuidedSearchTokenPaletteView *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_onSelect);
  if (v11)
  {
    v12 = *(_QWORD *)&self->onSelect[OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_onSelect];
    v13 = a3;
    v14 = self;
    v15 = sub_100018918((uint64_t)v11, v12);
    v16 = IndexPath.row.getter(v15);
    v11(v16);
    sub_100018908((uint64_t)v11, v12);

  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28GuidedSearchTokenPaletteView_tokens))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC20ProductPageExtension28GuidedSearchTokenPaletteView *v12;
  _BYTE *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100200654(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC20ProductPageExtension28GuidedSearchTokenPaletteView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_100203584(v13, (uint64_t)v12);
  v18 = v17;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7;
  id v8;
  id v9;
  _TtC20ProductPageExtension28GuidedSearchTokenPaletteView *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  _QWORD v17[4];
  UIEdgeInsets result;

  v7 = qword_100804E48;
  v8 = a3;
  v9 = a4;
  v10 = self;
  if (v7 != -1)
    swift_once(&qword_100804E48, sub_100201530);
  v11 = sub_10000DAF8((uint64_t *)&unk_1008143D0);
  sub_10000EFC4(v11, (uint64_t)qword_1008156C0);
  v16 = v8;
  Conditional.evaluate(with:)(v17, &v16, v11);

  v12 = *(double *)v17;
  v13 = *(double *)&v17[1];
  v14 = *(double *)&v17[2];
  v15 = *(double *)&v17[3];
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC20ProductPageExtension28GuidedSearchTokenPaletteView *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1002036E4(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC20ProductPageExtension28GuidedSearchTokenPaletteView *v5;

  v4 = a3;
  v5 = self;
  sub_100200C64(v4);

}

@end
