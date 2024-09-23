@implementation DebugSettingsViewController

- (_TtC20ProductPageExtension27DebugSettingsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10059D9AC();
}

- (void)viewDidLoad
{
  _TtC20ProductPageExtension27DebugSettingsViewController *v2;

  v2 = self;
  sub_10059A994();

}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC20ProductPageExtension27DebugSettingsViewController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[DebugSettingsViewController dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension27DebugSettingsViewController_objectGraph));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension27DebugSettingsViewController_settingsProviders));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension27DebugSettingsViewController_cellRegistrations));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27DebugSettingsViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27DebugSettingsViewController_userDefaults));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension27DebugSettingsViewController_debugSections));
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtension27DebugSettingsViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[DebugSettingsViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)userDefaultsDidChange:(id)a3
{
  id v4;
  _TtC20ProductPageExtension27DebugSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10059DA94();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC20ProductPageExtension27DebugSettingsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10059BE48(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC20ProductPageExtension27DebugSettingsViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10059DF3C((_BOOL8)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)dismissFrom:(id)a3
{
  -[DebugSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC20ProductPageExtension27DebugSettingsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC20ProductPageExtension27DebugSettingsViewController *result;

  v3 = a3;
  result = (_TtC20ProductPageExtension27DebugSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.DebugSettingsViewController", 48, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension27DebugSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension27DebugSettingsViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension27DebugSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.DebugSettingsViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
