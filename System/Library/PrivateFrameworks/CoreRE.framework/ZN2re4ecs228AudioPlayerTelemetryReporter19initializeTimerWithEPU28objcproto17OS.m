@implementation ZN2re4ecs228AudioPlayerTelemetryReporter19initializeTimerWithEPU28objcproto17OS

const __CFString *___ZN2re4ecs228AudioPlayerTelemetryReporter19initializeTimerWithEPU28objcproto17OS_dispatch_queue8NSObjectPNS0_17AudioPlayerSystemE_block_invoke_2(uint64_t a1)
{
  re::ecs2::AudioPlayerTelemetryReporter *v1;

  v1 = *(re::ecs2::AudioPlayerTelemetryReporter **)(a1 + 32);
  if (re::ecs2::AudioPlayerTelemetryReporter::shouldSendReport(v1))
  {
    re::ecs2::AudioPlayerTelemetryReporter::collectTelemetryStatistics(v1);
    objc_claimAutoreleasedReturnValue();
  }
  return CFSTR("app_usage");
}

@end
