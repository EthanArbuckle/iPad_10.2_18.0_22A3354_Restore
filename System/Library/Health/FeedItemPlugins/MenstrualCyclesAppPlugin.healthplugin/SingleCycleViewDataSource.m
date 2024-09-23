@implementation SingleCycleViewDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  id v16;
  _TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  int64_t v21;
  uint64_t v23;

  sub_231949D5C();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - v10;
  sub_231953824();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_today;
  v16 = a3;
  v17 = self;
  sub_231A696C0(v15, (uint64_t)v14);
  v18 = sub_231CA1A58();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v11, v14, v18);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  v20(v11, 0, 1, v18);
  v20(v8, 1, 1, v18);
  v21 = sub_231A8EB80((uint64_t)v11, (uint64_t)v8);
  sub_23191BD58((uint64_t)v8, (uint64_t (*)(_QWORD))sub_231949D5C);
  sub_23191BD58((uint64_t)v11, (uint64_t (*)(_QWORD))sub_231949D5C);
  sub_23191BD58((uint64_t)v14, (uint64_t (*)(_QWORD))sub_231953824);

  return v21;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_231CA1BD8();
  v13 = (void *)sub_231C9D3CC();
  v14 = objc_msgSend(v10, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v12, v13);

  type metadata accessor for CycleHistoryCycleDayCell();
  v15 = (void *)swift_dynamicCastClassUnconditional();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

- (_TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource)init
{
  _TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource *result;

  result = (_TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_cycle));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_cycleViewModelProvider));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_today;
  v4 = sub_231CA1A58();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
