@implementation DaemonConnectionServer

- (_TtC19HealthRecordsDaemon22DaemonConnectionServer)init
{
  _TtC19HealthRecordsDaemon22DaemonConnectionServer *result;

  result = (_TtC19HealthRecordsDaemon22DaemonConnectionServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

- (void)remote_fetchEndpointForServiceIdentifier:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC19HealthRecordsDaemon22DaemonConnectionServer *v9;

  v5 = _Block_copy(a4);
  v6 = sub_21FC5B604();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_21FC59BA0(v6, v8, (char *)v9, v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (id)exportedInterface
{
  return (id)HKHealthRecordsDaemonConnectionServerInterface();
}

- (id)remoteInterface
{
  return 0;
}

@end
