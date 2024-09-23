@implementation HomeIntelligence.ActivityLogger.MicroLocation.Adapter

- (_TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter)init
{
  return (_TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter *)sub_22197A994();
}

- (void)dealloc
{
  _TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter *v2;

  v2 = self;
  sub_22197AC30();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter_events;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573EC60);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_221917338((uint64_t)self+ OBJC_IVAR____TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter_continuation, &qword_25573EC40);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter_ulConnection));
}

- (void)connection:(id)a3 didUpdateServiceStatus:(id)a4
{
  id v6;
  id v7;
  _TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22197B158(a4);

}

- (void)connection:(id)a3 didUpdatePrediction:(id)a4
{
  id v6;
  id v7;
  _TtCOCC13HomeKitDaemon16HomeIntelligence14ActivityLogger13MicroLocation7Adapter *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22197B35C(a4);

}

@end
