@implementation B332SetupViewControllerProxy

- (void)viewDidLoad
{
  _TtC18SharingViewService28B332SetupViewControllerProxy *v2;

  v2 = self;
  sub_1000A3898();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1000A5FF0(self, (uint64_t)a2, a3, type metadata accessor for B332SetupViewControllerProxy, (SEL *)&selRef_viewDidAppear_);
}

- (unint64_t)desiredHomeButtonEvents
{
  return 16;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  objc_class *v9;
  Class isa;
  uint64_t v11;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v12;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017BD70, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = (void (*)(void))sub_10005BC14;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v12 = self;
  if (a3)
  {
    v9 = (objc_class *)objc_msgSend(a3, "userInfo");
    isa = v9;
    if (v9)
    {
      v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v9, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v11);
    }
  }
  else
  {
    isa = 0;
  }
  -[SVSBaseMainController setUserInfo:](v12, "setUserInfo:", isa);

  if (v6)
  {
    v8();
    sub_100012F60((uint64_t)v8, v7);
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  unsigned __int8 v4;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v5;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v6;
  objc_super v7;

  v3 = a3;
  v4 = self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_dismissed];
  v5 = self;
  v6 = v5;
  if ((v4 & 1) == 0)
    -[B332SetupViewControllerProxy dismiss:](v5, "dismiss:", 21);
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for B332SetupViewControllerProxy();
  -[SVSBaseMainController viewDidDisappear:](&v7, "viewDidDisappear:", v3);

}

- (void)dismiss:(int)a3
{
  -[B332SetupViewControllerProxy dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t (*v6)(void);
  uint64_t v7;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v8;

  v6 = (uint64_t (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017BCF8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10005BC14;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1000A3DF4(a3, (uint64_t)v6, v7);
  sub_100012F60((uint64_t)v6, v7);

}

- (void)handleButtonActions:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v8;

  if (a3)
  {
    v5 = sub_100013194(0, (unint64_t *)&qword_1001A5BC0, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_10005B9EC();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1000A419C(v7);

  swift_bridgeObjectRelease(v7);
}

- (void)dealloc
{
  _TtC18SharingViewService28B332SetupViewControllerProxy *v2;
  uint64_t v3;

  v2 = self;
  sub_1000A4504((uint64_t)v2, v3);
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_retainRemoteViewControllerProxy]);
}

- (_TtC18SharingViewService28B332SetupViewControllerProxy)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18SharingViewService28B332SetupViewControllerProxy *)sub_1000A473C(v5, v7, a4);
}

- (_TtC18SharingViewService28B332SetupViewControllerProxy)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService28B332SetupViewControllerProxy *)sub_1000A48E8(a3);
}

- (void)releaseHUDTransaction
{
  _TtC18SharingViewService28B332SetupViewControllerProxy *v2;

  v2 = self;
  exit(0);
}

- (void)updateDeviceInfoWithDeviceType:(unint64_t)a3 batteryLevel:(double)a4 batteryLevelKnown:(BOOL)a5 edge:(unint64_t)a6 orientation:(int64_t)a7 isCharging:(BOOL)a8 identifier:(id)a9
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v20;
  uint64_t v21;

  v15 = sub_100006A6C(&qword_1001A42A0);
  __chkstk_darwin(v15);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a9)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a9);
    v18 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    v19 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  v20 = self;
  sub_1000A649C(a6, a7, a8, (uint64_t)v17, a4);

  sub_1000A689C((uint64_t)v17);
}

- (void)setShouldShowWhatsNew:(BOOL)a3
{
  self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_shouldShowWhatsNew] = a3;
}

- (void)setDeviceType:(unint64_t)a3
{
  *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_deviceType] = a3;
}

- (void)dismissUIAnimated:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v11;

  v3 = qword_1001A3108;
  v11 = self;
  if (v3 != -1)
    swift_once(&qword_1001A3108, sub_1000A3808);
  v5 = type metadata accessor for Logger(0, v4);
  v6 = sub_10000E8E8(v5, (uint64_t)qword_1001A74B0);
  v7 = Logger.logObject.getter(v6);
  v9 = static os_log_type_t.default.getter(v7, v8);
  if (os_log_type_enabled(v7, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v9, "dismissUI", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  -[B332SetupViewControllerProxy dismiss:](v11, "dismiss:", 0);
}

- (void)didTapToPairPencil
{
  uint64_t v2;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v3;

  v3 = self;
  sub_1000A4C78((uint64_t)v3, v2);

}

- (void)didTapCancelPairing
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v10;

  v2 = qword_1001A3108;
  v10 = self;
  if (v2 != -1)
    swift_once(&qword_1001A3108, sub_1000A3808);
  v4 = type metadata accessor for Logger(0, v3);
  v5 = sub_10000E8E8(v4, (uint64_t)qword_1001A74B0);
  v6 = Logger.logObject.getter(v5);
  v8 = static os_log_type_t.default.getter(v6, v7);
  if (os_log_type_enabled(v6, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v8, "didTapCancelPairing", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  -[B332SetupViewControllerProxy showPairingFailure](v10, "showPairingFailure");
}

- (void)didCompleteOneRevolutionOfSpinningPencil
{
  self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_didCompleteOneRotation] = 1;
  -[B332SetupViewControllerProxy showAlertIfNeeded](self, "showAlertIfNeeded");
}

- (void)showAlertIfNeeded
{
  uint64_t v2;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v3;

  v3 = self;
  sub_1000A4E9C((uint64_t)v3, v2);

}

- (void)showPairingStarted
{
  uint64_t v2;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v3;

  v3 = self;
  sub_1000A5168((uint64_t)v3, v2);

}

- (void)showPairingSuccess
{
  uint64_t v2;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v3;

  v3 = self;
  sub_1000A546C((uint64_t)v3, v2);

}

- (int64_t)pnpDeviceTypeForType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return qword_100134B20[a3 - 1];
}

- (void)showSubsequentPairSuccess
{
  _TtC18SharingViewService28B332SetupViewControllerProxy *v2;

  v2 = self;
  sub_1000A563C("showSubsequentPairingSuccess", (SEL *)&selRef_pairingSucceededSubsequently);

}

- (void)showPairingFailure
{
  _TtC18SharingViewService28B332SetupViewControllerProxy *v2;

  v2 = self;
  sub_1000A563C("showPairingFailure", (SEL *)&selRef_pairingFailed);

}

- (void)showPairConsentPrompt
{
  uint64_t v2;
  _TtC18SharingViewService28B332SetupViewControllerProxy *v3;

  v3 = self;
  sub_1000A5780((uint64_t)v3, v2);

}

- (void)viewControllerDidDismiss:(id)a3
{
  _TtC18SharingViewService28B332SetupViewControllerProxy *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;

  v12 = a3;
  v4 = self;
  -[B332SetupViewControllerProxy dismiss:](v4, "dismiss:", 0);
  if (qword_1001A3108 != -1)
    swift_once(&qword_1001A3108, sub_1000A3808);
  v6 = type metadata accessor for Logger(0, v5);
  v7 = sub_10000E8E8(v6, (uint64_t)qword_1001A74B0);
  v8 = Logger.logObject.getter(v7);
  v10 = static os_log_type_t.default.getter(v8, v9);
  if (os_log_type_enabled(v8, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v10, "viewControllerDidDismiss", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

@end
