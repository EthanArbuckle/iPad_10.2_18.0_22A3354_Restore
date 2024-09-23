@implementation OnboardingViewController

- (_TtC16MagnifierSupport24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v7 = sub_22758E1E4();
  v9 = v8;
  if (a4)
  {
    a4 = (id)sub_22758E1E4();
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  v12 = a5;
  return (_TtC16MagnifierSupport24OnboardingViewController *)sub_2274B593C(v7, v9, (uint64_t)a4, v11, a5);
}

- (void)didTapStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _TtC16MagnifierSupport24OnboardingViewController *v5;
  _TtC16MagnifierSupport24OnboardingViewController *v6;

  v2 = MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport24OnboardingViewController_delegate, a2);
  if (v2)
  {
    v3 = v2;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v3;
    v5 = self;
    swift_unknownObjectRetain();
    sub_2274F1D40(0, (uint64_t)sub_2274B7040, v4);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    v6 = self;
  }
  -[OnboardingViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport24OnboardingViewController *v4;

  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport24OnboardingViewController_delegate, a2, a3))
  {
    v4 = self;
    sub_2274A6350();

    swift_unknownObjectRelease();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC16MagnifierSupport24OnboardingViewController *v7;

  v4 = MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport24OnboardingViewController_delegate, a2, a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = self;
    swift_unknownObjectRetain();
    sub_2274F1D40(0, (uint64_t)sub_2274B7034, v6);

    swift_unknownObjectRelease();
    swift_release();
  }
}

- (_TtC16MagnifierSupport24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC16MagnifierSupport24OnboardingViewController *result;

  result = (_TtC16MagnifierSupport24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC16MagnifierSupport24OnboardingViewController *result;

  v6 = a5;
  result = (_TtC16MagnifierSupport24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24OnboardingViewController_delegate);
}

@end
