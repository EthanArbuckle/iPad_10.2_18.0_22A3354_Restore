@implementation CycleChartsCollectionView

- (id)ax_cycles
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  _TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView *v6;
  uint64_t v7;
  id result;
  uint64_t v9;
  void *v10;
  _BYTE v11[16];

  sub_23198FA2C(0, (unint64_t *)&unk_255F52CD0, (void (*)(uint64_t))type metadata accessor for CycleChartsModel);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)&v11[-v4];
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = self;
  sub_231CA03E4();
  swift_release();
  swift_release();
  v7 = type metadata accessor for CycleChartsModel();
  result = (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v9 = *v5;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    sub_23191BD58((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CycleChartsModel);
    sub_231B942D8(v9);

    swift_bridgeObjectRelease();
    sub_231B96CF4(0, (unint64_t *)&qword_255F4BE58, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BEE0460]);
    v10 = (void *)sub_231CA1D94();
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

- (id)ax_predominantCycle
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  sub_23198FA2C(0, &qword_255F3F000, (void (*)(uint64_t))type metadata accessor for CycleChartCycle);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - v4;
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = self;
  sub_231CA03E4();
  swift_release();
  swift_release();
  v7 = type metadata accessor for CycleChartCycle(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) == 1)
  {
    sub_231996A70((uint64_t)v5, &qword_255F3F000, (void (*)(uint64_t))type metadata accessor for CycleChartCycle);
    sub_231B94880(MEMORY[0x24BEE4AF8]);
  }
  else
  {
    sub_231B95554();
    sub_23191BD58((uint64_t)v5, type metadata accessor for CycleChartCycle);
  }

  v8 = (void *)sub_231CA1A94();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)ax_cycleChartDayForIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_231C9D438();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v8 = self;
  CycleChartsCollectionView.ax_cycleChartDay(forIndexPath:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v9 = (void *)sub_231CA1A94();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView)initWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  _TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView *result;

  v4 = a3;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_231CA2A6C())
    v5 = (objc_class *)sub_2319096B8(MEMORY[0x24BEE4AF8]);
  else
    v5 = (objc_class *)MEMORY[0x24BEE4B08];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView_subscriptions) = v5;

  result = (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end
