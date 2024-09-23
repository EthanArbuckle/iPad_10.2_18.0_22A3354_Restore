@implementation LoadingViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for LoadingViewController();
  -[BaseViewController viewDidLoad](&v2, "viewDidLoad");
}

- (_TtC11Diagnostics21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  DARootViewController *v6;
  DARootViewController *v7;
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
  return (_TtC11Diagnostics21LoadingViewController *)sub_100058D90(v5, v7, a4);
}

- (_TtC11Diagnostics21LoadingViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics21LoadingViewController *)sub_100058F54(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21LoadingViewController_loadingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21LoadingViewController_loadingLabel));
}

@end
