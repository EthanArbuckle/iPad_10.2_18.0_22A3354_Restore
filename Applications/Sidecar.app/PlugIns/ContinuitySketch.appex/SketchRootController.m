@implementation SketchRootController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  SketchRootController *v2;

  v2 = self;
  sub_1000063A4();

}

- (int64_t)requestCompleted
{
  return 2;
}

- (SketchRootController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (SketchRootController *)sub_1000066EC(v5, v7, a4);
}

- (SketchRootController)initWithCoder:(id)a3
{
  return (SketchRootController *)sub_100006834(a3);
}

- (void).cxx_destruct
{

}

@end
