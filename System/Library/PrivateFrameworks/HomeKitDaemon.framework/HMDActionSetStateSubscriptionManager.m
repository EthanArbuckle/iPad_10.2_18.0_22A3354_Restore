@implementation HMDActionSetStateSubscriptionManager

- (HMDActionSetStateSubscriptionManager)initWithDelegate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  swift_unknownObjectWeakInit();
  v4 = OBJC_IVAR___HMDActionSetStateSubscriptionManager_monitoredActionSets;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25573B488);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 16) = MEMORY[0x24BEE4B00];
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)v5;
  swift_unknownObjectWeakAssign();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ActionSetState.SubscriptionManager();
  return -[HMDActionSetStateSubscriptionManager init](&v7, sel_init);
}

- (void)startMonitoringActionSetUUID:(id)a3 observer:(id)a4
{
  sub_2219A36C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(char *, uint64_t))ActionSetState.SubscriptionManager.startMonitoring(actionSetUUID:observer:));
}

- (void)stopMonitoringActionSetUUID:(id)a3 observer:(id)a4
{
  sub_2219A36C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(char *, uint64_t))ActionSetState.SubscriptionManager.stopMonitoring(actionSetUUID:observer:));
}

- (void)stopAllMonitoringForActionSetUUID:(NSUUID *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSUUID *v15;
  HMDActionSetStateSubscriptionManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25573FC90;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25573E9C0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2219F6010((uint64_t)v9, (uint64_t)&unk_25573FFC0, (uint64_t)v14);
  swift_release();
}

- (NSArray)allMonitoredActionSets
{
  os_unfair_lock_s *v2;
  HMDActionSetStateSubscriptionManager *v3;
  uint64_t v4;
  void *v5;

  v2 = *(os_unfair_lock_s **)((char *)&self->super.super.isa
                            + OBJC_IVAR___HMDActionSetStateSubscriptionManager_monitoredActionSets);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock(v2 + 6);
  v4 = swift_bridgeObjectRetain();
  sub_221972140(v4);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v2 + 6);

  swift_release();
  sub_222596678();
  v5 = (void *)sub_222596E28();
  swift_release();
  return (NSArray *)v5;
}

- (BOOL)isMonitoringActionSet:(id)a3
{
  return sub_2219A41CC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))ActionSetState.SubscriptionManager.isMonitoringActionSet(_:));
}

- (BOOL)isActionSetOn:(id)a3
{
  return sub_2219A41CC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))ActionSetState.SubscriptionManager.isActionSetOn(_:));
}

- (void)actionSetStateDidChange:(id)a3 state:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  HMDActionSetStateSubscriptionManager *v10;
  uint64_t v11;

  v6 = sub_222596678();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222596648();
  v10 = self;
  ActionSetState.SubscriptionManager.actionSetStateDidChange(_:state:)((uint64_t)v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (HMDActionSetStateSubscriptionManager)init
{
  HMDActionSetStateSubscriptionManager *result;

  result = (HMDActionSetStateSubscriptionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22196DF04((uint64_t)self + OBJC_IVAR___HMDActionSetStateSubscriptionManager_delegate);
  swift_release();
}

@end
