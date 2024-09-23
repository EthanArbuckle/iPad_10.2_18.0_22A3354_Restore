@implementation PersonalizationTransparencyPageViewController

- (_TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController_overlayViewController) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/PersonalizationTransparencyPagesViewController.swift", 75, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  v3 = -[PersonalizationTransparencyPageViewController viewDidLoad](&v4, "viewDidLoad");
  dispatch thunk of BasePresenter.didLoad()(v3);

}

- (_TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.PersonalizationTransparencyPageViewController", 68, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension45PersonalizationTransparencyPageViewController_overlayViewController));
}

@end
