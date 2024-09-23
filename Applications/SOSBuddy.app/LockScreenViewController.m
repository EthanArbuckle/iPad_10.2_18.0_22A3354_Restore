@implementation LockScreenViewController

- (_TtC8SOSBuddy24LockScreenViewController)init
{
  return (_TtC8SOSBuddy24LockScreenViewController *)sub_1000807F0();
}

- (_TtC8SOSBuddy24LockScreenViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000836BC();
}

- (void)dealloc
{
  _TtC8SOSBuddy24LockScreenViewController *v2;

  v2 = self;
  sub_100080A58();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy24LockScreenViewController_tapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy24LockScreenViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy24LockScreenViewController_contentPreferences));
}

- (void)loadView
{
  _TtC8SOSBuddy24LockScreenViewController *v2;

  v2 = self;
  sub_100080C6C();

}

- (void)viewDidLoad
{
  _TtC8SOSBuddy24LockScreenViewController *v2;

  v2 = self;
  sub_100081238();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8SOSBuddy24LockScreenViewController *v4;

  v4 = self;
  sub_1000814C4(a3, (SEL *)&selRef_viewDidAppear_, "viewDidAppear for '%{public}@'");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8SOSBuddy24LockScreenViewController *v4;

  v4 = self;
  sub_1000814C4(a3, (SEL *)&selRef_viewDidDisappear_, "viewDidDisappear for '%{public}@'");

}

- (void)didTap
{
  _TtC8SOSBuddy24LockScreenViewController *v2;

  v2 = self;
  sub_1000816C4();

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)configureWithUserInfo:(id)a3 contentBounds:(id)a4 endpoint:(id)a5
{
  uint64_t v8;
  _TtC8SOSBuddy24LockScreenViewController *v9;

  if (a3)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v8 = 0;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  v9 = self;
  sub_1000838E0((uint64_t)a4);
  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a5);

  swift_bridgeObjectRelease(v8);
}

- (void)getContentPreferencesWithReplyBlock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void (**v10)(void *, _QWORD);
  _TtC8SOSBuddy24LockScreenViewController *v11;
  __n128 v12;
  uint64_t v13;

  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (uint64_t *)((char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = (void (**)(void *, _QWORD))_Block_copy(a3);
  sub_10006477C(0, (unint64_t *)&qword_10031ED20, OS_dispatch_queue_ptr);
  v11 = self;
  *v9 = static OS_dispatch_queue.main.getter(v12);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v5);
  LOBYTE(self) = _dispatchPreconditionTest(_:)(v9);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v9, v5);
  if ((self & 1) != 0)
  {
    v10[2](v10, *(Class *)((char *)&v11->super.super.super.isa+ OBJC_IVAR____TtC8SOSBuddy24LockScreenViewController_contentPreferences));
    _Block_release(v10);

  }
  else
  {
    __break(1u);
  }
}

- (void)didDismissForDismissType:(int64_t)a3
{
  _TtC8SOSBuddy24LockScreenViewController *v4;

  v4 = self;
  sub_100081FC8(a3);

}

- (void)getInlinePresentationContentFrameWithReplyBlock:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  _TtC8SOSBuddy24LockScreenViewController *v2;

  v2 = self;
  sub_10008268C();

  return 0;
}

+ (BOOL)_isSecureForRemoteViewService
{
  swift_getObjCClassMetadata(a1);
  sub_10008284C();
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  _TtC8SOSBuddy24LockScreenViewController *v2;

  v2 = self;
  sub_1000829EC();

  return 1;
}

+ (id)_remoteViewControllerInterface
{
  swift_getObjCClassMetadata(a1);
  return sub_100082BAC();
}

+ (id)_exportedInterface
{
  swift_getObjCClassMetadata(a1);
  return (id)sub_100082D6C();
}

- (_TtC8SOSBuddy24LockScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8SOSBuddy24LockScreenViewController *result;

  v4 = a4;
  result = (_TtC8SOSBuddy24LockScreenViewController *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.LockScreenViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
