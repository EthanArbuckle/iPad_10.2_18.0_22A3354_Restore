@implementation DeferredPageViewController

- (_TtC27AppleMediaServicesUIDynamic26DeferredPageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9D84348();
}

- (UINavigationItem)navigationItem
{
  _TtC27AppleMediaServicesUIDynamic26DeferredPageViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1B9D843F8((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  _TtC27AppleMediaServicesUIDynamic26DeferredPageViewController *v2;

  v2 = self;
  sub_1B9D844AC();

}

- (void)viewDidLoad
{
  _TtC27AppleMediaServicesUIDynamic26DeferredPageViewController *v2;

  v2 = self;
  sub_1B9D8456C();

}

- (void)viewWillLayoutSubviews
{
  _TtC27AppleMediaServicesUIDynamic26DeferredPageViewController *v2;

  v2 = self;
  sub_1B9D845D0();

}

- (void)cancelButtonAction
{
  _TtC27AppleMediaServicesUIDynamic26DeferredPageViewController *v2;

  v2 = self;
  sub_1B9D85700();

}

- (_TtC27AppleMediaServicesUIDynamic26DeferredPageViewController)init
{
  sub_1B9D85B0C();
}

- (_TtC27AppleMediaServicesUIDynamic26DeferredPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B9DE2160();
  v5 = a4;
  sub_1B9D85B44();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic26DeferredPageViewController_child));
  sub_1B9D6B30C((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic26DeferredPageViewController_destination, (uint64_t (*)(_QWORD))type metadata accessor for DeferredPageDestination);
  swift_release();
}

@end
