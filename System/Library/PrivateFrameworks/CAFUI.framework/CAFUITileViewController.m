@implementation CAFUITileViewController

- (_TtC5CAFUI23CAFUITileViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized CAFUITileViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC5CAFUI23CAFUITileViewController *v2;

  v2 = self;
  CAFUITileViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5CAFUI23CAFUITileViewController *v4;

  v4 = self;
  CAFUITileViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUITileViewController();
  v4 = (char *)v5.receiver;
  -[CAFUITileViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_volumeNotificationAssertion], sel_cancelSuspension, v5.receiver, v5.super_class);

}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for IndexPath?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_focusLockIndexPath;
  swift_beginAccess();
  outlined init with copy of UIListContentConfiguration?((uint64_t)v8, (uint64_t)v7, (uint64_t *)&demangling cache variable for type metadata for IndexPath?);
  v9 = type metadata accessor for IndexPath();
  LOBYTE(v8) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v7, 1, v9) == 1;
  outlined destroy of UIContentConfiguration?((uint64_t)v7, (uint64_t *)&demangling cache variable for type metadata for IndexPath?);
  return (char)v8;
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v5;
  _TtC5CAFUI23CAFUITileViewController *v6;
  _TtC5CAFUI23CAFUITileViewController *v7;
  UIEvent_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  CAFUITileViewController._wheelChanged(with:)(v8);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC5CAFUI23CAFUITileViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = CAFUITileViewController.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC5CAFUI23CAFUITileViewController *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = CAFUITileViewController.gestureRecognizer(_:shouldBeRequiredToFailBy:)((UIGestureRecognizer)v6, (UIGestureRecognizer)v7);

  return v9;
}

- (void)nudgeGestureRecognized:(id)a3
{
  id v4;
  os_log_type_t v5;
  _TtC5CAFUI23CAFUITileViewController *v6;

  v4 = a3;
  v6 = self;
  v5 = static os_log_type_t.info.getter();
  specialized static CAFUILogger.log(_:message:function:file:line:)(v5, 0xD000000000000015, 0x800000023757E8A0, 0xD00000000000001ALL, 0x800000023757E8C0);

}

- (_TtC5CAFUI23CAFUITileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5CAFUI23CAFUITileViewController *result;

  v4 = a4;
  result = (_TtC5CAFUI23CAFUITileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  outlined destroy of UIContentConfiguration?((uint64_t)self + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_focusLockIndexPath, (uint64_t *)&demangling cache variable for type metadata for IndexPath?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_nudgeGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_nudgeLongGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_sessionConfiguration));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI23CAFUITileViewController_volumeNotificationAssertion));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC5CAFUI23CAFUITileViewController *v11;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  CAFUITileViewController.collectionView(_:didSelectItemAt:)(v10, (unint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)dismissIfModal
{
  _TtC5CAFUI23CAFUITileViewController *v2;
  _TtC5CAFUI23CAFUITileViewController *v3;
  _TtC5CAFUI23CAFUITileViewController *v4;
  _TtC5CAFUI23CAFUITileViewController *v5;

  v5 = self;
  v2 = (_TtC5CAFUI23CAFUITileViewController *)-[CAFUITileViewController presentingViewController](v5, sel_presentingViewController);
  if (v2)
  {
    v3 = v2;
    -[CAFUITileViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (void)punchThroughController:(id)a3 didDismissPunchThroughWithIdentifier:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _TtC5CAFUI23CAFUITileViewController *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = a3;
  v10 = self;
  specialized CAFUITileViewController.punchThroughController(_:didDismissPunchThroughWithIdentifier:)(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)sessionConfiguration:(id)a3 limitedUserInterfacesChanged:(unint64_t)a4
{
  id v6;
  _TtC5CAFUI23CAFUITileViewController *v7;

  v6 = a3;
  v7 = self;
  specialized CAFUITileViewController.sessionConfiguration(_:limitedUserInterfacesChanged:)(a4);

}

- (void)automakerSettingService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5;
  _TtC5CAFUI23CAFUITileViewController *v6;

  v5 = a3;
  v6 = self;
  CAFUITileViewController.resetAndReload()();

}

- (void)automakerSettingService:(id)a3 didUpdateSectionIdentifier:(id)a4
{
  id v6;
  _TtC5CAFUI23CAFUITileViewController *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFUITileViewController.resetAndReload()();

  swift_bridgeObjectRelease();
}

- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v6;
  _TtC5CAFUI23CAFUITileViewController *v7;

  v6 = a3;
  v7 = self;
  CAFUITileViewController.automakerSettingService(_:didUpdateHidden:)(v6, a4);

}

- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  id v5;
  _TtC5CAFUI23CAFUITileViewController *v6;

  if (a4)
  {
    v5 = a3;
    v6 = self;
    CAFUITileViewController.handleSettingHiddenDisabled(_:)(v5);

  }
}

@end
