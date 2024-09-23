@implementation AXTwiceCompanionRootViewController

- (void)viewDidLoad
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  sub_21EC718E8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v4;

  v4 = self;
  sub_21EC71FB8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v4;

  v4 = self;
  sub_21EC72284(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  void *v2;
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v3;
  id v4;
  id v5;
  objc_super v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger);
  v3 = self;
  v4 = v2;
  sub_21EC7CF08();

  v5 = sub_21EC7055C();
  objc_msgSend(v5, sel_cleanup);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for AXTwiceCompanionRootViewController();
  -[AXTwiceCompanionRootViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue));
  sub_21EC7C8B0(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver));
  swift_bridgeObjectRelease();
  sub_21EC7C8B0(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
  v3 = (char *)self + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
  v4 = sub_21EC7CFE0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_21EC7C230((uint64_t)self + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate, &qword_255481B20);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC));
  sub_21EC7C230((uint64_t)self + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate, &qword_255481B20);
}

- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_21EC7D0A0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *)AXTwiceCompanionRootViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController)initWithCoder:(id)a3
{
  return (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *)AXTwiceCompanionRootViewController.init(coder:)(a3);
}

- (void)twiceRemoteScreenReceiveMessage:(id)a3
{
  uint64_t v4;
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v5;

  v4 = sub_21EC7D07C();
  v5 = self;
  AXTwiceCompanionRootViewController.twiceRemoteScreenReceiveMessage(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)dismissButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_21EC7C694(0xD00000000000001CLL, 0x800000021EC7FD70);

}

- (void)airplayDidStartStreamingWithMirroringLayer:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v5;

  v4 = a3;
  v5 = self;
  AXTwiceCompanionRootViewController.airplayDidStartStreaming(withMirroringLayer:)((CALayer)v4);

}

- (void)airplayDidStopStreaming
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.airplayDidStopStreaming()();

}

- (void)axElementActivate:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  AXTwiceCompanionRootViewController.axElementActivate(_:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

}

- (void)crownButtonPressed
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.crownButtonPressed()();

}

- (void)doubleCrownButtonPressed
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.doubleCrownButtonPressed()();

}

- (void)tripleCrownButtonPressed
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.tripleCrownButtonPressed()();

}

- (void)crownButtonScrollUp
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.crownButtonScrollUp()();

}

- (void)crownButtonScrollDown
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.crownButtonScrollDown()();

}

- (void)crownButtonLongPressed
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.crownButtonLongPressed()();

}

- (void)sideButtonPressed
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.sideButtonPressed()();

}

- (void)sideButtonLongPressed
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.sideButtonLongPressed()();

}

- (void)axActionPerformWithAction:(int)a3 value:(id)a4 bridgeElement:(id)a5
{
  id v8;
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v9;
  id v10;
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v11;
  _OWORD v12[2];

  if (a4)
  {
    v8 = a5;
    v9 = self;
    swift_unknownObjectRetain();
    sub_21EC7D1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v10 = a5;
    v11 = self;
  }
  AXTwiceCompanionRootViewController.axActionPerform(action:value:bridgeElement:)(a3, (uint64_t)v12, a5);

  sub_21EC7C230((uint64_t)v12, &qword_255481BB0);
}

- (void)pullToDismissViewController
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.pullToDismissViewController()();

}

- (void)stingButtonPressed
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.stingButtonPressed()();

}

- (void)stingButtonLongPressed
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.stingButtonLongPressed()();

}

- (void)stingButtonKeycord
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *v2;

  v2 = self;
  AXTwiceCompanionRootViewController.stingButtonKeycord()();

}

@end
