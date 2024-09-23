@implementation BuddyLockdownModeController

- (_TtC5Setup27BuddyLockdownModeController)init
{
  _TtC5Setup27BuddyLockdownModeController *result;

  sub_1000136B4();
  return result;
}

- (void)viewDidLoad
{
  _TtC5Setup27BuddyLockdownModeController *v2;

  v2 = self;
  sub_1000138F8();

}

- (BOOL)enableTappedAndReturnError:(id *)a3
{
  _TtC5Setup27BuddyLockdownModeController *v3;

  v3 = self;
  sub_100013B58();

  return 1;
}

- (void)setUpLaterTapped
{
  _TtC5Setup27BuddyLockdownModeController *v2;

  v2 = self;
  sub_100014100();

}

- (BYRunState)runState
{
  return (BYRunState *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_runState], a2);
}

- (void)setRunState:(id)a3
{
  sub_100014604((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_runState);
}

- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider
{
  return (_TtP5Setup20LockdownModeProvider_ *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_lockdownModeProvider], a2);
}

- (void)setLockdownModeProvider:(id)a3
{
  sub_100014604((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_lockdownModeProvider);
}

- (BuddySetupMethod)setupMethod
{
  return (BuddySetupMethod *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_setupMethod];
}

- (void)setSetupMethod:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_setupMethod];
  *(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_setupMethod] = a3;
  v3 = a3;

}

+ (id)cloudConfigSkipKey
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(kMCCCSkipSetupLockdownMode);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BOOL)controllerNeedsToRun
{
  _TtC5Setup27BuddyLockdownModeController *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v4 = sub_1000146C0((uint64_t)v2, v3);

  return v4 & 1;
}

- (_TtC5Setup27BuddyLockdownModeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Setup27BuddyLockdownModeController *result;

  result = (_TtC5Setup27BuddyLockdownModeController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyLockdownModeController", 33, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC5Setup27BuddyLockdownModeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Setup27BuddyLockdownModeController *result;

  v6 = a5;
  result = (_TtC5Setup27BuddyLockdownModeController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyLockdownModeController", 33, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_runState]);
  swift_unknownObjectRelease(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_lockdownModeProvider]);

}

@end
