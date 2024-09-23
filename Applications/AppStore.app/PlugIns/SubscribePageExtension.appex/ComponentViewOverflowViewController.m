@implementation ComponentViewOverflowViewController

- (_TtC22SubscribePageExtension35ComponentViewOverflowViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension35ComponentViewOverflowViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension35ComponentViewOverflowViewController_overflowTransitioning) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension35ComponentViewOverflowViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ComponentViewOverflowViewController.swift", 64, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension35ComponentViewOverflowViewController *v2;

  v2 = self;
  sub_100441384();

}

- (void)viewDidLayoutSubviews
{
  _TtC22SubscribePageExtension35ComponentViewOverflowViewController *v2;

  v2 = self;
  sub_100441934();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  -[ComponentViewOverflowViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC22SubscribePageExtension35ComponentViewOverflowViewController_scrollView], "setContentOffset:animated:", 0, 0.0, 0.0, v5.receiver, v5.super_class);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension35ComponentViewOverflowViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100441C30(a3);

}

- (NSArray)keyCommands
{
  _TtC22SubscribePageExtension35ComponentViewOverflowViewController *v2;
  double *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100442134();

  if (v3)
  {
    sub_1004426CC();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)handleDismissKeyCommandWithCommand:(id)a3
{
  -[ComponentViewOverflowViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC22SubscribePageExtension35ComponentViewOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension35ComponentViewOverflowViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension35ComponentViewOverflowViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ComponentViewOverflowViewController", 58, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35ComponentViewOverflowViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35ComponentViewOverflowViewController_stateStore));
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                                                            + OBJC_IVAR____TtC22SubscribePageExtension35ComponentViewOverflowViewController_model));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35ComponentViewOverflowViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35ComponentViewOverflowViewController_componentView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35ComponentViewOverflowViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35ComponentViewOverflowViewController_overflowTransitioning));
}

@end
