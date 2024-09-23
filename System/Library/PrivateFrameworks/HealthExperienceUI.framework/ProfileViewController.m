@implementation ProfileViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (_TtC18HealthExperienceUI21ProfileViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI21ProfileViewController *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_restorationRowToLoad;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = -1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_navigationBarTitleView) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI21ProfileViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI21ProfileViewController *v2;

  v2 = self;
  sub_1A999DB20();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18HealthExperienceUI21ProfileViewController *v4;

  v4 = self;
  sub_1A999DFA0(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI21ProfileViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1A999E228((uint64_t)a3);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI21ProfileViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A999E48C((uint64_t)v4);

}

- (void)dismissProfile:(id)a3
{
  _TtC18HealthExperienceUI21ProfileViewController *v4;
  _TtC18HealthExperienceUI21ProfileViewController *v5;
  _TtC18HealthExperienceUI21ProfileViewController *v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  v5 = (_TtC18HealthExperienceUI21ProfileViewController *)-[ProfileViewController navigationController](v4, sel_navigationController);
  if (v5)
  {
    v6 = v5;
    -[ProfileViewController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtC18HealthExperienceUI21ProfileViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI21ProfileViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI21ProfileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A999F3B4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_restorationRowToLoad), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_restorationRowToLoad), *((_BYTE *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_restorationRowToLoad));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_pinnedContentManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_navigationBarTitleView));
}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI21ProfileViewController *v5;

  v4 = a3;
  v5 = self;
  ProfileViewController.restoreUserActivityState(_:)((NSUserActivity)v4);

}

@end
