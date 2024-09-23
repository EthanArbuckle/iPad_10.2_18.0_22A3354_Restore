@implementation ComponentViewOverflowViewController

- (_TtC20ProductPageExtension35ComponentViewOverflowViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtension35ComponentViewOverflowViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_overflowTransitioning) = 0;
  v4 = a3;

  result = (_TtC20ProductPageExtension35ComponentViewOverflowViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ComponentViewOverflowViewController.swift", 62, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC20ProductPageExtension35ComponentViewOverflowViewController *v2;

  v2 = self;
  sub_10035C2D8();

}

- (void)viewDidLayoutSubviews
{
  _TtC20ProductPageExtension35ComponentViewOverflowViewController *v2;

  v2 = self;
  sub_10035C888();

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
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_scrollView], "setContentOffset:animated:", 0, 0.0, 0.0, v5.receiver, v5.super_class);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension35ComponentViewOverflowViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10035CE6C(a3);

}

- (NSArray)keyCommands
{
  _TtC20ProductPageExtension35ComponentViewOverflowViewController *v2;
  double *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10035D370();

  if (v3)
  {
    sub_10035DA7C();
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

- (_TtC20ProductPageExtension35ComponentViewOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension35ComponentViewOverflowViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension35ComponentViewOverflowViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.ComponentViewOverflowViewController", 56, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_model));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_componentView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_overflowTransitioning));
}

@end
