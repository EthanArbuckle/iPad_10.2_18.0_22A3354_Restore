@implementation HealthChecklistViewController

- (_TtC18HealthExperienceUI29HealthChecklistViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI29HealthChecklistViewController *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController____lazy_storage___mainStore;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController____lazy_storage___dataSources) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI29HealthChecklistViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI29HealthChecklistViewController *v2;

  v2 = self;
  sub_1A970262C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18HealthExperienceUI29HealthChecklistViewController *v4;

  v4 = self;
  sub_1A9702780(a3);

}

- (void)dismissProfile:(id)a3
{
  _TtC18HealthExperienceUI29HealthChecklistViewController *v4;
  _TtC18HealthExperienceUI29HealthChecklistViewController *v5;
  _TtC18HealthExperienceUI29HealthChecklistViewController *v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  v5 = (_TtC18HealthExperienceUI29HealthChecklistViewController *)-[HealthChecklistViewController navigationController](v4, sel_navigationController);
  if (v5)
  {
    v6 = v5;
    -[HealthChecklistViewController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtC18HealthExperienceUI29HealthChecklistViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI29HealthChecklistViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI29HealthChecklistViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9703480((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController____lazy_storage___mainStore);
  swift_release();
  sub_1A97034D4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController_analyticsSource), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController_analyticsSource));
}

@end
