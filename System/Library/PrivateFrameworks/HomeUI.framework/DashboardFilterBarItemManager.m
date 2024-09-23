@implementation DashboardFilterBarItemManager

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  _TtC6HomeUI29DashboardFilterBarItemManager *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
  sub_1B93EE0FC();
  v4 = self;
  sub_1B8E389FC();

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v5 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC6HomeUI29DashboardFilterBarItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v6;

  swift_unknownObjectRetain();
  v6 = a4;
  return (_TtC6HomeUI29DashboardFilterBarItemManager *)sub_1B8EEFA60((uint64_t)a3, a4);
}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  id v4;
  _TtC6HomeUI29DashboardFilterBarItemManager *v5;

  v4 = a3;
  v5 = self;
  sub_1B8EF0358((uint64_t)v4);

}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  _TtC6HomeUI29DashboardFilterBarItemManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1B8E6E7B8((uint64_t)v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)homeDidUpdateHomeEnergyManagerEnabled:(id)a3
{
  id v4;
  _TtC6HomeUI29DashboardFilterBarItemManager *v5;

  v4 = a3;
  v5 = self;
  sub_1B8E382D8();

}

- (void)dealloc
{
  void *v3;
  _TtC6HomeUI29DashboardFilterBarItemManager *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedInstance);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DashboardFilterBarItemManager();
  -[HFItemManager dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29DashboardFilterBarItemManager_categoryItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29DashboardFilterBarItemManager_actionSetItemProvider));
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC6HomeUI29DashboardFilterBarItemManager *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1B8EEFFF0((uint64_t)v8, (uint64_t)v9, (uint64_t)a5);

}

@end
