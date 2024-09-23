@implementation ModuleInstanceObserver

- (_TtC15ControlCenterUI22ModuleInstanceObserver)init
{
  _TtC15ControlCenterUI22ModuleInstanceObserver *result;

  result = (_TtC15ControlCenterUI22ModuleInstanceObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

- (void)orderedEnabledModuleIdentifiersChangedForSettingsManager:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC15ControlCenterUI22ModuleInstanceObserver *v8;
  id v9;
  uint64_t v10;
  id v11;

  v5 = MEMORY[0x1D17DBD84]((char *)self + OBJC_IVAR____TtC15ControlCenterUI22ModuleInstanceObserver_moduleInstanceManager, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = a3;
    v8 = self;
    v9 = objc_msgSend(v7, sel_orderedEnabledModuleIdentifiersFromSettingsApp);
    v10 = sub_1CFBFA900();

    sub_1CFBB6674(v10);
    swift_bridgeObjectRelease();
    v11 = (id)sub_1CFBFA978();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setEnabledModuleIdentifiersFromSettingsApp_, v11);

  }
}

- (void)moduleInstancesChangedForModuleInstanceManager:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC15ControlCenterUI22ModuleInstanceObserver *v7;
  id v8;

  v5 = MEMORY[0x1D17DBD84]((char *)self + OBJC_IVAR____TtC15ControlCenterUI22ModuleInstanceObserver_pagingViewController, a2);
  if (v5)
  {
    v8 = (id)v5;
    v6 = a3;
    v7 = self;
    sub_1CFBD86DC();

  }
}

@end
