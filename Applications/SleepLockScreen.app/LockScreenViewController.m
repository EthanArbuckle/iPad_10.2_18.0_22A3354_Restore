@implementation LockScreenViewController

- (_TtC15SleepLockScreen24LockScreenViewController)init
{
  return (_TtC15SleepLockScreen24LockScreenViewController *)sub_100006D00();
}

- (_TtC15SleepLockScreen24LockScreenViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000FE0C();
}

- (void)dealloc
{
  _TtC15SleepLockScreen24LockScreenViewController *v2;

  v2 = self;
  sub_100007190();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->debugIdentifier[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_lockScreenStateObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentStateObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection));
}

- (void)viewDidLoad
{
  _TtC15SleepLockScreen24LockScreenViewController *v2;

  v2 = self;
  sub_100007414();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15SleepLockScreen24LockScreenViewController *v4;

  v4 = self;
  sub_10000785C(a3, (SEL *)&selRef_viewDidAppear_, "[%{public}s] view did appear");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC15SleepLockScreen24LockScreenViewController *v4;

  v4 = self;
  sub_10000785C(a3, (SEL *)&selRef_viewDidDisappear_, "[%{public}s] view did disappear");

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

+ (id)_remoteViewControllerInterface
{
  return (id)HKSPSleepLockScreenRemoteContentHostInterface(a1, a2);
}

+ (id)_exportedInterface
{
  return (id)HKSPSleepLockScreenRemoteContentServiceInterface(a1, a2);
}

- (void)configureWithUserInfo:(id)a3 contentBounds:(id)a4 endpoint:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  _TtC15SleepLockScreen24LockScreenViewController *v10;

  if (a3)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, &type metadata for Any[8], &protocol witness table for AnyHashable);
  else
    v8 = 0;
  swift_unknownObjectRetain(a4, a2);
  swift_unknownObjectRetain(a5, v9);
  v10 = self;
  sub_10000A3FC(v8, (uint64_t)a4, (uint64_t)a5);
  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a5);

  swift_bridgeObjectRelease(v8);
}

- (void)didChangeContentBounds
{
  _TtC15SleepLockScreen24LockScreenViewController *v2;

  v2 = self;
  sub_10000AA50();

}

- (void)getInlinePresentationContentFrameWithReplyBlock:(id)a3
{
  void *v4;
  _TtC15SleepLockScreen24LockScreenViewController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10000FEBC(v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)getContentPreferencesWithReplyBlock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void (**v9)(void *, _QWORD);
  _TtC15SleepLockScreen24LockScreenViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = (void (**)(void *, _QWORD))_Block_copy(a3);
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  v10 = self;
  *v8 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  LOBYTE(self) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((self & 1) != 0)
  {
    v9[2](v9, *(Class *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences));
    _Block_release(v9);

  }
  else
  {
    __break(1u);
  }
}

- (void)didDismissForDismissType:(int64_t)a3
{
  _TtC15SleepLockScreen24LockScreenViewController *v4;

  v4 = self;
  sub_10000C09C(a3);

}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15SleepLockScreen24LockScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  _TtC15SleepLockScreen24LockScreenViewController *result;

  v4 = a4;
  result = (_TtC15SleepLockScreen24LockScreenViewController *)_swift_stdlib_reportUnimplementedInitializer("SleepLockScreen.LockScreenViewController", 40, "init(nibName:bundle:)", 21, 0, v5, v6, v7, v8);
  __break(1u);
  return result;
}

@end
