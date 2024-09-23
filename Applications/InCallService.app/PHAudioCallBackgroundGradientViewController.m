@implementation PHAudioCallBackgroundGradientViewController

- (void)viewDidLoad
{
  PHAudioCallBackgroundGradientViewController *v2;

  v2 = self;
  AudioCallBackgroundGradientViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PHAudioCallBackgroundGradientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (PHAudioCallBackgroundGradientViewController *)AudioCallBackgroundGradientViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (PHAudioCallBackgroundGradientViewController)initWithCoder:(id)a3
{
  return (PHAudioCallBackgroundGradientViewController *)AudioCallBackgroundGradientViewController.init(coder:)(a3);
}

@end
