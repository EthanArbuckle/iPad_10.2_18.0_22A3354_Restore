@implementation FLTelemetryFactory

+ (id)sharedTelemetryController
{
  if (sharedTelemetryController_onceToken != -1)
    dispatch_once(&sharedTelemetryController_onceToken, &__block_literal_global_1);
  return (id)sharedTelemetryController_controller;
}

void __47__FLTelemetryFactory_sharedTelemetryController__block_invoke()
{
  FLTelemetryAnalyticsController *v0;
  void *v1;

  v0 = objc_alloc_init(FLTelemetryAnalyticsController);
  v1 = (void *)sharedTelemetryController_controller;
  sharedTelemetryController_controller = (uint64_t)v0;

}

@end
