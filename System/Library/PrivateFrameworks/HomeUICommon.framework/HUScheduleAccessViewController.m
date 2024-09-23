@implementation HUScheduleAccessViewController

- (HUScheduleAccessViewController)initWithGuestAccessSchedule:(id)a3 tintColor:(id)a4 shouldDisplayAlwaysAllowedSchedule:(BOOL)a5 scheduleBackgroundColor:(id)a6 listRowBackgroundColor:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  return (HUScheduleAccessViewController *)HUScheduleAccessViewController.init(guestAccessSchedule:tintColor:shouldDisplayAlwaysAllowedSchedule:scheduleBackgroundColor:listRowBackgroundColor:)(a3, v13, v9, v14, a7);
}

- (HUScheduleAccessViewController)initWithHomeID:(id)a3 tintColor:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  HUScheduleAccessViewController *v12;
  uint64_t v14;

  v6 = sub_23EB94CD0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB94CB8();
  v10 = a4;
  v11 = (void *)sub_23EB94CA0();
  v12 = -[HUScheduleAccessViewController initWithHomeID:tintColor:listRowBackgroundColor:](self, sel_initWithHomeID_tintColor_listRowBackgroundColor_, v11, v10, 0);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (HUScheduleAccessViewController)initWithHomeID:(id)a3 tintColor:(id)a4 listRowBackgroundColor:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v13;

  v7 = sub_23EB94CD0();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB94CB8();
  v10 = a4;
  v11 = a5;
  return (HUScheduleAccessViewController *)HUScheduleAccessViewController.init(homeID:tintColor:listRowBackgroundColor:)((uint64_t)v9, v10, (char *)a5);
}

- (HUScheduleAccessViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23EB917B4();
}

- (HUScheduleAccessViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_23EB917B4();
}

- (void)viewDidLoad
{
  HUScheduleAccessViewController *v2;

  v2 = self;
  HUScheduleAccessViewController.viewDidLoad()();

}

- (void).cxx_destruct
{
  sub_23EB8CE2C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUScheduleAccessViewController_hostingController));
  swift_release();
}

@end
