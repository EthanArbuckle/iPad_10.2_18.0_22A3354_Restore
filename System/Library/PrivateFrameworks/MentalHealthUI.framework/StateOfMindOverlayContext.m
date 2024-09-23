@implementation StateOfMindOverlayContext

- (id)sampleTypeForDateRangeUpdates
{
  sub_241762EFC(0, &qword_25714F2A0);
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_stateOfMindType);
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_overlayDisplayType));
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _TtC14MentalHealthUI25StateOfMindOverlayContext *v19;
  uint64_t v20;

  v11 = sub_2418A7DA0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  sub_2418A7D7C();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  v18 = a4;
  v19 = self;
  sub_2417B07FC((uint64_t)v15, a5, (void (*)(_QWORD, _QWORD))sub_2417B0D30, v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
}

- (id)contextItemForLastUpdate
{
  void *v3;
  _TtC14MentalHealthUI25StateOfMindOverlayContext *v4;
  void *v5;
  uint64_t (*v6)(_QWORD);
  _TtC14MentalHealthUI25StateOfMindOverlayContext *v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_currentContextItem);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v6 = *(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xC0);
    v7 = self;
    v5 = (void *)v6(MEMORY[0x24BEE4AF8]);
    v3 = 0;
  }
  v8 = v3;

  return v5;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (_TtC14MentalHealthUI25StateOfMindOverlayContext)init
{
  _TtC14MentalHealthUI25StateOfMindOverlayContext *result;

  result = (_TtC14MentalHealthUI25StateOfMindOverlayContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_overlayChartController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_overlayDisplayType));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_overlayPredicate));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_currentContextItem));
}

@end
