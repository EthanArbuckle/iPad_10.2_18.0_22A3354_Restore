@implementation WelcomeViewController

- (_TtC7NewsUI221WelcomeViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC7NewsUI221WelcomeViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_keyFrame);
  *v4 = 0;
  v4[1] = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_startedFirstAnimation) = 0;
  v5 = a3;

  result = (_TtC7NewsUI221WelcomeViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)showPrivacyText
{
  _TtC7NewsUI221WelcomeViewController *v2;

  v2 = self;
  sub_1D6C7E57C();

}

- (_TtC7NewsUI221WelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI221WelcomeViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI221WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_colorStyler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_viewProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_viewAnimator);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_sceneStateManager);
  sub_1D6C7FB2C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_keyFrame), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_keyFrame));
}

- (void)viewDidLoad
{
  _TtC7NewsUI221WelcomeViewController *v2;

  v2 = self;
  sub_1D6C7E7A0();

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI221WelcomeViewController *v2;

  v2 = self;
  sub_1D6C7E918();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI221WelcomeViewController *v4;

  v4 = self;
  sub_1D6C7EAB4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC7NewsUI221WelcomeViewController *v4;

  v4 = self;
  sub_1D6C7EF08(a3);

}

- (NSArray)keyCommands
{
  void *v2;

  if (sub_1D6C7FBD0())
  {
    sub_1D5E6F04C(0, (unint64_t *)&unk_1ED5F4200);
    v2 = (void *)sub_1D6E26D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didTapContinueButton
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _TtC7NewsUI221WelcomeViewController *v6;

  v3 = *(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_eventHandler);
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 48);
  v6 = self;
  v5(ObjectType, v3);

}

- (void)updateStyling
{
  _TtC7NewsUI221WelcomeViewController *v2;

  v2 = self;
  sub_1D6C7F64C();

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7NewsUI221WelcomeViewController *v12;
  uint64_t v14;

  v7 = sub_1D6E15BE4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D6E15B78();
  v11 = a3;
  v12 = self;
  sub_1D6C7E57C();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return 0;
}

@end
