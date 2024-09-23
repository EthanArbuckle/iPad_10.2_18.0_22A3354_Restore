@implementation BrowseSearchViewController

- (_TtC18HealthExperienceUI26BrowseSearchViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI26BrowseSearchViewController *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController____lazy_storage___searchController) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI26BrowseSearchViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI26BrowseSearchViewController *v2;

  v2 = self;
  sub_1A99894C8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18HealthExperienceUI26BrowseSearchViewController *v4;

  v4 = self;
  sub_1A9989798(a3);

}

- (void)willDismissSearchController:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC18HealthExperienceUI26BrowseSearchViewController *v9;

  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF41CA2C](v5))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 48);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)willPresentSearchController:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC18HealthExperienceUI26BrowseSearchViewController *v9;

  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF41CA2C](v5))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 40);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI26BrowseSearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A998B078(v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI26BrowseSearchViewController *v11;
  void *v12;
  objc_class *v13;
  char *v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  objc_super v18;

  v6 = sub_1A9A921DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A9217C();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1A9A92164();
  v13 = (objc_class *)type metadata accessor for BrowseSearchViewController();
  v18.receiver = v11;
  v18.super_class = v13;
  -[CompoundDataSourceCollectionViewController collectionView:didSelectItemAtIndexPath:](&v18, sel_collectionView_didSelectItemAtIndexPath_, v10, v12);

  v14 = (char *)v11 + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF41CA2C](v14))
  {
    v15 = *((_QWORD *)v14 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v15 + 56))(ObjectType, v15);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18HealthExperienceUI26BrowseSearchViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI26BrowseSearchViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI26BrowseSearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_healthExperienceStore);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_resultsBeforeHealthRecordsDataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_resultsAfterHealthRecordsDataSource));
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController____lazy_storage___searchController));
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t ObjectType;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v13;
  _TtC18HealthExperienceUI26BrowseSearchViewController *v14;

  v6 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  v8 = v7;
  v9 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF41CA2C](v9))
  {
    v10 = *((_QWORD *)v9 + 1);
    ObjectType = swift_getObjectType();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 32);
    v13 = a3;
    v14 = self;
    v12(v6, v8, ObjectType, v10);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

@end
