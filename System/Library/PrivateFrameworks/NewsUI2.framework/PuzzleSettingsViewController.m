@implementation PuzzleSettingsViewController

- (_TtC7NewsUI228PuzzleSettingsViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC7NewsUI228PuzzleSettingsViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController____lazy_storage___dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController____lazy_storage___collectionView) = 0;
  v4 = a3;

  result = (_TtC7NewsUI228PuzzleSettingsViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI228PuzzleSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI228PuzzleSettingsViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI228PuzzleSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController_styler);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController____lazy_storage___dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController____lazy_storage___collectionView));
}

- (void)viewDidLoad
{
  _TtC7NewsUI228PuzzleSettingsViewController *v2;

  v2 = self;
  sub_1D6DF9C80();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[PuzzleSettingsViewController viewDidAppear:](&v4, sel_viewDidAppear_, v3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC7NewsUI228PuzzleSettingsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D6DFA634((uint64_t)a3);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC7NewsUI228PuzzleSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D6C97AFC();

}

@end
