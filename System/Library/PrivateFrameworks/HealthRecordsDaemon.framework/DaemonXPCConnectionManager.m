@implementation DaemonXPCConnectionManager

- (void)dealloc
{
  _TtC19HealthRecordsDaemon26DaemonXPCConnectionManager *v2;
  objc_super v3;

  v2 = self;
  sub_21FC59350();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DaemonXPCConnectionManager();
  -[DaemonXPCConnectionManager dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon26DaemonXPCConnectionManager_listener));
  swift_bridgeObjectRelease();
}

- (_TtC19HealthRecordsDaemon26DaemonXPCConnectionManager)init
{
  _TtC19HealthRecordsDaemon26DaemonXPCConnectionManager *result;

  result = (_TtC19HealthRecordsDaemon26DaemonXPCConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  uint64_t *v8;
  uint64_t v9;
  objc_class *v10;
  char *v11;
  id v12;
  id v13;
  _TtC19HealthRecordsDaemon26DaemonXPCConnectionManager *v14;
  _TtC19HealthRecordsDaemon26DaemonXPCConnectionManager *v15;
  objc_super v17;

  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HealthRecordsDaemon26DaemonXPCConnectionManager_serviceMap);
  swift_beginAccess();
  v9 = *v8;
  v10 = (objc_class *)type metadata accessor for DaemonConnectionServer();
  v11 = (char *)objc_allocWithZone(v10);
  *(_QWORD *)&v11[OBJC_IVAR____TtC19HealthRecordsDaemon22DaemonConnectionServer_client] = a4;
  *(_QWORD *)&v11[OBJC_IVAR____TtC19HealthRecordsDaemon22DaemonConnectionServer_serviceMap] = v9;
  v17.receiver = v11;
  v17.super_class = v10;
  v12 = a4;
  v13 = a3;
  v14 = self;
  swift_bridgeObjectRetain();
  v15 = -[DaemonXPCConnectionManager init](&v17, sel_init);

  return v15;
}

@end
