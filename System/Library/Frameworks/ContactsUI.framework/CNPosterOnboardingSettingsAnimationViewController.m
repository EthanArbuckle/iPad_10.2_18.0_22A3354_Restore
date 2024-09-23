@implementation CNPosterOnboardingSettingsAnimationViewController

+ (void)controllerFor:(id)a3 isRTL:(BOOL)a4 windowScene:(id)a5 shouldDefaultToCleanState:(BOOL)a6 completion:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98020);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  v18 = sub_18AF4FDE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  sub_18AF4FDC4();
  v19 = a3;
  v20 = a5;
  v21 = v19;
  v22 = v20;
  swift_retain();
  v23 = sub_18AF4FDB8();
  v24 = swift_allocObject();
  v25 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v24 + 16) = v23;
  *(_QWORD *)(v24 + 24) = v25;
  *(_QWORD *)(v24 + 32) = v21;
  *(_BYTE *)(v24 + 40) = a4;
  *(_QWORD *)(v24 + 48) = v22;
  *(_BYTE *)(v24 + 56) = a6;
  *(_QWORD *)(v24 + 64) = sub_18AD5A750;
  *(_QWORD *)(v24 + 72) = v17;
  sub_18ACE3AB8((uint64_t)v15, (uint64_t)&unk_1EDF9A860, v24);
  swift_release();
  swift_release();

}

- (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_animationLayer) = 0;
  v4 = OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused;
  v5 = a3;
  *((_BYTE *)&self->super.super.super.isa + v4) = !UIAccessibilityIsVideoAutoplayEnabled();

  result = (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController *)sub_18AF50310();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  _TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController *v2;

  v2 = self;
  sub_18AD58FCC();

}

+ (BOOL)isAnimationPausable
{
  return UIAccessibilityIsReduceMotionEnabled() || !UIAccessibilityIsVideoAutoplayEnabled();
}

+ (BOOL)pausableAnimationStartingValue
{
  return !UIAccessibilityIsVideoAutoplayEnabled();
}

- (BOOL)isAnimationPaused
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAnimationPaused:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused;
  swift_beginAccess();
  *v4 = a3;
}

- (void)toggleAnimation
{
  _TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController *v2;

  v2 = self;
  sub_18AD59340();

}

- (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController *result;

  v4 = a4;
  result = (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource);
  v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource);
  v5 = *(UIViewControllerTransitioningDelegate **)((char *)&self->super._overrideTransitioningDelegate
                                                 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource);
  v6 = *(UIView **)((char *)&self->super._view
                  + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_animationLayer));
}

@end
