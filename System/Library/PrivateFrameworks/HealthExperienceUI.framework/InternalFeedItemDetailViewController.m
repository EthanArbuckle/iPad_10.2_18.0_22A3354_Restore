@implementation InternalFeedItemDetailViewController

- (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI36InternalFeedItemDetailViewController *result;

  result = (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI36InternalFeedItemDetailViewController *v2;

  v2 = self;
  sub_1A96A65F0();

}

- (void)didTapDone:(id)a3
{
  _TtC18HealthExperienceUI36InternalFeedItemDetailViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  -[InternalFeedItemDetailViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI36InternalFeedItemDetailViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36InternalFeedItemDetailViewController_feedItem));
}

@end
