@implementation BalanceOverlayContext

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUI21BalanceOverlayContext_overlayDisplayType));
}

- (void)updateContextItemForDateInterval:(NSDateInterval *)a3 overlayController:(HKInteractiveChartOverlayViewController *)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSDateInterval *v21;
  HKInteractiveChartOverlayViewController *v22;
  _TtC8HealthUI21BalanceOverlayContext *v23;
  uint64_t v24;

  sub_1D7AAE0AC(0, &qword_1F014DEC0, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - v14;
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  v18 = sub_1D7B4A530();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1F014DED0;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1F014DEE0;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = self;
  sub_1D7ACA364((uint64_t)v15, (uint64_t)&unk_1F014DEF0, (uint64_t)v20);
  swift_release();
}

- (id)contextItemForLastUpdate
{
  void *v3;
  _TtC8HealthUI21BalanceOverlayContext *v4;
  void *v5;
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t);
  _TtC8HealthUI21BalanceOverlayContext *v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI21BalanceOverlayContext_currentContextItem);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v6 = *(uint64_t (**)(_QWORD, _QWORD, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0xB8);
    v7 = self;
    v5 = (void *)v6(MEMORY[0x1E0DEE9D8], 0, 1);
    v3 = 0;
  }
  v8 = v3;

  return v5;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (_TtC8HealthUI21BalanceOverlayContext)init
{
  _TtC8HealthUI21BalanceOverlayContext *result;

  result = (_TtC8HealthUI21BalanceOverlayContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
