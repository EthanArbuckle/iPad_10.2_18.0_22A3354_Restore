@implementation ProfileOverviewViewController

- (_TtC18HealthExperienceUI29ProfileOverviewViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A97C8078();
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI29ProfileOverviewViewController *v2;

  v2 = self;
  sub_1A97C4E68();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI29ProfileOverviewViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1A97C5634((uint64_t)a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ProfileOverviewViewController();
  v4 = v8.receiver;
  -[ProfileOverviewViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_navigationBar);

    objc_msgSend(v7, sel__setBackgroundOpacity_, 1.0);
    v4 = v7;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ProfileOverviewViewController();
  v4 = a3;
  v5 = v6.receiver;
  -[CompoundDataSourceCollectionViewController scrollViewDidScroll:](&v6, sel_scrollViewDidScroll_, v4);
  sub_1A97C73E0();

}

- (void)backButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI29ProfileOverviewViewController *v4;
  _TtC18HealthExperienceUI29ProfileOverviewViewController *v5;
  _TtC18HealthExperienceUI29ProfileOverviewViewController *v6;
  id v7;
  uint64_t v8;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  v5 = (_TtC18HealthExperienceUI29ProfileOverviewViewController *)-[ProfileOverviewViewController navigationController](v4, sel_navigationController);
  if (v5)
  {
    v6 = v5;
    v7 = -[ProfileOverviewViewController popViewControllerAnimated:](v5, sel_popViewControllerAnimated_, 1);

    v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI29ProfileOverviewViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A97C5BF0(v4);

}

- (_TtC18HealthExperienceUI29ProfileOverviewViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI29ProfileOverviewViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI29ProfileOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_providedHealthExperienceStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_pinnedContentManager);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_navigationBarTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_gradientColorProvider);
}

@end
