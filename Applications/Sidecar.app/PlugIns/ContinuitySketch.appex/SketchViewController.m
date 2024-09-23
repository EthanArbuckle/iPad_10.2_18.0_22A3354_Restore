@implementation SketchViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)sub_100004C3C();
}

- (void)viewDidLoad
{
  SketchViewController *v2;

  v2 = self;
  sub_100004C64();

}

- (void)_textEffectsWindowIsHosted
{
  SketchViewController *v2;

  v2 = self;
  sub_100005210();

}

- (void)cancel:(id)a3
{
  sub_100005914(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100005330);
}

- (void)done:(id)a3
{
  sub_100005914(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_10000538C);
}

- (SketchViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (SketchViewController *)sub_100005988(v5, v7, a4);
}

- (SketchViewController)initWithCoder:(id)a3
{
  return (SketchViewController *)sub_100005B40(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___SketchViewController_rootController);
  sub_10000630C(OBJC_IVAR___SketchViewController__undoManager);
  sub_10000630C(OBJC_IVAR___SketchViewController__navigationItem);
  sub_10000630C(OBJC_IVAR___SketchViewController_cancelButton);
  sub_10000630C(OBJC_IVAR___SketchViewController_doneButton);
  sub_10000630C(OBJC_IVAR___SketchViewController_fixedSpace);
  sub_10000630C(OBJC_IVAR___SketchViewController_canvas);
  sub_10000630C(OBJC_IVAR___SketchViewController_picker);
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SketchViewController_observer));
}

@end
