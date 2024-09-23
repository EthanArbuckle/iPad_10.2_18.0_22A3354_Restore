@implementation InternalFeedItemListViewController

- (_TtC18HealthExperienceUI34InternalFeedItemListViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI34InternalFeedItemListViewController_contentKinds) = (Class)MEMORY[0x1E0DEE9D8];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InternalFeedItemListViewController();
  return -[CompoundDataSourceCollectionViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI34InternalFeedItemListViewController *v2;

  v2 = self;
  sub_1A9803FFC();

}

- (_TtC18HealthExperienceUI34InternalFeedItemListViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI34InternalFeedItemListViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI34InternalFeedItemListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
