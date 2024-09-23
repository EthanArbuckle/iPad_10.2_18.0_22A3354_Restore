@implementation HealthSharingInternalSettingsViewController

- (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController *result;

  result = (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HealthSharingInternalSettingsViewController();
  v2 = v6.receiver;
  -[CompoundDataSourceCollectionViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_allocWithZone(MEMORY[0x1E0DC34F0]);
  v4 = objc_msgSend(v3, sel_initWithBarButtonSystemItem_target_action_, 0, v2, sel_dismissView, v6.receiver, v6.super_class);
  v5 = objc_msgSend(v2, sel_navigationItem);
  objc_msgSend(v5, sel_setRightBarButtonItem_, v4);

}

- (void)dismissView
{
  -[HealthSharingInternalSettingsViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
