@implementation ICSScreenSharingSpectatorRootViewController

- (PHPIPController)pipController
{
  id v2;

  sub_100187858();
  return (PHPIPController *)v2;
}

- (void)setPipController:(id)a3
{
  id v5;
  ICSScreenSharingSpectatorRootViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1001878C8((uint64_t)a3);

}

- (unint64_t)supportedInterfaceOrientations
{
  ICSScreenSharingSpectatorRootViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_10018790C();

  return (unint64_t)v3;
}

- (ICSScreenSharingSpectatorRootViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v4;

  v4 = a3;
  return (ICSScreenSharingSpectatorRootViewController *)sub_100187924(a3);
}

- (ICSScreenSharingSpectatorRootViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100187BB0();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  ICSScreenSharingSpectatorRootViewController *v2;

  v2 = self;
  sub_100187C4C();

}

- (void)viewDidLoad
{
  ICSScreenSharingSpectatorRootViewController *v2;

  v2 = self;
  sub_100188008();

}

- (void)viewDidAppear:(BOOL)a3
{
  ICSScreenSharingSpectatorRootViewController *v4;

  v4 = self;
  sub_1001880A4(a3);

}

- (void)pipStateDidChangeNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  ICSScreenSharingSpectatorRootViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_100188144();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (id)pipSourceProvider
{
  ICSScreenSharingSpectatorRootViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100188308();
  v4 = v3;

  return v4;
}

- (id)parentViewControllerForRestoringPiP
{
  ICSScreenSharingSpectatorRootViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_10018835C();
  v4 = v3;

  return v4;
}

- (void)handlePIPViewControllerRestoredAfterPIPStopped:(id)a3
{
  id v4;
  ICSScreenSharingSpectatorRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001883B0();

}

- (ICSScreenSharingSpectatorRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_100188424();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSScreenSharingSpectatorRootViewController_callDisplayStyleManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSScreenSharingSpectatorRootViewController_containerViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICSScreenSharingSpectatorRootViewController_cancellables));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSScreenSharingSpectatorRootViewController_pipController));
}

@end
