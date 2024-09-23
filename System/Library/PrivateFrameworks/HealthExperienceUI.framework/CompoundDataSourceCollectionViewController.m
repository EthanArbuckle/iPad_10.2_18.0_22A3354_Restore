@implementation CompoundDataSourceCollectionViewController

- (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *)CompoundDataSourceCollectionViewController.init(collectionViewLayout:)(a3);
}

- (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *)CompoundDataSourceCollectionViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *v2;

  v2 = self;
  sub_1A97AF5D0();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *v4;

  v4 = self;
  sub_1A97AFE18(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CompoundDataSourceCollectionViewController();
  v4 = v6.receiver;
  v5 = -[CompoundDataSourceCollectionViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v4) + 0xE8))(v5);

}

- (void)observedTraitsDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *v8;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  sub_1A97AE664(a3, (uint64_t)v7);
  swift_unknownObjectRelease();

}

- (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *result;

  v4 = a4;
  result = (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController_dataSourceProvider, (unint64_t *)&qword_1ED27C730, &qword_1ED27C728);
  swift_release();
  swift_release();
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_1A97B0A6C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))CompoundDataSourceCollectionViewController.collectionView(_:shouldSelectItemAt:));
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_1A97B0A6C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))CompoundDataSourceCollectionViewController.collectionView(_:shouldHighlightItemAt:));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_1A9A921DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A9217C();
  v10 = a3;
  v11 = self;
  CompoundDataSourceCollectionViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = sub_1A9A921DC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A9217C();
  v11 = a3;
  v12 = self;
  v13 = (void *)_s18HealthExperienceUI42CompoundDataSourceCollectionViewControllerC010collectionH0_33contextMenuConfigurationForItemAt5pointSo09UIContextlM0CSgSo012UICollectionH0C_10Foundation9IndexPathVSo7CGPointVtF_0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  return sub_1A97B0A6C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))CompoundDataSourceCollectionViewController.collectionView(_:selectionFollowsFocusForItemAt:));
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  _TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *v21;
  uint64_t v22;
  char v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  void *v26;
  uint64_t v28;
  _TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *v29;

  v29 = self;
  v7 = sub_1A9A921DC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v28 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v28 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v28 - v18;
  sub_1A9A9217C();
  sub_1A9A9217C();
  sub_1A9A9217C();
  v20 = a3;
  v21 = v29;
  v22 = sub_1A97AE270();
  v23 = (*(uint64_t (**)(char *, char *))(*(_QWORD *)v22 + 368))(v17, v11);
  swift_release();
  if ((v23 & 1) != 0)
    v24 = v11;
  else
    v24 = v17;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v19, v24, v7);

  v25 = *(void (**)(char *, uint64_t))(v8 + 8);
  v25(v11, v7);
  v25(v14, v7);
  v25(v17, v7);
  v26 = (void *)sub_1A9A92164();
  v25(v19, v7);
  return v26;
}

@end
