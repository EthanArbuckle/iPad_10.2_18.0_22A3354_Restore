@implementation HDMCPregnancyManager

- (_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager)initWithProfile:(id)a3 operation:(id)a4 experienceModelProvider:(id)a5 notificationProvider:(id)a6 calendarCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  char *v15;

  v12 = objc_allocWithZone((Class)swift_getObjectType());
  v13 = a3;
  v14 = a4;
  swift_unknownObjectRetain();
  v15 = HDMCPregnancyManager.init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(1, v13, a4, a5, a6, a7);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *)v15;
}

- (void)dealloc
{
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v2;

  v2 = self;
  HDMCPregnancyManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_protectedDataOperation));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_notificationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_calendarCache));
}

- (void)significantTimeChangeDidOccur
{
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v2;

  v2 = self;
  sub_219670E9C();

}

- (_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager)init
{
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *result;

  result = (_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v14;

  v10 = _Block_copy(a6);
  *(_QWORD *)(swift_allocObject() + 16) = v10;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = self;
  sub_2196721B4((void (*)(void))sub_219672ACC);

  swift_release();
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v6;

  v5 = a4;
  v6 = self;
  _s27HealthMenstrualCyclesDaemon20HDMCPregnancyManagerC12samplesAdded_6anchorySaySo8HKSampleCG_So8NSNumberCtF_0();

}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5;
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v6;

  v5 = a4;
  v6 = self;
  _s27HealthMenstrualCyclesDaemon20HDMCPregnancyManagerC7samples18ofTypesWereRemoved6anchorySaySo12HKSampleTypeCG_So8NSNumberCtF_0();

}

- (id)diagnosticDescription
{
  os_unfair_lock_s *v2;
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v3;
  void *v4;
  uint64_t v6;

  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState)
                          + 20);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_219672A90(&v6);
  os_unfair_lock_unlock(v2);

  v4 = (void *)sub_219681A48();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)getCurrentPregnancyModel
{
  uint64_t v3;
  void **v4;
  os_unfair_lock_s *v5;
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v6;
  void *v7;
  void *v9;

  swift_getObjectType();
  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedPregnancyModel);
  v4 = (void **)(v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + 24);
  v6 = self;
  os_unfair_lock_lock(v5);
  sub_219672A78(v4, &v9);
  os_unfair_lock_unlock(v5);
  v7 = v9;

  return v7;
}

- (void)registerObserver:(id)a3 isUserInitiated:(BOOL)a4
{
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v7;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = self;
  sub_219671FB8((uint64_t)a3, a4, (uint64_t)v7);
  swift_unknownObjectRelease();

}

- (void)unregisterObserver:(id)a3
{
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v5;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  sub_219672030((uint64_t)a3, (uint64_t)v5);
  swift_unknownObjectRelease();

}

- (void)experienceModelManagerDidUpdateModel
{
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v2;

  v2 = self;
  HDMCPregnancyManager.experienceModelManagerDidUpdateModel()();

}

@end
