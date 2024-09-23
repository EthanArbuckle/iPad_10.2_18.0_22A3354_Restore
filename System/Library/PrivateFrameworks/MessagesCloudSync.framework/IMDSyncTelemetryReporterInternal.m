@implementation IMDSyncTelemetryReporterInternal

- (IMDSyncTelemetryReporterInternal)init
{
  return (IMDSyncTelemetryReporterInternal *)SyncTelemetryReporter.init()();
}

- (BOOL)postMessage:(id)a3 category:(int64_t)a4 error:(id *)a5
{
  uint64_t v7;
  IMDSyncTelemetryReporterInternal *v8;

  v7 = sub_217847F2C();
  v8 = self;
  SyncTelemetryReporter.postMessage(payload:category:)(v7, a4);
  swift_bridgeObjectRelease();

  return 1;
}

- (void).cxx_destruct
{

}

@end
