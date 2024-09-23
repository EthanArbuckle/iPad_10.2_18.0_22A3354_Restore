@implementation RemoteExecutionService.ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate *v10;
  id v11;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_256D19C48);
  objc_msgSend(v9, sel_setExportedInterface_, v11);

  objc_msgSend(v9, sel_setExportedObject_, v10);
  objc_msgSend(v9, sel_resume);

  return 1;
}

- (void)remote_runWithWorkPlan:(id)a3 provider:(id)a4 executor:(id)a5 with:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  _TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate *v19;
  uint64_t v20[6];

  v8 = _Block_copy(a6);
  v9 = sub_23DF14E0C();
  v11 = v10;
  v12 = sub_23DF14E0C();
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v8;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_23DECFF14;
  *(_QWORD *)(v16 + 24) = v15;
  v17 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate_engine);
  v20[0] = v9;
  v20[1] = v11;
  v20[2] = v12;
  v20[3] = v14;
  v20[4] = 0;
  v20[5] = 0;
  v18 = a3;
  v19 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23DEE0110((uint64_t)v18, v20, v17, (void (*)(_QWORD))sub_23DECFF48, v16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_release();

}

- (_TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate)init
{
  _TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate *result;

  result = (_TtCC19HealthOrchestration22RemoteExecutionService15ServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
