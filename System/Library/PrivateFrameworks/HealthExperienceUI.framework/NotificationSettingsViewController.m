@implementation NotificationSettingsViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI34NotificationSettingsViewController *v2;

  v2 = self;
  sub_1A96AF568();

}

- (_TtC18HealthExperienceUI34NotificationSettingsViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  _TtC18HealthExperienceUI34NotificationSettingsViewController *result;

  v4 = OBJC_IVAR____TtC18HealthExperienceUI34NotificationSettingsViewController_viewControllerTitle;
  v5 = qword_1ED26FE28;
  v6 = a3;
  if (v5 != -1)
    swift_once();
  v7 = (uint64_t *)((char *)self + v4);
  *v7 = sub_1A9A91CF0();
  v7[1] = v8;

  result = (_TtC18HealthExperienceUI34NotificationSettingsViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)dismissProfile:(id)a3
{
  _TtC18HealthExperienceUI34NotificationSettingsViewController *v4;
  _TtC18HealthExperienceUI34NotificationSettingsViewController *v5;
  _TtC18HealthExperienceUI34NotificationSettingsViewController *v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  v5 = (_TtC18HealthExperienceUI34NotificationSettingsViewController *)-[NotificationSettingsViewController navigationController](v4, sel_navigationController);
  if (v5)
  {
    v6 = v5;
    -[NotificationSettingsViewController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtC18HealthExperienceUI34NotificationSettingsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI34NotificationSettingsViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI34NotificationSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
