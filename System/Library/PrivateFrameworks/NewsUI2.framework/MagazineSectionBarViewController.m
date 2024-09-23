@implementation MagazineSectionBarViewController

- (_TtC7NewsUI232MagazineSectionBarViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC7NewsUI232MagazineSectionBarViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_isBeingUsedAsPlugin) = 0;
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_previousSelectedIndexPath;
  v6 = sub_1D6E16178();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC7NewsUI232MagazineSectionBarViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI232MagazineSectionBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI232MagazineSectionBarViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI232MagazineSectionBarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_blueprintViewController));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_offlineProvider);
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_pluggableDelegate);
  sub_1D607F284((uint64_t)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_previousSelectedIndexPath);
}

- (void)viewDidLoad
{
  _TtC7NewsUI232MagazineSectionBarViewController *v2;

  v2 = self;
  sub_1D6AD478C();

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI232MagazineSectionBarViewController *v2;

  v2 = self;
  sub_1D6AD4B0C();

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
  -[MagazineSectionBarViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6AD5CA4();

}

- (void)startTraversingWithDirection:(int64_t)a3
{
  _TtC7NewsUI232MagazineSectionBarViewController *v3;

  v3 = self;
  sub_1D6E1E9D4();

}

- (void)deselect
{
  _TtC7NewsUI232MagazineSectionBarViewController *v2;
  id v3;

  v2 = self;
  sub_1D6E1E9BC();
  v3 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);

}

@end
