@implementation ServerClient

+ (_TtC14AudioAnalytics12ServerClient)shared
{
  if (qword_253F3D9E0 != -1)
    swift_once();
  return (_TtC14AudioAnalytics12ServerClient *)(id)qword_253F3DC50;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_253F3D9E0;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  v5 = (void *)qword_253F3DC50;
  qword_253F3DC50 = (uint64_t)v4;

}

- (_TtC14AudioAnalytics12ServerClient)initWithEndpoint:(id)a3 injectedServerProtocol:(id)a4
{
  id v6;

  v6 = a3;
  swift_unknownObjectRetain();
  return (_TtC14AudioAnalytics12ServerClient *)sub_21DBC1EA8(a3, (uint64_t)a4);
}

+ (void)createSharedClientWithEndpoint:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  char *v7;
  id v8;

  v3 = qword_253F3D9E0;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  v5 = objc_allocWithZone((Class)type metadata accessor for ServerClient(0));
  v6 = v4;
  v7 = sub_21DBC1EA8(v4, 0);
  v8 = (id)qword_253F3DC50;
  qword_253F3DC50 = (uint64_t)v7;

}

- (int64_t)createReportingSession
{
  _TtC14AudioAnalytics12ServerClient *v2;
  int64_t v4;

  v2 = self;
  sub_21DBD247C();

  return v4;
}

- (int64_t)createReportingSessionFromSessionID:(unsigned int)a3
{
  _TtC14AudioAnalytics12ServerClient *v3;
  int64_t v5;

  v3 = self;
  sub_21DBD247C();

  return v5;
}

- (void)startWithReporterID:(int64_t)a3
{
  _TtC14AudioAnalytics12ServerClient *v4;

  v4 = self;
  sub_21DBC378C(a3);

}

- (void)stopWithReporterID:(int64_t)a3
{
  _TtC14AudioAnalytics12ServerClient *v4;

  v4 = self;
  sub_21DBC391C(a3);

}

- (unsigned)getServiceTypeForReporterID:(int64_t)a3
{
  _TtC14AudioAnalytics12ServerClient *v4;
  unsigned __int16 v6;

  type metadata accessor for AudioServiceType(0);
  v4 = self;
  sub_21DBD247C();

  return v6;
}

- (void)setServiceType:(unsigned __int16)a3 reporterID:(int64_t)a4
{
  _TtC14AudioAnalytics12ServerClient *v6;

  v6 = self;
  sub_21DBC3DB4(a3, a4);

}

- (id)getConfigurationForReporterID:(int64_t)a3
{
  _TtC14AudioAnalytics12ServerClient *v3;
  void *v4;

  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4300);
  sub_21DBD247C();

  v4 = (void *)sub_21DBD238C();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)setConfiguration:(id)a3 reporterID:(int64_t)a4
{
  uint64_t v6;
  _TtC14AudioAnalytics12ServerClient *v7;

  v6 = sub_21DBD23A4();
  v7 = self;
  sub_21DBC4364(v6, a4);

  swift_bridgeObjectRelease();
}

- (void)sendMessageForReporterID:(int64_t)a3 message:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6
{
  uint64_t v10;
  _TtC14AudioAnalytics12ServerClient *v11;

  v10 = sub_21DBD23A4();
  v11 = self;
  sub_21DBC4540(a3, v10, a5, a6);

  swift_bridgeObjectRelease();
}

- (void)sendSingleMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v8;
  _TtC14AudioAnalytics12ServerClient *v9;

  v8 = sub_21DBD23A4();
  v9 = self;
  sub_21DBC474C(v8, a4, a5);

  swift_bridgeObjectRelease();
}

- (void)destroyReporterID:(int64_t)a3
{
  _TtC14AudioAnalytics12ServerClient *v4;

  v4 = self;
  sub_21DBC494C(a3);

}

- (void)requestMessageForReporterID:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 callback:(id)a6
{
  void *v10;
  uint64_t v11;
  _TtC14AudioAnalytics12ServerClient *v12;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  sub_21DBC4ADC(a3, a4, a5, (uint64_t)sub_21DBB6B2C, v11);

  swift_release();
}

- (_TtC14AudioAnalytics12ServerClient)init
{
  _TtC14AudioAnalytics12ServerClient *result;

  result = (_TtC14AudioAnalytics12ServerClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_logger;
  v4 = sub_21DBD2320();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
