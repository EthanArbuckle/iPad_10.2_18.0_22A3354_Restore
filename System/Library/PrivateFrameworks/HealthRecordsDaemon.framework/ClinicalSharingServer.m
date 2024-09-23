@implementation ClinicalSharingServer

- (_TtC19HealthRecordsDaemon21ClinicalSharingServer)init
{
  _TtC19HealthRecordsDaemon21ClinicalSharingServer *result;

  result = (_TtC19HealthRecordsDaemon21ClinicalSharingServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19HealthRecordsDaemon21ClinicalSharingServer_contextProvider);

  swift_bridgeObjectRelease();
}

- (void)remote_shareHealthDataWithOptions:(unint64_t)a3 reason:(int64_t)a4 date:(id)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC19HealthRecordsDaemon21ClinicalSharingServer *v17;
  uint64_t v18;

  sub_21FA2D1A0(0, (unint64_t *)&qword_25406AAE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - v12;
  v14 = _Block_copy(a6);
  if (a5)
  {
    sub_21FC5AA94();
    v15 = sub_21FC5AAAC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 0, 1, v15);
  }
  else
  {
    v16 = sub_21FC5AAAC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  }
  _Block_copy(v14);
  v17 = self;
  sub_21FAE8FBC(a3, a4, (uint64_t)v13, v17, v14);
  _Block_release(v14);
  _Block_release(v14);

  sub_21FA2D1F8((uint64_t)v13, (unint64_t *)&qword_25406AAE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
}

- (void)remote_scheduleSharingHealthDataWithReason:(int64_t)a3 completion:(id)a4
{
  void *v6;
  _TtC19HealthRecordsDaemon21ClinicalSharingServer *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_21FAE9578(a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)remote_gatherQueryDiagnosticsWithOptions:(unint64_t)a3 date:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _TtC19HealthRecordsDaemon21ClinicalSharingServer *v13;
  uint64_t v14;

  v8 = sub_21FC5AAAC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_21FC5AA94();
  _Block_copy(v12);
  v13 = self;
  sub_21FAE9958(a3, (uint64_t)v11, (char *)v13, (void (**)(_QWORD, _QWORD, _QWORD))v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)remote_submitDailyAnalyticsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC19HealthRecordsDaemon21ClinicalSharingServer *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_21FAE7F80((uint64_t)sub_21FAE9EF4, v5);

  swift_release();
}

- (void)remote_submitOnboardingAnalyticsForStepIdentifier:(id)a3 context:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _TtC19HealthRecordsDaemon21ClinicalSharingServer *v14;

  v6 = _Block_copy(a5);
  v7 = sub_21FC5B604();
  v9 = v8;
  v10 = sub_21FC5B604();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v6;
  v14 = self;
  sub_21FAE84F4(v7, v9, v10, v12, (uint64_t)sub_21FAE8E90, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (id)exportedInterface
{
  return (id)HKClinicalSharingServerInterface();
}

- (id)remoteInterface
{
  return 0;
}

@end
