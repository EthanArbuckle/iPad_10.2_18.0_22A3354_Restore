@implementation FlowNavigationController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FlowNavigationController();
  v2 = v5.receiver;
  -[FlowNavigationController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_msgSend(v2, "navigationBar", v5.receiver, v5.super_class);
  objc_msgSend(v2, "pageMarginInsets");
  objc_msgSend(v3, "setLayoutMargins:");

  v4 = objc_msgSend(v2, "navigationBar");
  objc_msgSend(v4, "setPrefersLargeTitles:", 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FlowNavigationController();
  v4 = a3;
  v5 = v7.receiver;
  -[FlowNavigationController traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "navigationBar", v7.receiver, v7.super_class);
  objc_msgSend(v5, "pageMarginInsets");
  objc_msgSend(v6, "setLayoutMargins:");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for FlowNavigationController();
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[FlowNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_10074AFF0, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_1005AE38C;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10033F618;
  v12[3] = &unk_10074B008;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)-[FlowNavigationController topViewController](self, "topViewController");
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC22SubscribePageExtension24FlowNavigationController *v2;
  id v3;
  void *v4;
  id v5;
  id v7;
  objc_super v8;

  v2 = self;
  v3 = -[FlowNavigationController topViewController](v2, "topViewController");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "supportedInterfaceOrientations");

    return (unint64_t)v5;
  }
  else
  {
    v8.receiver = v2;
    v8.super_class = (Class)type metadata accessor for FlowNavigationController();
    v7 = -[FlowNavigationController supportedInterfaceOrientations](&v8, "supportedInterfaceOrientations");

    return (unint64_t)v7;
  }
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  _TtC22SubscribePageExtension24FlowNavigationController *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray v7;

  v4 = self;
  sub_1005AD9D0(a3);
  v6 = v5;

  if (v6)
  {
    sub_100019574(0, (unint64_t *)&qword_1007F5540, UIViewController_ptr);
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (NSArray)keyCommands
{
  _TtC22SubscribePageExtension24FlowNavigationController *v2;
  double *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1005ADC3C();

  if (v3)
  {
    sub_100019574(0, (unint64_t *)&qword_1007F8E40, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)handleBackKeyCommandWithCommand:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension24FlowNavigationController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = -[FlowNavigationController popViewControllerAnimated:](v5, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24FlowNavigationController_flowController, (uint64_t *)&unk_100808370);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension24FlowNavigationController_actionRunner));
}

@end
