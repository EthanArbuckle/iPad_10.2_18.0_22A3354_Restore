@implementation CycleFactorsHistoricalCollectionViewSource

- (void)dealloc
{
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource *v2;

  v2 = self;
  sub_2319FFEB4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource_providedHealthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource____lazy_storage___settingsManager));
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource____lazy_storage___shortMonthDayYearDateFormatter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource____lazy_storage___yearDateFormatter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource_factorObserverQuery));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_231A03AEC(a4);

  return v8;
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
  char *v14;
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource *v15;
  void *v16;
  uint64_t v18;

  v7 = sub_231C9D438();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  v13 = v12;
  sub_231C9D3E4();
  v14 = (char *)a3;
  v15 = self;
  v16 = (void *)sub_231A000B4(v14, v11, v13);

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
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_231A00C00(v10, (unint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource *v11;
  uint64_t v13;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_231A03DF0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource *v11;
  id v12;
  uint64_t v13;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = sub_231A02FBC((unint64_t)v9);
  if (MEMORY[0x2348EE70C]((char *)v11 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource_delegate))
  {
    sub_231A6B68C(v12);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource)init
{
  _TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource *result;

  result = (_TtC24MenstrualCyclesAppPlugin42CycleFactorsHistoricalCollectionViewSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
