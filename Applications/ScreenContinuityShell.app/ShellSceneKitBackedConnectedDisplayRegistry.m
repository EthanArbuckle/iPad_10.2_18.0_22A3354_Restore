@implementation ShellSceneKitBackedConnectedDisplayRegistry

- (_TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry)init
{
  _TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry *result;

  result = (_TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry *)_swift_stdlib_reportUnimplementedInitializer("ScreenContinuityShell.ShellSceneKitBackedConnectedDisplayRegistry", 65, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_displayProfile));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_profileRegsitry));
}

- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4
{
  id v6;
  id v7;
  _TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10000F598((uint64_t)v6, v7);

  return v9 & 1;
}

@end
