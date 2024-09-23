@implementation CycleFactorsDaySummaryCollectionViewSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_rows))[2];
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
  id v14;
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource *v15;
  void *v16;
  uint64_t v18;

  v7 = sub_231C9D438();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  v13 = v12;
  sub_231C9D3E4();
  v14 = a3;
  v15 = self;
  v16 = (void *)sub_231956534(v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231956B24((uint64_t)v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_2319577AC((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource)init
{
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource *result;

  result = (_TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_providedHealthStore));
  sub_23191BD58((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_cycleDay, (uint64_t (*)(_QWORD))type metadata accessor for CycleDay);
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource____lazy_storage___shortMonthDayYearDateFormatter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource____lazy_storage___yearDateFormatter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_gregorianCalenadar;
  v4 = sub_231C9D36C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
