@implementation CalendarViewDataSource

- (_TtC8HealthUI22CalendarViewDataSource)init
{
  _TtC8HealthUI22CalendarViewDataSource *result;

  result = (_TtC8HealthUI22CalendarViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);

  sub_1D7AC82E4((uint64_t)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_cellProvider);
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_calendar;
  v4 = sub_1D7B49300();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_startDate;
  v6 = sub_1D7B49198();
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = (char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_startComponents;
  v9 = sub_1D7B48DE4();
  v10 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v7((char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_endDate, v6);
  v10((char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_endComponents, v9);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC8HealthUI22CalendarViewDataSource *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = _s8HealthUI22CalendarViewDataSourceC16numberOfSections2inSiSo012UICollectionD0C_tF_0();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8HealthUI22CalendarViewDataSource *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t result;
  uint64_t v16;

  v7 = sub_1D7B49198();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  v12 = self;
  CalendarViewDataSource.startDate(forSection:)(a4, (uint64_t)v10);
  v13 = sub_1D7AE55E0((uint64_t)v10);
  v14 = sub_1D7B4927C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  result = v13 + v14;
  if (__OFADD__(v13, v14))
    __break(1u);
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8HealthUI22CalendarViewDataSource *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1D7B49474();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7B49438();
  v10 = a3;
  v11 = self;
  v12 = (void *)CalendarViewDataSource.collectionView(_:cellForItemAt:)((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
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
  _TtC8HealthUI22CalendarViewDataSource *v15;
  void *v16;
  uint64_t v18;

  v7 = sub_1D7B49474();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1D7B4A3BC();
  v13 = v12;
  sub_1D7B49438();
  v14 = a3;
  v15 = self;
  v16 = (void *)CalendarViewDataSource.collectionView(_:viewForSupplementaryElementOfKind:at:)((uint64_t)v14, v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

@end
