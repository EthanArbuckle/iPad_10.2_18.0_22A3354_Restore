@implementation ProductPageReviewsOverflowViewController

- (_TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController *result;

  result = (_TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ProductPageReviewsOverflowViewController.swift", 69, 2, 57, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController *v2;

  v2 = self;
  sub_10055532C();

}

- (void)viewDidLayoutSubviews
{
  _TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController *v2;

  v2 = self;
  sub_100555708();

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
  -[ProductPageReviewsOverflowViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController_scrollView], "setContentOffset:animated:", 0, 0.0, 0.0, v5.receiver, v5.super_class);

}

- (NSArray)keyCommands
{
  _TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1000AC1E0();

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

- (void)handleDismissKeyCommandWithCommand:(id)a3
{
  -[ProductPageReviewsOverflowViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ProductPageReviewsOverflowViewController", 63, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController_objectGraph));
  v3 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController_itemLayoutContext;
  v4 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40ProductPageReviewsOverflowViewController_componentView));
}

@end
