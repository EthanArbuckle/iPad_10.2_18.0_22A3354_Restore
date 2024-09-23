@implementation StatisticsCollectionCalculatorDateIntervalFilterDataSource

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource *v22;
  _BYTE v24[16];

  sub_23DC81D20(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v24[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = _Block_copy(a6);
  v16 = _Block_copy(a7);
  if (a4)
  {
    sub_23DCE10B8();
    v17 = sub_23DCE1100();
    v18 = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 0, 1, v17);
  }
  else
  {
    v19 = sub_23DCE1100();
    v18 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v14, 1, 1, v19);
  }
  v20 = MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)&v24[-16] = v15;
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)&v24[-16] = v16;
  v21 = a3;
  v22 = self;
  sub_23DCA54C0((uint64_t)v21, (uint64_t)v14, (uint64_t)sub_23DCA5B88, (uint64_t)&v24[-32], (uint64_t)sub_23DCA5BB4, (uint64_t)&v24[-32]);
  sub_23DC94AE0((uint64_t)v14);

  _Block_release(v16);
  _Block_release(v15);
  return 1;
}

- (_TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource)init
{
  _TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource *result;

  result = (_TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource_includedDateIntervals));
  swift_unknownObjectRelease();
  sub_23DC97390(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource_unitTest_excludedSampleHandler));
}

@end
