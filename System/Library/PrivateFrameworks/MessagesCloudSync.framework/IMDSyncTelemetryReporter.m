@implementation IMDSyncTelemetryReporter

- (IMDSyncTelemetryReporter)init
{
  IMDSyncTelemetryReporter *v2;
  IMDSyncTelemetryReporterInternal *v3;
  IMDSyncTelemetryReporterInternal *telemetryReporter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDSyncTelemetryReporter;
  v2 = -[IMDSyncTelemetryReporter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IMDSyncTelemetryReporterInternal);
    telemetryReporter = v2->_telemetryReporter;
    v2->_telemetryReporter = v3;

  }
  return v2;
}

- (void)postMessage:(id)a3 category:(int64_t)a4
{
  MEMORY[0x24BEDD108](self->_telemetryReporter, sel_postMessage_category_error_, a3, a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryReporter, 0);
}

@end
