@implementation ControlCenterModuleItemManager

- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome
{
  return 1;
}

- (id)_buildItemProvidersWithoutHome
{
  uint64_t v3;
  _TtC6HomeUI30ControlCenterModuleItemManager *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B9436B60;
  v4 = self;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1B93EE9F0())
    sub_1B8E93470(MEMORY[0x1E0DEE9D8]);
  v5 = objc_allocWithZone(MEMORY[0x1E0D31848]);
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  v6 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithItems_, v6);

  *(_QWORD *)(v3 + 32) = v7;
  sub_1B93EDF64();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
  v8 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  _TtC6HomeUI30ControlCenterModuleItemManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1B8FD4BD4(v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v4;
  _TtC6HomeUI30ControlCenterModuleItemManager *v5;
  void *v6;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  v4 = sub_1B93EE0FC();
  v5 = self;
  sub_1B8FD50B8(v4);

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)_itemsToHideInSet:(id)a3
{
  uint64_t v4;
  _TtC6HomeUI30ControlCenterModuleItemManager *v5;
  void *v6;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  v4 = sub_1B93EE0FC();
  v5 = self;
  sub_1B8FD5470(v4);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  return v6;
}

- (HMHome)home
{
  void *v3;
  _TtC6HomeUI30ControlCenterModuleItemManager *v4;
  id v5;
  id v6;
  HMHome *v7;
  objc_super v9;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedDispatcher);
  v6 = objc_msgSend(v5, sel_homeManager);

  if (v6)
  {
    v9.receiver = v4;
    v9.super_class = (Class)type metadata accessor for ControlCenterModuleItemManager();
    v7 = -[HFItemManager home](&v9, sel_home);

    return v7;
  }
  else
  {

    return (HMHome *)0;
  }
}

- (void)setHome:(id)a3
{
  void *v5;
  _TtC6HomeUI30ControlCenterModuleItemManager *v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;

  v5 = (void *)objc_opt_self();
  v6 = self;
  v9 = a3;
  v7 = objc_msgSend(v5, sel_sharedDispatcher);
  v8 = objc_msgSend(v7, sel_homeManager);

  if (v8)
  {
    v10.receiver = v6;
    v10.super_class = (Class)type metadata accessor for ControlCenterModuleItemManager();
    -[HFItemManager setHome:](&v10, sel_setHome_, v9);

  }
  else
  {

  }
}

- (id)_homeFuture
{
  _TtC6HomeUI30ControlCenterModuleItemManager *v2;
  id v3;

  v2 = self;
  v3 = sub_1B8FD6624();

  return v3;
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  id v4;
  _TtC6HomeUI30ControlCenterModuleItemManager *v5;

  v4 = a3;
  v5 = self;
  sub_1B8FD6888(v4);

}

- (id)_updateResultsForItems:(id)a3 context:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC6HomeUI30ControlCenterModuleItemManager *v8;
  id v9;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  v6 = sub_1B93EE0FC();
  v7 = a4;
  v8 = self;
  v9 = sub_1B8FD765C(v6, v7);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)executionEnvironmentWillEnterForeground:(id)a3
{
  id v4;
  _TtC6HomeUI30ControlCenterModuleItemManager *v5;

  v4 = a3;
  v5 = self;
  sub_1B8FD7A60((uint64_t)v4);

}

- (void)executionEnvironmentDidEnterBackground:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC6HomeUI30ControlCenterModuleItemManager *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  objc_super v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF209130);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  sub_1B93EB81C();
  v10 = sub_1B93EB834();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 0, 1, v10);
  v11 = (uint64_t)v9 + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_lastBackgroundTime;
  swift_beginAccess();
  sub_1B8F2B7A0((uint64_t)v7, v11);
  swift_endAccess();
  v12 = (objc_class *)type metadata accessor for ControlCenterModuleItemManager();
  v14.receiver = v9;
  v14.super_class = v12;
  -[HFItemManager executionEnvironmentDidEnterBackground:](&v14, sel_executionEnvironmentDidEnterBackground_, v8);

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI30ControlCenterModuleItemManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8FD8230((uint64_t)v6, v7, (SEL *)&selRef_home_didRemoveAccessory_, (uint64_t (*)(uint64_t, id))sub_1B8FD9268);

}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI30ControlCenterModuleItemManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8FD80AC((uint64_t)v6, v7, (SEL *)&selRef_home_didRemoveMediaSystem_);

}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI30ControlCenterModuleItemManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8FD80AC((uint64_t)v6, v7, (SEL *)&selRef_home_didRemoveServiceGroup_);

}

- (void)home:(id)a3 didRemoveActionSet:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI30ControlCenterModuleItemManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8FD8230((uint64_t)v6, v7, (SEL *)&selRef_home_didRemoveActionSet_, (uint64_t (*)(uint64_t, id))sub_1B8FD99F0);

}

- (_TtC6HomeUI30ControlCenterModuleItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v5;
  _TtC6HomeUI30ControlCenterModuleItemManager *result;

  swift_unknownObjectRetain();
  v5 = a4;
  result = (_TtC6HomeUI30ControlCenterModuleItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E968A4((uint64_t)self + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_configuration, type metadata accessor for ControlCenterModuleConfiguration);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_nonEmptyConfigurationFuture));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_predictionManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_customizedItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_recommendedItemProvider));
  sub_1B8E26870((uint64_t)self + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_lastBackgroundTime, (uint64_t *)&unk_1EF209130);
}

@end
