@implementation HMDActionSetStateObserver

- (HMDActionSetStateObserver)initWithDataSource:(id)a3 notificationRegistry:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  HMDActionSetStateObserver *v10;

  v6 = (void *)objc_opt_self();
  swift_unknownObjectRetain();
  v7 = a4;
  v8 = objc_msgSend(v6, sel_defaultCenter);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE3F170]), sel_initWithMinimumTimeInterval_maximumTimeInterval_exponentialFactor_options_, 2, 0, 15.0, 2000.0);
  type metadata accessor for ActionSetState.Observer();
  swift_allocObject();
  v10 = (HMDActionSetStateObserver *)ActionSetState.Observer.init(dataSource:notificationRegistry:notificationCenter:characteristicRetryTimer:)((uint64_t)a3, v7, v8, v9);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

- (void)stopMonitoringActionSet:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  id v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = a3;
  v10 = a3;
  swift_retain_n();
  v11 = v10;
  sub_22191760C((uint64_t)v7, (uint64_t)&unk_25573FFD0, (uint64_t)v9);
  swift_release();
  swift_release();

}

- (void)stateRegistrationsDidChangeForActionSetUUIDs:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222596678();
  v7 = sub_222596E40();
  v8 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = v7;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_22191760C((uint64_t)v6, (uint64_t)&unk_25573FFC8, (uint64_t)v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)handleActionSetAddedWithNotification:(id)a3
{
  sub_2219A904C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))ActionSetState.Observer.handleActionSetAdded(notification:));
}

- (void)handleActionSetUpdatedWithNotification:(id)a3
{
  sub_2219A904C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_2219A7C68);
}

- (void)handleWithCharacteristicsChangedNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_2225963FC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2225963D8();
  swift_retain();
  sub_2219A7F20((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)handleMediaProfileHasMediaSessionStateChangedWithNotification:(id)a3
{
  sub_2219A904C((uint64_t)self, (uint64_t)a2, a3, sub_2219A87EC);
}

- (void)handleNaturalLightingProfileStateChangedWithNotification:(id)a3
{
  sub_2219A904C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_2219A8E50);
}

- (void)currentStateForActionSetUUIDs:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_25573FFB0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25573E9C0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2219F6010((uint64_t)v9, (uint64_t)&unk_25573FFC0, (uint64_t)v14);
  swift_release();
}

- (void)timerDidFire:(id)a3
{
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  ObjectType = swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = self;
  v10[5] = ObjectType;
  swift_retain_n();
  v11 = a3;
  sub_22191760C((uint64_t)v8, (uint64_t)&unk_25573FFA0, (uint64_t)v10);
  swift_release();
  swift_release();

}

- (HMDActionSetStateObserver)init
{
  HMDActionSetStateObserver *result;

  swift_defaultActor_initialize();
  result = (HMDActionSetStateObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
