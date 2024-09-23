@implementation CALNGEORouteHypothesizerProvider

+ (CALNGEORouteHypothesizerProvider)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__CALNGEORouteHypothesizerProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, block);
  return (CALNGEORouteHypothesizerProvider *)(id)sharedInstance_sharedInstance_6;
}

void __50__CALNGEORouteHypothesizerProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = v0;

}

- (id)hypothesizerForPlannedDestination:(id)a3
{
  void *v3;
  CALNGEORouteHypothesizer *v4;

  objc_msgSend(MEMORY[0x24BE3D028], "hypothesizerForPlannedDestination:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CALNGEORouteHypothesizer initWithRouteHypothesizer:]([CALNGEORouteHypothesizer alloc], "initWithRouteHypothesizer:", v3);

  return v4;
}

- (void)didDismissUINotification:(unint64_t)a3 forPlannedDestination:(id)a4 dismissalType:(unint64_t)a5
{
  objc_msgSend(MEMORY[0x24BE3D028], "didDismissUINotification:forPlannedDestination:dismissalType:", a3, a4, a5);
}

@end
