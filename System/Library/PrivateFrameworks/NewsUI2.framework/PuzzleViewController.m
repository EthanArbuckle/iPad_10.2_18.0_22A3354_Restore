@implementation PuzzleViewController

- (_TtC7NewsUI220PuzzleViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6C4CB48();
}

- (_TtC7NewsUI220PuzzleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI220PuzzleViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI220PuzzleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_styler);
  swift_unknownObjectRelease();
  sub_1D5E8D20C((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_puzzleModel, (uint64_t (*)(_QWORD))type metadata accessor for PuzzleModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_puzzleViewConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_puzzleEmbedViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_hardPaywallViewController));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_historyService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_puzzleNavigationBarThemeProvider);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_publisherLogoProvider);
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_currentAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_publisherLogo));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_paywall;
  v4 = sub_1D6E1BEF0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D5F377D4((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_currentPuzzleColorTheme, (uint64_t)&unk_1EFFE8680, (uint64_t)MEMORY[0x1E0D5DE10], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D5E847C4);
  swift_bridgeObjectRelease();
  sub_1D5F377D4((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController____lazy_storage___radarBarButtonItem, (uint64_t)&qword_1F0002218, (uint64_t)MEMORY[0x1E0D5E698], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D5E847C4);
  sub_1D65AA4C4(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC7NewsUI220PuzzleViewController____lazy_storage___markerBarButtonItem));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_onboardingManager);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
  sub_1D5FAE038(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_embedDidLoadCompletion));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_transitionEffectView));
  swift_release();

}

- (void)viewDidLoad
{
  _TtC7NewsUI220PuzzleViewController *v2;

  v2 = self;
  sub_1D6C448E0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI220PuzzleViewController *v4;

  v4 = self;
  sub_1D6C44C74(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI220PuzzleViewController *v4;

  v4 = self;
  sub_1D6C457C8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC7NewsUI220PuzzleViewController *v4;

  v4 = self;
  sub_1D6C45E44(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC7NewsUI220PuzzleViewController *v4;

  v4 = self;
  sub_1D6C462EC(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI220PuzzleViewController *v2;

  v2 = self;
  sub_1D6C4659C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC7NewsUI220PuzzleViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D6C467B8(a3);

}

- (void)modalHostViewDidAppear
{
  _TtC7NewsUI220PuzzleViewController *v2;

  v2 = self;
  sub_1D6C47C6C(0);

}

- (void)modalHostViewDidDisappear
{
  id v2;
  _TtC7NewsUI220PuzzleViewController *v3;

  v3 = self;
  v2 = -[PuzzleViewController presentedViewController](v3, sel_presentedViewController);

  if (!v2)
  {
    sub_1D6C47C6C(1);
    sub_1D6C477B8();
  }

}

- (void)tabBarSplitViewDidChangeCollapseStateToCollapseState:(BOOL)a3
{
  _TtC7NewsUI220PuzzleViewController *v3;

  v3 = self;
  sub_1D6C4ADA0();
  sub_1D6E1A150();

}

- (void)tabBarSplitViewWillChangeDisplayModeToDisplayMode:(int64_t)a3
{
  _TtC7NewsUI220PuzzleViewController *v3;

  v3 = self;
  sub_1D6C4ADA0();

}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  _TtC7NewsUI220PuzzleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D6C4D354();

}

@end
