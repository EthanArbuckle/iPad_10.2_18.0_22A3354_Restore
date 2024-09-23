@implementation SportsFavoritesSyncViewController

- (void)doConfirmationAction
{
  sub_1D6794148((char *)self, (uint64_t)a2, 2, (uint64_t)sub_1D6794F7C, 0);
}

- (void)doDeferAction
{
  sub_1D6794148((char *)self, (uint64_t)a2, 3, (uint64_t)sub_1D6794F74, 1);
}

- (_TtC7NewsUI233SportsFavoritesSyncViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC7NewsUI233SportsFavoritesSyncViewController *result;

  result = (_TtC7NewsUI233SportsFavoritesSyncViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7NewsUI233SportsFavoritesSyncViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC7NewsUI233SportsFavoritesSyncViewController *result;

  v6 = a5;
  result = (_TtC7NewsUI233SportsFavoritesSyncViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_styler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_app);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_confirmationButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_deferButton));
}

- (void)viewDidLoad
{
  _TtC7NewsUI233SportsFavoritesSyncViewController *v2;

  v2 = self;
  sub_1D6794320();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_eventHandler] + 88), *(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_eventHandler] + 112));
  sub_1D6E16C04();
  __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_app], *(_QWORD *)&v4[OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_app + 24]);
  objc_msgSend((id)sub_1D6E20348(), sel_setIsActive_, 1, v5.receiver, v5.super_class);

  swift_unknownObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC7NewsUI233SportsFavoritesSyncViewController *v4;

  v4 = self;
  sub_1D6794BD0(a3);

}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  -[SportsFavoritesSyncViewController viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC7NewsUI233SportsFavoritesSyncViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D6794D10((uint64_t)a3);

}

@end
