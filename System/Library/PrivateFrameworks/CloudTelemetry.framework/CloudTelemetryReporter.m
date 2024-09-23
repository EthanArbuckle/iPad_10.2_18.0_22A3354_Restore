@implementation CloudTelemetryReporter

+ (BOOL)reportWithTeamID:(id)a3 eventType:(id)a4 event:(id)a5 allowCellularAccess:(BOOL)a6 allowExpensiveAccess:(BOOL)a7 bundleID:(id)a8 error:(id *)a9
{
  _BOOL4 v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a7;
  v11 = sub_2381C073C();
  v13 = v12;
  v14 = sub_2381C073C();
  v16 = v15;
  v17 = sub_2381C06F4();
  v18 = sub_2381C073C();
  v20 = v19;
  swift_getObjCClassMetadata();
  static Reporter.report(teamID:eventType:event:allowCellularAccess:allowExpensiveAccess:bundleID:)(v11, v13, v14, v16, v17, a6, v9, v18, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

+ (id)_privacyLogs:(id *)a3
{
  void *v3;

  sub_2381B6D9C();
  sub_2381C0640();
  v3 = (void *)sub_2381C079C();
  swift_bridgeObjectRelease();
  return v3;
}

- (CloudTelemetryReporter)init
{
  CloudTelemetryReporter *result;

  result = (CloudTelemetryReporter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
