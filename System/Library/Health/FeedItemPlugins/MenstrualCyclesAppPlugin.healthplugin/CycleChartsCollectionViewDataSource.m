@implementation CycleChartsCollectionViewDataSource

- (_TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource)init
{
  _TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource *result;

  result = (_TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource_cycles))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_231B10F84(a4);
  v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(id, char *, char *);
  id v14;
  _TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;

  v19 = sub_231CA1A58();
  v6 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_231C9D438();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v13 = *(uint64_t (**)(id, char *, char *))((char *)&self->super.isa
                                                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource_cellProvider);
  v14 = a3;
  v15 = self;
  sub_231B10AA8();
  v16 = (void *)v13(v14, v12, v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(id, uint64_t, uint64_t, char *);
  id v15;
  _TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource *v16;
  void *v17;
  uint64_t v19;

  v7 = sub_231C9D438();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  v13 = v12;
  sub_231C9D3E4();
  v14 = *(uint64_t (**)(id, uint64_t, uint64_t, char *))((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource_supplementaryViewProvider);
  v15 = a3;
  v16 = self;
  v17 = (void *)v14(v15, v11, v13, v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v17;
}

@end
