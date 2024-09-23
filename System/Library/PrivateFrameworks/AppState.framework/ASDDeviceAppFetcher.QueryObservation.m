@implementation ASDDeviceAppFetcher.QueryObservation

- (NSString)description
{
  _TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation *v2;
  void *v3;

  v2 = self;
  sub_222A84D04();

  v3 = (void *)sub_222AAD7A8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation *v11;

  sub_222A7418C(0, (unint64_t *)&qword_2540C81B0);
  v6 = sub_222AAD850();
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_taskScheduler), *(_QWORD *)&self->taskScheduler[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_taskScheduler+ 8]);
  v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_observer);
  v7 = *(_QWORD *)&self->appQuery[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_observer];
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v8;
  v9[3] = v7;
  v9[4] = v6;
  v10 = a3;
  v11 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_222AAD5D4();

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation)init
{
  _TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation *result;

  result = (_TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_appQuery));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_taskScheduler);
  swift_release();
}

@end
