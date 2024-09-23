@implementation CHSWidgetRelevanceService.ConnectionClient

- (void)timelineEntryRelevanceDidChange:(id)a3
{
  uint64_t v4;
  void (*v5)(uint64_t);
  _TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient *v6;

  sub_18FB1F254(0, &qword_1EE18B400);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE18B678);
  sub_18FB8B558((unint64_t *)&unk_1EE18B680, &qword_1EE18B400, (uint64_t)off_1E2A568E8, MEMORY[0x1E0DEFCF8]);
  v4 = sub_18FBCD058();
  v5 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_timelineRelevanceDidChangeHandler);
  if (v5)
  {
    v6 = self;
    sub_18FB87340((uint64_t)v5);
    v5(v4);
    sub_18FB7C270((uint64_t)v5);

  }
  swift_bridgeObjectRelease();
}

- (void)handleWidgetRelevanceEvent:(id)a3
{
  void (*v3)(id);
  id v5;
  _TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient *v6;

  v3 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_widgetRelevanceEventHandler);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    sub_18FB87340((uint64_t)v3);
    v3(v5);
    sub_18FB7C270((uint64_t)v3);

  }
}

- (_TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_timelineRelevanceDidChangeHandler);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_widgetRelevanceEventHandler);
  v5 = (objc_class *)_s16ConnectionClientCMa_0();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[CHSWidgetRelevanceService.ConnectionClient init](&v7, sel_init);
}

- (void).cxx_destruct
{
  sub_18FB7C270(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_timelineRelevanceDidChangeHandler));
  sub_18FB7C270(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_widgetRelevanceEventHandler));
}

@end
