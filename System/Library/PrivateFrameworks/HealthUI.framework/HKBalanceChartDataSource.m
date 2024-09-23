@implementation HKBalanceChartDataSource

- (HKBalanceChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  HKBalanceChartDataSource *v14;
  uint64_t v16;

  v6 = sub_1D7B49300();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)objc_opt_self();
  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v9, sel_hk_gregorianCalendarWithFirstWeekdayFromRegion);
  sub_1D7B492C4();

  v13 = objc_allocWithZone((Class)type metadata accessor for BalanceChartDataSource());
  v14 = (HKBalanceChartDataSource *)sub_1D7B2387C(v10, v11, (uint64_t)v8);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

- (id)queryDescription
{
  HKBalanceChartDataSource *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_1D7B4AA94();
  sub_1D7B4A41C();
  swift_bridgeObjectRetain();
  sub_1D7B4A41C();

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1D7B4A38C();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)queryCalendar
{
  return (id)sub_1D7B492AC();
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 0;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  HKBalanceChartDataSource *v9;
  void *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1D7B23F04(v8, (uint64_t)sub_1D7AF1C34, v7);

  swift_release();
  sub_1D7AAF6EC(0, (unint64_t *)&unk_1F01493A0);
  v10 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)mappingFunctionForContext:(id)a3
{
  HKBalanceChartDataSource *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D7B4A770();
  swift_unknownObjectRelease();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  v8[4] = sub_1D7B264FC;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1D7B23548;
  v8[3] = &block_descriptor_12;
  v6 = _Block_copy(v8);
  swift_release();
  return v6;
}

- (HKBalanceChartDataSource)init
{
  HKBalanceChartDataSource *result;

  result = (HKBalanceChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___HKBalanceChartDataSource_gregorianCalendar;
  v4 = sub_1D7B49300();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___HKBalanceChartDataSource_gregorianUTCCalendar, v4);
}

@end
