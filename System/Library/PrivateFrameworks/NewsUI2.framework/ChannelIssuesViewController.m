@implementation ChannelIssuesViewController

- (_TtC7NewsUI227ChannelIssuesViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC7NewsUI227ChannelIssuesViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_isBeingUsedAsPlugin) = 0;
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC7NewsUI227ChannelIssuesViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI227ChannelIssuesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI227ChannelIssuesViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI227ChannelIssuesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_blueprintViewController));
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_offlineAlertControllerFactory);
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelIssuesViewController_pluggableDelegate);
}

- (void)viewDidLoad
{
  _TtC7NewsUI227ChannelIssuesViewController *v2;

  v2 = self;
  sub_1D6956D6C();

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI227ChannelIssuesViewController *v2;

  v2 = self;
  sub_1D6956F14();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[ChannelIssuesViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6958080();

}

- (void)tabBarSplitViewDidChangeFocusToFocus:(int64_t)a3 action:(int64_t)a4
{
  _TtC7NewsUI227ChannelIssuesViewController *v5;

  v5 = self;
  sub_1D6958180(a3);

}

- (void)startTraversingWithDirection:(int64_t)a3
{
  _TtC7NewsUI227ChannelIssuesViewController *v3;

  v3 = self;
  sub_1D6E1E9D4();

}

- (void)deselect
{
  _TtC7NewsUI227ChannelIssuesViewController *v2;
  id v3;

  v2 = self;
  sub_1D6E1E9BC();
  v3 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);

}

@end
