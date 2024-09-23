@implementation ZN2re29AudioManagerTelemetryReporter22stopAndCleanupReporterEv

re *___ZN2re29AudioManagerTelemetryReporter22stopAndCleanupReporterEv_block_invoke(re *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = re::AudioManagerTelemetryReporter::sharedReporter;
  if (re::AudioManagerTelemetryReporter::sharedReporter)
  {
    v2 = re::globalAllocators(result)[2];
    *(_QWORD *)(v1 + 40) = 0;
    re::internal::destroyPersistent<re::AudioTelemetryReporter>((re *)"~AudioManagerTelemetryReporter", 144, *(id **)(v1 + 32));
    *(_QWORD *)(v1 + 32) = 0;
    result = (re *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 40))(v2, v1);
    re::AudioManagerTelemetryReporter::sharedReporter = 0;
  }
  return result;
}

@end
