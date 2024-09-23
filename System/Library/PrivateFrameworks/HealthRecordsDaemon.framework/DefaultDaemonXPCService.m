@implementation DefaultDaemonXPCService

- (_TtC19HealthRecordsDaemon23DefaultDaemonXPCService)init
{
  _TtC19HealthRecordsDaemon23DefaultDaemonXPCService *result;

  result = (_TtC19HealthRecordsDaemon23DefaultDaemonXPCService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  uint64_t (*v7)(id);
  id v8;
  id v9;
  _TtC19HealthRecordsDaemon23DefaultDaemonXPCService *v10;
  void *v11;

  v7 = *(uint64_t (**)(id))((char *)&self->super.isa
                                    + OBJC_IVAR____TtC19HealthRecordsDaemon23DefaultDaemonXPCService_serverGenerator);
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = (void *)v7(v9);

  return v11;
}

@end
