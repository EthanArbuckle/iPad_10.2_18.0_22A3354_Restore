@implementation HDMCPregnancyStateQueryServer

- (NSSet)objectTypes
{
  unint64_t inited;
  void *v4;
  _TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  sub_219654F34(0, (unint64_t *)&qword_253E60CE0, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2196856B0;
  sub_219654DFC(0, &qword_253E60C38);
  v4 = (void *)*MEMORY[0x24BDD29D8];
  v5 = self;
  *(_QWORD *)(inited + 32) = MEMORY[0x219A30B58](v4);
  sub_219681AF0();
  v6 = inited;
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_219681DE4();
    swift_bridgeObjectRelease();
    if (!v7)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (*(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10))
LABEL_3:
    sub_219654520(v6);
LABEL_5:
  swift_bridgeObjectRelease();

  sub_219654DFC(0, (unint64_t *)&unk_253E60C20);
  sub_219654E34();
  v8 = (void *)sub_219681B38();
  swift_bridgeObjectRelease();
  return (NSSet *)v8;
}

- (_TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  _TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer *result;

  sub_2196815BC();
  MEMORY[0x24BDAC7A8]();
  sub_2196815A4();
  result = (_TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer *)sub_219681DD8();
  __break(1u);
  return result;
}

+ (Class)queryClass
{
  sub_219654DFC(0, (unint64_t *)&unk_253E60C70);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_queue_start
{
  _TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer *v2;

  v2 = self;
  HDMCPregnancyStateQueryServer._queue_start()();

}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  sub_219654A7C(v7);

  return 1;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;

  v9 = sub_2196815BC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2196815A4();
  swift_getObjCClassMetadata();
  v13 = a4;
  v14 = a5;
  swift_unknownObjectRetain();
  v15 = static HDMCPregnancyStateQueryServer.createTaskServer(with:configuration:client:delegate:)((uint64_t)v12, a4, v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_unknownObjectRelease();

  return v15;
}

- (void)_queue_stop
{
  uint64_t v2;
  void *v3;
  _TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager);
  v3 = *(void **)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers);
  v4 = self;
  objc_msgSend(v3, sel_unregisterObserver_, v4);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_unregisterObserver_, v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_profileExtension));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager));
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v4;
  _TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer *v5;

  v4 = a3;
  v5 = self;
  HDMCPregnancyStateQueryServer.pregnancyModelDidUpdate(_:)((uint64_t)v4);

}

@end
