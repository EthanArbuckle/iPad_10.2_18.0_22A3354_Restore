@implementation SharedProfileOverviewViewController

- (_TtC18HealthExperienceUI35SharedProfileOverviewViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9822FC4();
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *v2;

  v2 = self;
  sub_1A9820E3C();

}

- (void)viewWillLayoutSubviews
{
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *v2;

  v2 = self;
  sub_1A98211A8();

}

- (void)backButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *v4;
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *v5;
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *v6;
  id v7;
  uint64_t v8;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  v5 = (_TtC18HealthExperienceUI35SharedProfileOverviewViewController *)-[SharedProfileOverviewViewController navigationController](v4, sel_navigationController);
  if (v5)
  {
    v6 = v5;
    v7 = -[SharedProfileOverviewViewController popViewControllerAnimated:](v5, sel_popViewControllerAnimated_, 1);

    v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1A98213E8((uint64_t)a3);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SharedProfileOverviewViewController();
  v4 = a3;
  v5 = v6.receiver;
  -[CompoundDataSourceCollectionViewController scrollViewDidScroll:](&v6, sel_scrollViewDidScroll_, v4);
  sub_1A97C7608();

}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A9821A54(v4);

}

- (_TtC18HealthExperienceUI35SharedProfileOverviewViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI35SharedProfileOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_providedHealthExperienceStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_pinnedContentManager);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_navigationBarTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_gradientColorProvider);
}

- (void)optionsButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A9822620();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)ttrButtonTapped
{
  _TtC18HealthExperienceUI35SharedProfileOverviewViewController *v2;

  v2 = self;
  SharedProfileOverviewViewController.ttrButtonTapped()();

}

@end
