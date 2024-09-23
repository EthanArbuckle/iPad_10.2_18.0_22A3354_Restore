@implementation JEMediaActivity

- (int64_t)type
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___JEMediaActivity_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___JEMediaActivity_type);
  swift_beginAccess();
  *v4 = a3;
}

- (JEMediaPlaylistItem)playlistItem
{
  swift_beginAccess();
  return (JEMediaPlaylistItem *)(id)swift_unknownObjectRetain();
}

- (void)setPlaylistItem:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___JEMediaActivity_playlistItem);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)isStopped
{
  return (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR___JEMediaActivity_pipelineHandler))[216];
}

- (JEMediaActivity)initWithType:(int64_t)a3 playlistItem:(id)a4 pipeline:(id)a5 topic:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = sub_19CFDF578();
  v12 = v11;
  swift_getObjectType();
  swift_unknownObjectRetain();
  return (JEMediaActivity *)sub_19CEE2FC8(a3, (uint64_t)a4, a5, v10, v12, (char *)self);
}

- (unint64_t)positionWithOverallPosition:(unint64_t)a3
{
  JEMediaActivity *v4;
  char *v5;

  v4 = self;
  v5 = sub_19CEE15E4(a3);

  return (unint64_t)v5;
}

- (void)startedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6 transitioningEventData:(id)a7
{
  sub_19CEE1E54(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))sub_19CEE19A0);
}

- (void)stoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6 transitioningEventData:(id)a7
{
  sub_19CEE1E54(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))sub_19CEE19F0);
}

- (id)eventDataForTransitioningEvents
{
  void *v2;
  JEMediaActivity *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[4];

  v2 = (void *)(*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___JEMediaActivity_pipelineHandler))[28];
  if (v2)
  {
    v3 = self;
    swift_retain();
    v4 = sub_19CEE2E94((uint64_t)sub_19CEE1FF8, 0);
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE436FA8);
    v13[3] = v5;
    swift_release();
    v13[0] = v4;

    if (v5)
    {
      v6 = __swift_project_boxed_opaque_existential_1(v13, v5);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = MEMORY[0x1E0C80A78](v6, v6);
      v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v7 + 16))(v10, v8);
      v11 = (void *)sub_19CFE0688();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
      return v11;
    }
    v2 = 0;
  }
  return v2;
}

- (id)startMetricsFields
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19CFDF3B0();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)stopMetricsFields
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19CFDF3B0();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)postProcessedStartMetricsFieldsWithCompletion:(id)a3
{
  sub_19CEE25C4(self, (int)a2, a3, (void (*)(void))sub_19CEE3528);
}

- (void)postProcessedStopMetricsFieldsWithCompletion:(id)a3
{
  sub_19CEE25C4(self, (int)a2, a3, (void (*)(void))sub_19CEE3900);
}

- (JEMediaActivity)init
{
  JEMediaActivity *result;

  result = (JEMediaActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end
