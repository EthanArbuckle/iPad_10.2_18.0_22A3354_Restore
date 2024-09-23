@implementation ProfileCategoriesViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ProfileCategoriesViewController();
  v2 = v6.receiver;
  -[CompoundDataSourceCollectionViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_collectionView, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_1A97C3E88();
  }
  else
  {
    __break(1u);
  }
}

- (_TtC18HealthExperienceUI31ProfileCategoriesViewController)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI31ProfileCategoriesViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_navigationBarTitleView) = 0;

  result = (_TtC18HealthExperienceUI31ProfileCategoriesViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI31ProfileCategoriesViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1A9A05D4C((uint64_t)a3);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI31ProfileCategoriesViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A9A05FB0((uint64_t)v4);

}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI31ProfileCategoriesViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A9A06540(v4);

}

- (_TtC18HealthExperienceUI31ProfileCategoriesViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI31ProfileCategoriesViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI31ProfileCategoriesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_providedHealthExperienceStore);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_pinnedContentManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_navigationBarTitleView));
}

@end
