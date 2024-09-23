@implementation VerifiableHealthRecordsParsingServiceServer

- (_TtC19HealthRecordsDaemon43VerifiableHealthRecordsParsingServiceServer)init
{
  _TtC19HealthRecordsDaemon43VerifiableHealthRecordsParsingServiceServer *result;

  result = (_TtC19HealthRecordsDaemon43VerifiableHealthRecordsParsingServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon43VerifiableHealthRecordsParsingServiceServer_client));
}

- (void)remote_parseDataSource:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC19HealthRecordsDaemon43VerifiableHealthRecordsParsingServiceServer *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  sub_21FAD8564(v10, a4, (uint64_t)sub_21FAD9020, v9);

  swift_release();
}

- (id)exportedInterface
{
  return (id)HKVerifiableHealthRecordsParsingServiceInterface();
}

- (id)remoteInterface
{
  return 0;
}

@end
