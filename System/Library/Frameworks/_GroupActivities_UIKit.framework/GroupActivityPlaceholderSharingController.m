@implementation GroupActivityPlaceholderSharingController

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)init
{
  _QWORD *v3;
  id v4;
  _TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_placeholderControllerDidCancel);
  *v3 = 0;
  v3[1] = 0;
  v4 = objc_allocWithZone(MEMORY[0x24BEBDB08]);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_init);
  v7 = OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_rootViewController;
  *(Class *)((char *)&v5->super.super.super.super.isa
           + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_rootViewController) = v6;

  v8 = *(uint64_t *)((char *)&v5->super.super.super.super.isa + v7);
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for GroupActivityPlaceholderSharingController();
  return -[GroupActivityPlaceholderSharingController initWithRootViewController:](&v10, sel_initWithRootViewController_, v8);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  _TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *v6;
  id v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v5 = objc_allocWithZone(MEMORY[0x24BEBD410]);
  v6 = self;
  v7 = objc_msgSend(v5, sel_initWithBarButtonSystemItem_target_action_, 1, v6, sel_cancelButtonTapped_);
  v8 = objc_msgSend(*(id *)((char *)&v6->super.super.super.super.isa+ OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_rootViewController), sel_navigationItem);
  objc_msgSend(v8, sel_setRightBarButtonItem_, v7);

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for GroupActivityPlaceholderSharingController();
  -[GroupActivityPlaceholderSharingController viewWillAppear:](&v9, sel_viewWillAppear_, v3);

}

- (void)viewDidLoad
{
  _TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *v2;

  v2 = self;
  GroupActivityPlaceholderSharingController.viewDidLoad()();

}

- (void)cancelButtonTapped:(id)a3
{
  id v4;
  _TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *v5;

  v4 = a3;
  v5 = self;
  specialized GroupActivityPlaceholderSharingController.cancelButtonTapped(_:)();

}

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_placeholderControllerDidCancel);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *result;

  result = (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *result;

  v3 = a3;
  result = (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *result;

  v4 = a4;
  result = (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_rootViewController));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_placeholderControllerDidCancel));
}

@end
