@implementation VSRootViewController

- (void)dealloc
{
  void *v3;
  _TtC12AutoSettings20VSRootViewController *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  objc_super v9;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  static String._unconditionallyBridgeFromObjectiveC(_:)(CARSessionLimitUserInterfacesChangedNotification);
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v5, "removeObserver:", v8);

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for VSRootViewController(0);
  -[VSRootViewController dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->autoSettings[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem]);
  swift_release(*(_QWORD *)&self->autoSettings[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem]);
  swift_release(*(_QWORD *)&self->autoSettings[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem]);
}

- (void)viewDidLoad
{
  _TtC12AutoSettings20VSRootViewController *v2;

  v2 = self;
  VSRootViewController.viewDidLoad()();

}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = sub_100005888((uint64_t *)&unk_100027E70);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC12AutoSettings20VSRootViewController *v6;

  v5 = a3;
  v6 = self;
  _s12AutoSettings20VSRootViewControllerC29historicalNotificationService_15didUpdateHiddenySo013CAFHistoricalG0C_SbtF_0();

}

@end
