@implementation AudioAnalyticsReporter

- (AudioAnalyticsReporter)initWithNewReporterID
{
  return (AudioAnalyticsReporter *)AudioAnalyticsReporter.init(newReporterID:)();
}

- (AudioAnalyticsReporter)initWithReporterID:(int64_t)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioAnalyticsReporter_reporterID) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)AudioAnalyticsReporter;
  return -[AudioAnalyticsReporter init](&v4, sel_init);
}

- (AudioAnalyticsReporter)initWithSessionID:(unsigned int)a3 serviceType:(unsigned __int16)a4
{
  return (AudioAnalyticsReporter *)AudioAnalyticsReporter.init(sessionID:serviceType:)(*(uint64_t *)&a3, a4);
}

- (void)dealloc
{
  AudioAnalyticsReporter *v2;

  v2 = self;
  sub_21DBB4520();
}

- (int64_t)reporterID
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___AudioAnalyticsReporter_reporterID);
  swift_beginAccess();
  return *v2;
}

- (void)setReporterID:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___AudioAnalyticsReporter_reporterID);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)serviceType
{
  uint64_t v2;
  AudioAnalyticsReporter *v3;
  id v4;
  int64_t v5;
  uint64_t v6;
  unsigned __int16 v8;

  v2 = qword_253F3D9E0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (id)qword_253F3DC50;
  v5 = -[AudioAnalyticsReporter reporterID](v3, sel_reporterID);
  MEMORY[0x24BDAC7A8](v5, v6);
  type metadata accessor for AudioServiceType(0);
  sub_21DBD247C();

  return v8;
}

- (NSDictionary)configuration
{
  uint64_t v2;
  AudioAnalyticsReporter *v3;
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;

  v2 = qword_253F3D9E0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (id)qword_253F3DC50;
  v5 = -[AudioAnalyticsReporter reporterID](v3, sel_reporterID);
  MEMORY[0x24BDAC7A8](v5, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4300);
  sub_21DBD247C();

  v7 = (void *)sub_21DBD238C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v7;
}

- (void)setConfiguration:(id)a3
{
  uint64_t v4;
  AudioAnalyticsReporter *v5;

  v4 = sub_21DBD23A4();
  v5 = self;
  AudioAnalyticsReporter.configuration.setter(v4);

}

- (AudioAnalyticsReporter)init
{
  AudioAnalyticsReporter *result;

  result = (AudioAnalyticsReporter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)setServiceType:(unsigned __int16)a3
{
  AudioAnalyticsReporter *v4;

  v4 = self;
  AudioAnalyticsReporter.set(serviceType:)(a3);

}

- (void)start
{
  AudioAnalyticsReporter *v2;

  v2 = self;
  AudioAnalyticsReporter.start()();

}

- (void)stop
{
  AudioAnalyticsReporter *v2;

  v2 = self;
  AudioAnalyticsReporter.stop()();

}

- (void)sendMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v8;
  AudioAnalyticsReporter *v9;

  v8 = sub_21DBD23A4();
  v9 = self;
  AudioAnalyticsReporter.sendMessage(_:category:type:)(v8, a4, a5);

  swift_bridgeObjectRelease();
}

+ (void)sendSessionlessMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v7;

  v7 = sub_21DBD23A4();
  _sSo22AudioAnalyticsReporterC0aB0E22sendSessionlessMessage_8category4typeySDys11AnyHashableVypG_So0A13EventCategoryVSo0aK4TypeVtFZ_0(v7, a4, a5);
  swift_bridgeObjectRelease();
}

- (void)requestMessageForCategory:(unsigned int)a3 type:(unsigned __int16)a4 callback:(id)a5
{
  void *v8;
  uint64_t v9;
  AudioAnalyticsReporter *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = self;
  AudioAnalyticsReporter.requestMessage(for:type:callback:)(a3, a4, (uint64_t)sub_21DBB6B2C, v9);

  swift_release();
}

@end
