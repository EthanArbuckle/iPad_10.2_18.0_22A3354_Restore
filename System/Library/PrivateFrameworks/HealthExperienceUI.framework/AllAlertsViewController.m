@implementation AllAlertsViewController

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = v5.receiver;
  -[CompoundDataSourceCollectionViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = sub_1A97AE270();
  swift_beginAccess();
  v4 = *(id *)(v3 + 16);
  swift_release();
  objc_msgSend(v4, sel_registerObserver_, v2);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[CompoundDataSourceCollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_1A97A1560();

}

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;

  sub_1A96185BC();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v18 - v12;
  sub_1A9A94174();
  v14 = self;
  v15 = sub_1A97AE270() + OBJC_IVAR____TtC18HealthExperienceUI27CompoundSectionedDataSource_snapshot;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v15, v7);
  swift_release();
  v16 = sub_1A9A940B4();
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v11, v7);
  if (!v16)
    -[AllAlertsViewController dismissViewControllerAnimated:completion:](v14, sel_dismissViewControllerAnimated_completion_, 1, 0);

  v17(v13, v7);
}

- (_TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController)initWithCollectionViewLayout:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController_cancellable) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[CompoundDataSourceCollectionViewController initWithCollectionViewLayout:](&v7, sel_initWithCollectionViewLayout_, a3);
}

- (_TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController_cancellable) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[CompoundDataSourceCollectionViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
