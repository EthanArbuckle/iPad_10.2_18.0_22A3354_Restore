@implementation LinkAcceleratorViewController

- (_TtC11NotesEditor29LinkAcceleratorViewController)init
{
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  objc_super v11;

  v3 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_acceleratorView;
  v4 = sub_1DD9D0E38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_linkAcceleratorController) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_didSelectNoteLinkCompletion);
  *v5 = 0;
  v5[1] = 0;
  v6 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSuggestionContainer;
  v7 = sub_1DD9D1030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSelection;
  v9 = sub_1DD9D094C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LinkAcceleratorViewController();
  return -[LinkAcceleratorViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC11NotesEditor29LinkAcceleratorViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC11NotesEditor29LinkAcceleratorViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_acceleratorView;
  v6 = sub_1DD9D0E38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_linkAcceleratorController) = 0;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_didSelectNoteLinkCompletion);
  *v7 = 0;
  v7[1] = 0;
  v8 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSuggestionContainer;
  v9 = sub_1DD9D1030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSelection;
  v11 = sub_1DD9D094C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = a3;

  result = (_TtC11NotesEditor29LinkAcceleratorViewController *)sub_1DD9D2CEC();
  __break(1u);
  return result;
}

- (_TtC11NotesEditor29LinkAcceleratorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11NotesEditor29LinkAcceleratorViewController *result;

  v4 = a4;
  result = (_TtC11NotesEditor29LinkAcceleratorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DD8FF244((uint64_t)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_acceleratorView, &qword_1F03FA320);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_linkAcceleratorController));
  sub_1DD8FE450(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_didSelectNoteLinkCompletion));
  sub_1DD8FF244((uint64_t)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSuggestionContainer, &qword_1F03F78F0);
  sub_1DD8FF244((uint64_t)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSelection, &qword_1F03F7938);
}

@end
