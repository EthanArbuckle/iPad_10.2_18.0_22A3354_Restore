@implementation AIMLExperimentationAnalyticsManagerInternal

- (AIMLExperimentationAnalyticsManagerInternal)init
{
  return (AIMLExperimentationAnalyticsManagerInternal *)ExperimentationAnalyticsManager.init()();
}

- (void)cacheTrialExperimentsFor:(NSUUID *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSUUID *v8;
  AIMLExperimentationAnalyticsManagerInternal *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_21C28465C((uint64_t)&unk_2552545B0, (uint64_t)v7);
}

- (void)cacheTrialExperimentIdentifiersFor:(NSUUID *)a3 namespaces:(NSArray *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSUUID *v10;
  NSArray *v11;
  AIMLExperimentationAnalyticsManagerInternal *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_21C28465C((uint64_t)&unk_2552545A0, (uint64_t)v9);
}

- (void)emitTriggerFor:(NSUUID *)a3 requestID:(NSUUID *)a4 completionHandler:(id)a5
{
  sub_21C284E28(self, (int)a2, a3, a4, a5, (uint64_t)&unk_24E024AE0, (uint64_t)&unk_255254590);
}

- (void)emitTriggerFromCacheFor:(NSUUID *)a3 requestID:(NSUUID *)a4 completionHandler:(id)a5
{
  sub_21C284E28(self, (int)a2, a3, a4, a5, (uint64_t)&unk_24E024AB8, (uint64_t)&unk_255254580);
}

- (void)emitTriggerFor:(NSUUID *)a3 namespace:(NSString *)a4 requestID:(NSUUID *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSUUID *v12;
  NSString *v13;
  NSUUID *v14;
  AIMLExperimentationAnalyticsManagerInternal *v15;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_21C28465C((uint64_t)&unk_255254538, (uint64_t)v11);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_58(OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_userDefaults);
  OUTLINED_FUNCTION_58(OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_queue);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_58(OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_lock);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutRegistrationLock));
}

@end
