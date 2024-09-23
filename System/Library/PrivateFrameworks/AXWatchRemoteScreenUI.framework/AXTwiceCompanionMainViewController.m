@implementation AXTwiceCompanionMainViewController

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  char *v4;
  id *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  v4 = (char *)v6.receiver;
  -[AXTwiceCompanionMainViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  LODWORD(v3) = *MEMORY[0x24BEBDE88];
  v5 = (id *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel];
  swift_beginAccess();
  UIAccessibilityPostNotification(v3, *v5);

}

- (void)viewDidLoad
{
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController *v2;

  v2 = self;
  sub_21EC64300();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)cardSwipeDownWithGesture:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_21EC65AD8(v4);

}

- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController *)AXTwiceCompanionMainViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController)initWithCoder:(id)a3
{
  return (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController *)AXTwiceCompanionMainViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView));
}

@end
