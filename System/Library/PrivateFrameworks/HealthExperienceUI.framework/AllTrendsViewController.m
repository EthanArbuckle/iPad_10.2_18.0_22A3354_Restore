@implementation AllTrendsViewController

- (_TtC18HealthExperienceUI23AllTrendsViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI23AllTrendsViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI23AllTrendsViewController_cancellables) = (Class)MEMORY[0x1E0DEE9E8];
  v4 = a3;

  result = (_TtC18HealthExperienceUI23AllTrendsViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI23AllTrendsViewController *v2;

  v2 = self;
  sub_1A9995938();

}

- (void)restoreUserActivityState:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AllTrendsViewController();
  -[AllTrendsViewController restoreUserActivityState:](&v4, sel_restoreUserActivityState_, a3);
}

- (_TtC18HealthExperienceUI23AllTrendsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI23AllTrendsViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI23AllTrendsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23AllTrendsViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23AllTrendsViewController_healthExperienceStore);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
