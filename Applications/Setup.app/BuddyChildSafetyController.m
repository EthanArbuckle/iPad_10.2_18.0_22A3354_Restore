@implementation BuddyChildSafetyController

- (_TtC5Setup26BuddyChildSafetyController)init
{
  return (_TtC5Setup26BuddyChildSafetyController *)sub_100016740();
}

- (void)viewDidLoad
{
  _TtC5Setup26BuddyChildSafetyController *v2;

  v2 = self;
  sub_100016900();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Setup26BuddyChildSafetyController *v4;

  v4 = self;
  sub_1000172AC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Setup26BuddyChildSafetyController *v4;

  v4 = self;
  sub_100017374(a3);

}

- (void)continueTapped
{
  BFFFlowItemDelegate *v2;
  BFFFlowItemDelegate *v3;
  _TtC5Setup26BuddyChildSafetyController *v4;

  v4 = self;
  v2 = -[BuddyWelcomeController delegate](v4, "delegate");
  if (v2)
  {
    v3 = v2;
    -[BFFFlowItemDelegate flowItemDone:](v2, "flowItemDone:", v4);

    swift_unknownObjectRelease(v3);
  }
  else
  {

  }
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return (BuddyFlowItemDispositionProvider *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_flowItemDispositionProvider];
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_flowItemDispositionProvider];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_flowItemDispositionProvider] = a3;
  v3 = a3;

}

- (BYRunState)runState
{
  return (BYRunState *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_runState], a2);
}

- (void)setRunState:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_runState];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_runState] = a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 16;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)controllerNeedsToRun
{
  _TtC5Setup26BuddyChildSafetyController *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v4 = sub_100017570((uint64_t)v2, v3);

  return v4 & 1;
}

- (_TtC5Setup26BuddyChildSafetyController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Setup26BuddyChildSafetyController *result;

  result = (_TtC5Setup26BuddyChildSafetyController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyChildSafetyController", 32, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC5Setup26BuddyChildSafetyController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Setup26BuddyChildSafetyController *result;

  v6 = a5;
  result = (_TtC5Setup26BuddyChildSafetyController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyChildSafetyController", 32, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_runState]);
}

@end
