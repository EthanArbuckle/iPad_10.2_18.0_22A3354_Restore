@implementation HUCollectionLayoutManager

- (HUCollectionLayoutManager)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___HUCollectionLayoutManager_adaptiveTilesUsesPrefixes) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUCollectionLayoutManager_layoutOptions) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CollectionLayoutManager();
  return -[HUCollectionLayoutManager init](&v4, sel_init);
}

+ (UIListContentConfiguration)defaultProminentInsetGroupedHeader
{
  return (UIListContentConfiguration *)sub_1B8E4E334((uint64_t)a1, (uint64_t)a2, &qword_1EF207730, (id *)&qword_1EF2096C0);
}

- (id)buildAdaptiveTileSectionFor:(id)a3 layoutEnvironment:(id)a4
{
  unint64_t v6;
  uint64_t (*v7)(id);
  HUCollectionLayoutManager *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  v6 = sub_1B93EDF4C();
  v7 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x1A0);
  swift_unknownObjectRetain();
  v8 = self;
  v9 = (void *)v7(a4);
  v10 = (void *)sub_1B8E992B0(v6, a4);
  objc_msgSend(v9, sel_sectionTopMargin);
  v12 = v11;
  objc_msgSend(v9, sel_sectionLeadingMargin);
  v14 = v13;
  objc_msgSend(v9, sel_sectionBottomMargin);
  v16 = v15;
  objc_msgSend(v9, sel_sectionTrailingMargin);
  objc_msgSend(v10, sel_setContentInsets_, v12, v14, v16, v17);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v10;
}

+ (UIListContentConfiguration)defaultInsetGroupedFooter
{
  return (UIListContentConfiguration *)sub_1B8E4E334((uint64_t)a1, (uint64_t)a2, qword_1EF207738, (id *)&qword_1EF2096C8);
}

- (HUGridSize)gridSizeForItem:(id)a3
{
  id v4;
  HUCollectionLayoutManager *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  HUGridSize result;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8EA02B8(v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.columnsAcross = v10;
  result.rowsDown = v9;
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUCollectionLayoutManager_delegate);

}

@end
