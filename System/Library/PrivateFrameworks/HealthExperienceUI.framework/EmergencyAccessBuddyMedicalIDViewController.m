@implementation EmergencyAccessBuddyMedicalIDViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyMedicalIDViewController();
  v2 = v5.receiver;
  -[OBTableWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1A98D54A4();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  int v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EmergencyAccessBuddyMedicalIDViewController();
  v4 = v6.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  if ((v4[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_didShowEditMedicalIDOnViewDidAppear] & 1) == 0)
  {
    v5 = v4[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_flow + 8];
    if (v5 != 1
      && (v5 != 2
       || *(_QWORD *)&v4[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_flow] != 1))
    {
      v4[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_didShowEditMedicalIDOnViewDidAppear] = 1;
      sub_1A99A8860();
    }
  }

}

- (void)didTapCancel:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A99A8A28);
}

- (void)didTapNext:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A99A8CE4);
}

- (void)viewDidLayoutSubviews
{
  _TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *v2;
  UITableView *v3;
  UITableView *v4;
  double v5;
  double v6;
  objc_super v7;

  v2 = self;
  v3 = -[OBTableWelcomeController tableView](v2, sel_tableView);
  if (v3)
  {
    v4 = v3;
    -[UITableView contentSize](v3, sel_contentSize);
    v6 = v5;

    if (v6 != *(double *)((char *)&v2->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_tableViewHeight))
      sub_1A99A90B8();
    v7.receiver = v2;
    v7.super_class = (Class)type metadata accessor for EmergencyAccessBuddyMedicalIDViewController();
    -[OBTableWelcomeController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *result;

  result = (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *result;

  v5 = a5;
  result = (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *result;

  result = (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_medicalIDCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_medicalIDViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController____lazy_storage___tableViewHeightLayoutConstraint));
  sub_1A96698C8(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_flow), *((_BYTE *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_flow));
  sub_1A96698DC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_emergencyStatus);
}

- (char)medicalIDViewControllerDidCancel:(uint64_t)a3
{
  if (!a3
    || *(_QWORD *)&result[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_medicalIDViewController] != a3)
  {
    return (char *)objc_msgSend(result, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  return result;
}

- (void)medicalIDViewControllerDidUpdate:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *v5;

  if (a3)
  {
    if (*(id *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_medicalIDViewController) == a3)
    {
      v5 = self;
      v4 = a3;
      sub_1A99A90B8();

    }
  }
}

@end
