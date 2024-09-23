@implementation HUActivityLogSettingsModuleController

- (HUActivityLogSettingsModuleController)initWithModule:(id)a3
{
  return (HUActivityLogSettingsModuleController *)ActivityLogSettingsModuleController.init(module:)(a3);
}

- (Class)cellClassForItem:(id)a3
{
  sub_1B8E23A60(0, &qword_1EF20CFC0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUActivityLogSettingsModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8F41120(v6);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HUActivityLogSettingsModuleController_activityLogItemModule));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HUActivityLogSettingsModuleController_durationFormatter));
}

@end
