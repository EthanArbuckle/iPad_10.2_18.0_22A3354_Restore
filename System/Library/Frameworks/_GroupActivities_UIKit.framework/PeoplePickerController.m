@implementation PeoplePickerController

- (_TtC22_GroupActivities_UIKit22PeoplePickerController)init
{
  return (_TtC22_GroupActivities_UIKit22PeoplePickerController *)PeoplePickerController.init()();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController_conversationManagerClient);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController____lazy_storage___connection));
  outlined consume of _EXHostViewController??(*(id *)((char *)&self->super.isa
                                                    + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController____lazy_storage___hostViewControllerConfig));
  outlined consume of _EXHostViewController??(*(id *)((char *)&self->super.isa
                                                    + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController____lazy_storage___extensionViewController));
  outlined destroy of weak PeoplePickerViewController?((uint64_t)self + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController_hostViewController);
}

- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4
{
  id v6;
  id v7;
  _TtC22_GroupActivities_UIKit22PeoplePickerController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PeoplePickerController.hostViewController(_:didPrepareToHost:)(v6, v7);

}

- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5
{
  @objc PeoplePickerController.hostViewController(_:didFailToHost:error:)(self, (uint64_t)a2, a3, a4, a5, PeoplePickerController.hostViewController(_:didFailToHost:error:));
}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
  @objc PeoplePickerController.hostViewController(_:didFailToHost:error:)(self, (uint64_t)a2, a3, a4, a5, PeoplePickerController.hostViewController(_:didEndHosting:error:));
}

@end
