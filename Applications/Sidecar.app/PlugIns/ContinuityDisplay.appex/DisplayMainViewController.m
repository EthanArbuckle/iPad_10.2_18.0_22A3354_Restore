@implementation DisplayMainViewController

- (NSUndoManager)undoManager
{
  id v2;

  sub_100029B94();
  return (NSUndoManager *)v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)waitForServiceReady
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  return 1;
}

- (SidecarRequest)request
{
  id v2;

  sub_100029C0C();
  return (SidecarRequest *)v2;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  DisplayMainViewController *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_100029C90();
  v4 = v3;

  return v4;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  DisplayMainViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_100029D74();

  return v3 & 1;
}

- (void)dealloc
{
  DisplayMainViewController *v2;

  v2 = self;
  sub_100029E28();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->SidecarServiceViewController_opaque[OBJC_IVAR___DisplayMainViewController_displaySettings]);
  sub_100036CD0(*(void **)&self->SidecarServiceViewController_opaque[OBJC_IVAR___DisplayMainViewController_snapshot], *(void **)&self->displayViewController[OBJC_IVAR___DisplayMainViewController_snapshot]);
  sub_100018C6C(OBJC_IVAR___DisplayMainViewController_sidebarController);
  swift_bridgeObjectRelease(*(_QWORD *)&self->SidecarServiceViewController_opaque[OBJC_IVAR___DisplayMainViewController_corners]);
  sub_100018C6C(OBJC_IVAR___DisplayMainViewController_displayLeftConstraint);
  sub_100018C6C(OBJC_IVAR___DisplayMainViewController_displayRightConstraint);
  swift_bridgeObjectRelease(*(_QWORD *)&self->displayViewController[OBJC_IVAR___DisplayMainViewController_currentTool]);
  sub_100018C6C(OBJC_IVAR___DisplayMainViewController_keyboardResponder);
  sub_100018C6C(OBJC_IVAR___DisplayMainViewController__customUndoManager);
  sub_100018C6C(OBJC_IVAR___DisplayMainViewController_displayContainer);
  sub_100018C6C(OBJC_IVAR___DisplayMainViewController_qosViewController);
  sub_100018C6C(OBJC_IVAR___DisplayMainViewController_keyboardDebugLayer);
  sub_100018C6C(OBJC_IVAR___DisplayMainViewController_presentedAlert);
  swift_unknownObjectRelease(*(_QWORD *)&self->SidecarServiceViewController_opaque[OBJC_IVAR___DisplayMainViewController_reconfigureWatchdog]);
  sub_10001893C((uint64_t)&self->SidecarServiceViewController_opaque[OBJC_IVAR___DisplayMainViewController_usageSummary], &qword_1000786A0);
  swift_release(*(_QWORD *)&self->SidecarServiceViewController_opaque[OBJC_IVAR___DisplayMainViewController_disableUniversalControlAssertion]);
  swift_unknownObjectRelease(*(_QWORD *)&self->SidecarServiceViewController_opaque[OBJC_IVAR___DisplayMainViewController__viewUpdateTimer]);
}

- (void)loadView
{
  DisplayMainViewController *v2;

  v2 = self;
  sub_100029FD8();

}

- (void)_keyboardFrameChangedWithNote:(id)a3
{
  sub_10002B3B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_10002A80C);
}

- (void)_batteryStateChangedWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  DisplayMainViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10002A9E4();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)_displayModeChanged:(id)a3
{
  sub_10002B3B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_10002AA80);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  DisplayMainViewController *v4;

  v3 = a3;
  v4 = self;
  sub_10002B620(v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  DisplayMainViewController *v4;

  v3 = a3;
  v4 = self;
  sub_10002B7A4(v3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  DisplayMainViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10002B8AC((uint64_t)a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)requestDidStart:(id)a3
{
  id v4;
  DisplayMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10002B978(v4);

}

- (void)receivedItems:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  sub_100018AA4(0, (unint64_t *)&unk_100077E40, SidecarItem_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  swift_bridgeObjectRelease(v5);
}

- (int64_t)requestCompleted
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  DisplayMainViewController *v2;

  v2 = self;
  sub_100030478((uint64_t)v2);

}

- (void)sidecarServiceActive
{
  DisplayMainViewController *v2;

  v2 = self;
  sub_10003055C();

}

- (void)cut:(id)a3
{
  sub_1000308FC(self, (__n128)xmmword_1000593A0, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100030974);
}

- (void)copy:(id)a3
{
  sub_1000308FC(self, (__n128)vdupq_n_s64(8uLL), (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100030974);
}

- (void)paste:(id)a3
{
  sub_1000308FC(self, (__n128)xmmword_1000593B0, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100030974);
}

- (DisplayMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  DisplayMainViewController *result;

  sub_100034FF4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, void *))sub_100030F90);
  return result;
}

- (DisplayMainViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (DisplayMainViewController *)sub_10003121C();
}

- (BOOL)backgrounded
{
  DisplayMainViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10003334C();

  return v3 & 1;
}

- (void)setBackgrounded:(BOOL)a3
{
  DisplayMainViewController *v4;

  v4 = self;
  sub_1000333B8(a3);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

@end
