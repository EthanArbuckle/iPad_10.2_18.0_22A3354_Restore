@implementation ZN2re4ecs228AudioPlayerTelemetryReporter22stopAndCleanupReporterEv

re *___ZN2re4ecs228AudioPlayerTelemetryReporter22stopAndCleanupReporterEv_block_invoke(re *result)
{
  uint64_t *v1;
  uint64_t v2;
  id v3;
  NSObject **v4;
  id v5;

  v1 = (uint64_t *)re::ecs2::AudioPlayerTelemetryReporter::sharedReporter;
  if (re::ecs2::AudioPlayerTelemetryReporter::sharedReporter)
  {
    v2 = re::globalAllocators(result)[2];
    if (re::ecs2::AudioPlayerTelemetryReporter::shouldSendReport((re::ecs2::AudioPlayerTelemetryReporter *)v1))
    {
      re::ecs2::AudioPlayerTelemetryReporter::collectTelemetryStatistics((re::ecs2::AudioPlayerTelemetryReporter *)v1);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = (NSObject **)v1[13];
      v5 = v3;
      re::AudioTelemetryReporter::sendTelemetryReport(v4, CFSTR("app_usage"), v5);

    }
    v1[18] = 0;
    std::unique_ptr<re::AudioTelemetryReporter,std::function<void ()(re::AudioTelemetryReporter*)>>::reset[abi:ne180100](v1 + 13, 0);
    std::unique_ptr<re::AudioTelemetryReporter,std::function<void ()(re::AudioTelemetryReporter*)>>::~unique_ptr[abi:ne180100](v1 + 13);
    result = (re *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 40))(v2, v1);
    re::ecs2::AudioPlayerTelemetryReporter::sharedReporter = 0;
  }
  return result;
}

@end
