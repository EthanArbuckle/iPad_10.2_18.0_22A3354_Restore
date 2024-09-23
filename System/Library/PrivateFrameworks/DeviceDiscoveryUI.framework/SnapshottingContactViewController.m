@implementation SnapshottingContactViewController

- (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC17DeviceDiscoveryUI33SnapshottingContactViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_phase) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_dismiss);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController____lazy_storage___viewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_snapshotView) = 0;
  v5 = a3;

  result = (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController *)sub_23A447704();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC17DeviceDiscoveryUI33SnapshottingContactViewController *v3;

  v3 = self;
  sub_23A431C78();

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didTapDone
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC17DeviceDiscoveryUI33SnapshottingContactViewController *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_dismiss);
  if (v2)
  {
    v4 = self;
    v3 = sub_23A3D5428((uint64_t)v2);
    v2(v3);
    sub_23A3C9598((uint64_t)v2);

  }
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  void (*v4)(uint64_t);
  id v7;
  id v8;
  uint64_t v9;
  _TtC17DeviceDiscoveryUI33SnapshottingContactViewController *v10;

  v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_dismiss);
  if (v4)
  {
    v7 = a3;
    v8 = a4;
    v10 = self;
    v9 = sub_23A3D5428((uint64_t)v4);
    v4(v9);
    sub_23A3C9598((uint64_t)v4);

  }
}

- (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17DeviceDiscoveryUI33SnapshottingContactViewController *result;

  v4 = a4;
  result = (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_contact));
  sub_23A3C9598(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_dismiss));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController____lazy_storage___viewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_snapshotView));
}

@end
