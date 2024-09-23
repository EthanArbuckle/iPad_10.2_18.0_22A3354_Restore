@implementation SportsFavoritesViewController

- (_TtC7NewsUI229SportsFavoritesViewController)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC7NewsUI229SportsFavoritesViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_isBeingUsedAsPlugin) = 0;
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_lastComputedSize;
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_selectionProvider) = 0;
  swift_unknownObjectWeakInit();
  v6 = a3;

  result = (_TtC7NewsUI229SportsFavoritesViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI229SportsFavoritesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI229SportsFavoritesViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI229SportsFavoritesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_pluggableDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_blueprintViewController));
  swift_release();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_selectionProvider);
}

- (void)viewDidLoad
{
  _TtC7NewsUI229SportsFavoritesViewController *v2;

  v2 = self;
  sub_1D60C9178();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI229SportsFavoritesViewController *v4;

  v4 = self;
  sub_1D60C94AC(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI229SportsFavoritesViewController *v2;

  v2 = self;
  sub_1D60C9668();

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
  -[SportsFavoritesViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D60CAD30();

}

- (void)startTraversingWithDirection:(int64_t)a3
{
  _TtC7NewsUI229SportsFavoritesViewController *v3;

  v3 = self;
  sub_1D6E1E9D4();

}

@end
