@implementation MagazineSectionsViewController

- (_TtC7NewsUI230MagazineSectionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D63D83E8();
}

- (_TtC7NewsUI230MagazineSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI230MagazineSectionsViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI230MagazineSectionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_barCompressionManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_sectionViewControllerFactory);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super._responderFlags
                     + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_currentSection));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_currentViewController));
  sub_1D63D6920(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_presentation), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_presentation), *((_BYTE *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_presentation), *((_BYTE *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_presentation+ 1));
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI230MagazineSectionsViewController *v2;

  v2 = self;
  sub_1D63D5A44();

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI230MagazineSectionsViewController *v2;

  v2 = self;
  sub_1D63D62A4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  _QWORD *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[MagazineSectionsViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  sub_1D6E19EA4();
  v5 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_eventHandler]
                            + 32)
                + OBJC_IVAR____TtC7NewsUI226MagazineSectionsInteractor_magazinesBadgingCoordinator);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1D61D829C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC7NewsUI230MagazineSectionsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D63D6554((uint64_t)a3);

}

- (void)viewSafeAreaInsetsDidChange
{
  _TtC7NewsUI230MagazineSectionsViewController *v2;

  v2 = self;
  sub_1D63D6760();

}

- (void)didReceiveMemoryWarning
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[MagazineSectionsViewController didReceiveMemoryWarning](&v3, sel_didReceiveMemoryWarning);
  sub_1D6E1AE64();

}

@end
