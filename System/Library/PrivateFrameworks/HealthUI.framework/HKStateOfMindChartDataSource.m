@implementation HKStateOfMindChartDataSource

- (HKStateOfMindChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4 overlayPredicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  HKStateOfMindChartDataSource *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (HKStateOfMindChartDataSource *)sub_1D7AF1104((uint64_t)v7, (uint64_t)v8, a5);

  return v10;
}

- (id)queryDescription
{
  HKStateOfMindChartDataSource *v3;
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

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  HKStateOfMindChartDataSource *v9;
  void *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1D7AEE5E0(v8, (uint64_t)sub_1D7AF1C34, v7);

  swift_release();
  sub_1D7AAF6EC(0, (unint64_t *)&unk_1F01493A0);
  v10 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)mappingFunctionForContext:(id)a3
{
  HKStateOfMindChartDataSource *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D7B4A770();
  swift_unknownObjectRelease();
  if (-[HKStateOfMindChartDataSource supportsChartQueryDataGeneration](v4, sel_supportsChartQueryDataGeneration))
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
    return 0;
  }
  else
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
    v8[4] = sub_1D7AF1C3C;
    v8[5] = v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 1107296256;
    v8[2] = sub_1D7B23548;
    v8[3] = &block_descriptor_25;
    v7 = _Block_copy(v8);
    swift_release();
    return v7;
  }
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 1;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  HKStateOfMindChartDataSource *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[6];

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = sub_1D7AEEE44(v10, v11, sub_1D7AF1C2C, v9);
  v15 = v14;

  swift_release();
  if (v13)
  {
    v17[4] = v13;
    v17[5] = v15;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 1107296256;
    v17[2] = sub_1D7AEFEF0;
    v17[3] = &block_descriptor_18;
    v13 = _Block_copy(v17);
    swift_release();
  }
  return v13;
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v6;
  HKStateOfMindChartDataSource *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1D7AEFF1C(v6, a4);

  return v8;
}

- (HKStateOfMindChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  id v5;
  id v6;
  HKStateOfMindChartDataSource *result;

  v5 = a3;
  v6 = a4;
  result = (HKStateOfMindChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HKStateOfMindChartDataSource)init
{
  HKStateOfMindChartDataSource *result;

  result = (HKStateOfMindChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___HKStateOfMindChartDataSource_gregorianCalendar;
  v4 = sub_1D7B49300();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
