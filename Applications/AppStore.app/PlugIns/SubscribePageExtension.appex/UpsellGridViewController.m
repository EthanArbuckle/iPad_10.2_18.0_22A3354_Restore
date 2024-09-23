@implementation UpsellGridViewController

- (_TtC22SubscribePageExtension24UpsellGridViewController)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension24UpsellGridViewController *result;

  result = (_TtC22SubscribePageExtension24UpsellGridViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/UpsellGridViewController.swift", 53, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC22SubscribePageExtension24UpsellGridViewController *v2;

  v2 = self;
  if ((-[UpsellGridViewController isViewLoaded](v2, "isViewLoaded") & 1) == 0)
    -[UpsellGridViewController setView:](v2, "setView:", *(Class *)((char *)&v2->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension24UpsellGridViewController_gridView));

}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[UpsellGridViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

    dispatch thunk of BasePresenter.didLoad()(v5);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC22SubscribePageExtension24UpsellGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension24UpsellGridViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension24UpsellGridViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.UpsellGridViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension24UpsellGridViewController_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24UpsellGridViewController_gridView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension24UpsellGridViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension24UpsellGridViewController_artworkLoader));
}

@end
