@implementation EditFavoritesCollectionViewController

- (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI37EditFavoritesCollectionViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI37EditFavoritesCollectionViewController____lazy_storage___searchController) = 0;
  v4 = a3;

  result = (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI37EditFavoritesCollectionViewController *v2;

  v2 = self;
  sub_1A9723E80();

}

- (void)doneButtonTapped
{
  -[EditFavoritesCollectionViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI37EditFavoritesCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A9724214(v4);

}

- (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI37EditFavoritesCollectionViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI37EditFavoritesCollectionViewController____lazy_storage___searchController));
  swift_release();
  swift_release();
}

@end
