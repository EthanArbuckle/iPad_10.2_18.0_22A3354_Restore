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
  id v10;
  _QWORD v11[6];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FlowNavigationController();
  swift_unknownObjectRetain(a4);
  v7 = v12.receiver;
  -[FlowNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_10073F0F8, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v11[4] = sub_10012D510;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1005F3AC0;
  v11[3] = &unk_10073F110;
  v9 = _Block_copy(v11);
  v10 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release().n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease();

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)-[FlowNavigationController topViewController](self, "topViewController");
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtension24FlowNavigationController *v2;
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
  _TtC20ProductPageExtension24FlowNavigationController *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray v7;

  v4 = self;
  sub_10012CB54(a3);
  v6 = v5;

  if (v6)
  {
    sub_100018B6C(0, (unint64_t *)&qword_1008081A0, UIViewController_ptr);
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
  _TtC20ProductPageExtension24FlowNavigationController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10012CDC0();

  if (v3)
  {
    sub_100018B6C(0, (unint64_t *)&qword_100808190, UIKeyCommand_ptr);
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
  _TtC20ProductPageExtension24FlowNavigationController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = -[FlowNavigationController popViewControllerAnimated:](v5, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24FlowNavigationController_flowController, (uint64_t *)&unk_100809510);
  swift_release();
}

@end
