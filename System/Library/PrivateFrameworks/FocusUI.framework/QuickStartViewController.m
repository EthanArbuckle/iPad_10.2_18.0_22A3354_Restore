@implementation QuickStartViewController

- (_TtP7FocusUI32QuickStartViewControllerDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_delegate;
  swift_beginAccess();
  return (_TtP7FocusUI32QuickStartViewControllerDelegate_ *)(id)MEMORY[0x2199D5180](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC7FocusUI24QuickStartViewController)initWithModeIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  objc_super v9;

  v4 = sub_214794834();
  v6 = v5;
  swift_unknownObjectWeakInit();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_modeIdentifier);
  *v7 = v4;
  v7[1] = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for QuickStartViewController();
  return -[QuickStartViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC7FocusUI24QuickStartViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC7FocusUI24QuickStartViewController *result;

  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC7FocusUI24QuickStartViewController *)sub_214794858();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7FocusUI24QuickStartViewController *v2;

  v2 = self;
  QuickStartViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7FocusUI24QuickStartViewController *v4;

  v4 = self;
  QuickStartViewController.viewWillAppear(_:)(a3);

}

- (void)handleTap:(id)a3
{
  -[QuickStartViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC7FocusUI24QuickStartViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7FocusUI24QuickStartViewController *result;

  v4 = a4;
  result = (_TtC7FocusUI24QuickStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2147923F4((uint64_t)self + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_delegate);
  swift_bridgeObjectRelease();
}

@end
