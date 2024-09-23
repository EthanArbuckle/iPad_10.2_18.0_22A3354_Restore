@implementation NDAnalyticsTelemetryUploader

- (void)uploadEnvelopes:(id)a3 completion:(id)a4
{
  void *v5;
  char **v6;
  uint64_t v7;
  uint64_t (*v8)();
  NDAnalyticsTelemetryUploader *v9;

  v5 = _Block_copy(a4);
  sub_21468CDD0(0, &qword_254D7EC60);
  v6 = (char **)sub_214690560();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v8 = sub_21468C1DC;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  TelemetryUploader.uploadEnvelopes(_:completion:)(v6, (uint64_t)v8, v7);
  sub_21468C1A8((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (NDAnalyticsTelemetryUploader)init
{
  NDAnalyticsTelemetryUploader *result;

  result = (NDAnalyticsTelemetryUploader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
