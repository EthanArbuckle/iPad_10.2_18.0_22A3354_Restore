@implementation AppDelegate

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  _TtC8AppStore11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000D36C();

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8AppStore11AppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100057438(&qword_100829AA8, 255, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1006615A8);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_100036768();

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore11AppDelegate *v8;
  id v9;
  id v10;

  if (!a4)
    return 30;
  v6 = a4;
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, "traitCollection");
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == (id)1)
    return 30;
  else
    return 2;
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC8AppStore11AppDelegate_window));
}

- (_TtC8AppStore11AppDelegate)init
{
  return (_TtC8AppStore11AppDelegate *)sub_10000E540();
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  sub_1001BA658(a4);
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4;
  _TtC8AppStore11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100395C4C();

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  _TtC8AppStore11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100395E58();

}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC8AppStore11AppDelegate *v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  type metadata accessor for OpenURLOptionsKey(0);
  v14 = v13;
  v15 = sub_100057438((unint64_t *)&unk_100840BC0, 255, (uint64_t (*)(uint64_t))type metadata accessor for OpenURLOptionsKey, (uint64_t)&unk_1006615EC);
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15);
  v17 = a3;
  v18 = self;
  LOBYTE(v14) = sub_100395FAC((uint64_t)v12, v16);

  v19 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v14 & 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8AppStore11AppDelegate *v11;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  LOBYTE(self) = sub_1003963F8(v10);
  _Block_release(v8);

  return self & 1;
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC8AppStore11AppDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10076F1D0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100396638(v11, (uint64_t)sub_100395C38, v9);

  swift_release(v9);
}

- (void)mediaTokenAccountDidChange
{
  _TtC8AppStore11AppDelegate *v2;

  v2 = self;
  sub_100394CB8();

}

- (void)handleDebugActivationFrom:(id)a3
{
  id v4;
  _TtC8AppStore11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)3)
    sub_100394DEC();

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _TtC8AppStore11AppDelegate *v19;
  uint64_t v20;

  v9 = type metadata accessor for BootstrapPhase(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = swift_allocObject(&unk_10076F180, 24, 7);
  *(_QWORD *)(v14 + 16) = v13;
  v15 = swift_allocObject(&unk_10076F1A8, 32, 7);
  *(_QWORD *)(v15 + 16) = sub_100395BE0;
  *(_QWORD *)(v15 + 24) = v14;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for BootstrapPhase.presentingContent(_:), v9);
  v16 = *((unsigned __int8 *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_isPresentingContentFinished);
  v17 = a3;
  v18 = a4;
  v19 = self;
  swift_retain(v14);
  BootstrapPendingClosuresHandler.performClosure(after:priority:canPerformImmediately:closure:)(v12, 0, v16, sub_100395C14, v15);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  swift_release(v14);
  swift_release(v15);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC8AppStore11AppDelegate *v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = type metadata accessor for BootstrapPhase(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject(&unk_10076F158, 24, 7);
  *(_QWORD *)(v11 + 16) = self;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for BootstrapPhase.presentingContent(_:), v7);
  v12 = *((unsigned __int8 *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_isPresentingContentFinished);
  v13 = self;
  v14 = a3;
  v15 = a4;
  BootstrapPendingClosuresHandler.performClosure(after:priority:canPerformImmediately:closure:)(v10, 0, v12, sub_100395BB4, v11);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  swift_release(v11);
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_eventWatchdoge));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_urlActionRunner));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_quickActionsController));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8AppStore11AppDelegate_bootstrapPendingClosuresHandler));
  sub_100081A14(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_pptViewHierarchyProxy), *(_QWORD *)&self->window[OBJC_IVAR____TtC8AppStore11AppDelegate_pptViewHierarchyProxy]);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore11AppDelegate_flowController, &qword_100833160);

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_freshnessWatchdog));
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8AppStore11AppDelegate *v12;
  char v13;
  char v14;

  v5 = a5;
  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v11 = a3;
  v12 = self;
  sub_100586D34(a3, v8, v10, (uint64_t)v5);
  v14 = v13;

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v10);
  return v14 & 1;
}

@end
