@implementation ErrorViewController

- (_TtC27AppleMediaServicesUIDynamic19ErrorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9D9F868();
}

- (void)dealloc
{
  _TtC27AppleMediaServicesUIDynamic19ErrorViewController *v2;

  v2 = self;
  sub_1B9D9F98C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_error));
  swift_release();
  sub_1B9D63180(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_retryAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_airplaneModeInquiry));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_cellularDataInquiry));
  __swift_destroy_boxed_opaque_existential_2((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_networkInquiry);
  sub_1B9D4A5CC((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_networkObservation, &qword_1ED5CC470);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController____lazy_storage___contentUnavailableView));
}

- (UINavigationItem)navigationItem
{
  _TtC27AppleMediaServicesUIDynamic19ErrorViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1B9D9FB1C((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  _TtC27AppleMediaServicesUIDynamic19ErrorViewController *v2;

  v2 = self;
  sub_1B9D9FBDC();

}

- (void)viewDidLoad
{
  _TtC27AppleMediaServicesUIDynamic19ErrorViewController *v2;

  v2 = self;
  sub_1B9DA0630();

}

- (void)viewWillLayoutSubviews
{
  _TtC27AppleMediaServicesUIDynamic19ErrorViewController *v2;

  v2 = self;
  sub_1B9DA069C();

}

- (_TtC27AppleMediaServicesUIDynamic19ErrorViewController)init
{
  sub_1B9DA1CD0();
}

- (_TtC27AppleMediaServicesUIDynamic19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B9DE2160();
  v5 = a4;
  sub_1B9DA1D08();
}

- (void)airplaneModeInquiryDidObserveChange:(id)a3
{
  id v4;
  _TtC27AppleMediaServicesUIDynamic19ErrorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B9DA1D78();

}

@end
