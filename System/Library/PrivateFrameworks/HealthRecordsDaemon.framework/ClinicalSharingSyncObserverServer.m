@implementation ClinicalSharingSyncObserverServer

- (void)dealloc
{
  uint64_t v3;
  _TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer *v4;
  objc_super v5;
  uint64_t v6;

  v3 = OBJC_IVAR____TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer_lock;
  v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer_lock);
  sub_21FA2D1A0(0, &qword_25406BAE0, (uint64_t (*)(uint64_t))type metadata accessor for os_unfair_lock_s, MEMORY[0x24BEE1C28]);
  sub_21FAA6830();
  v4 = self;
  sub_21FC5ACBC();
  MEMORY[0x2207D105C](*(Class *)((char *)&self->super.isa + v3), -1, -1);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for ClinicalSharingSyncObserverServer();
  -[ClinicalSharingSyncObserverServer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer_client));
  swift_release();
  swift_release();
}

- (_TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer)init
{
  _TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer *result;

  result = (_TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)remote_startObservingSyncStatusWithCompletion:(id)a3
{
  void (**v4)(void *, uint64_t, _QWORD);
  _TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer *v5;

  v4 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(a3);
  v5 = self;
  sub_21FAEAAB4();
  v4[2](v4, 1, 0);
  _Block_release(v4);

}

- (id)exportedInterface
{
  return (id)HKClinicalSharingSyncObserverServerInterface();
}

- (id)remoteInterface
{
  return (id)HKClinicalSharingSyncObserverClientInterface();
}

- (void)connectionInvalidated
{
  _TtC19HealthRecordsDaemon33ClinicalSharingSyncObserverServer *v3;

  sub_21FA2D1A0(0, &qword_25406BAE0, (uint64_t (*)(uint64_t))type metadata accessor for os_unfair_lock_s, MEMORY[0x24BEE1C28]);
  sub_21FAA6830();
  v3 = self;
  sub_21FC5ACBC();

}

@end
