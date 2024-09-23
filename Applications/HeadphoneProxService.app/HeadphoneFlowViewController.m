@implementation HeadphoneFlowViewController

- (_TtC20HeadphoneProxService27HeadphoneFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC20HeadphoneProxService27HeadphoneFlowViewController *)sub_100061144(v5, v7, a4);
}

- (_TtC20HeadphoneProxService27HeadphoneFlowViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  id v6;
  _TtC20HeadphoneProxService27HeadphoneFlowViewController *result;

  v4 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_interactor];
  *((_QWORD *)v4 + 4) = 0;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v5 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_presenter];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_homePressed] = 0;
  v6 = a3;

  result = (_TtC20HeadphoneProxService27HeadphoneFlowViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010008BD10, "HeadphoneProxService/HeadphoneFlowViewController.swift", 54, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC20HeadphoneProxService27HeadphoneFlowViewController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1000A91D0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100062748;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100061358(v8, (uint64_t)v6, v7);
  sub_10004D7DC((uint64_t)v6, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC20HeadphoneProxService27HeadphoneFlowViewController *v4;

  v4 = self;
  sub_100061D68(a3, (uint64_t)v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC20HeadphoneProxService27HeadphoneFlowViewController *v4;

  v4 = self;
  sub_100061EA8(a3, (uint64_t)v4);

}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 1);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _TtC20HeadphoneProxService27HeadphoneFlowViewController *v8;

  if (a3)
  {
    v5 = sub_100009F84(0, &qword_1000B9C88, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_1000626CC();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_10006204C(v7);

  swift_bridgeObjectRelease(v7);
}

- (void)_willAppearInRemoteViewController
{
  id v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v5.receiver;
  -[HeadphoneFlowViewController _willAppearInRemoteViewController](&v5, "_willAppearInRemoteViewController");
  v3 = (void *)sub_1000266B8();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAllowsAlertStacking:", 1, v5.receiver, v5.super_class);

    swift_unknownObjectRelease(v4);
  }
  else
  {

  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_router]);
  sub_100017E48((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_interactor], &qword_1000B81E0);
  swift_unknownObjectRelease(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneFlowViewController_presenter]);
}

@end
