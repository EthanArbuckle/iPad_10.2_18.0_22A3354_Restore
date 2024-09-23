@implementation GDEntityResolutionTextClientInner

- (BOOL)warmupSyncFor:(int64_t)a3 error:(id *)a4
{
  GDEntityResolutionTextClientInner *v4;

  v4 = self;
  sub_1AE4FADB4();

  return 1;
}

- (id)initFor:(int64_t)a3 warmup:(BOOL)a4 error:(id *)a5
{
  id result;

  EntityResolutionTextClient.init(for:warmup:)(a3, a4);
  return result;
}

- (void)warmupFor:(int64_t)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  GDEntityResolutionTextClientInner *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = self;
  sub_1AE62C930((uint64_t)&unk_1EED9DE30, (uint64_t)v7);
}

- (void)cooldownWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  GDEntityResolutionTextClientInner *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1AE62C930((uint64_t)&unk_1EED9DE20, v5);
}

- (BOOL)cooldownSyncAndReturnError:(id *)a3
{
  GDEntityResolutionTextClientInner *v3;

  v3 = self;
  sub_1AE6106AC();

  return 1;
}

- (void)resolveEntitiesForRequest:(GDEntityResolutionRequest *)a3 completionHandler:(id)a4
{
  sub_1AE61124C(self, (int)a2, a3, a4, (uint64_t)&unk_1E5DCE0E0, (uint64_t)&unk_1EED9DE10);
}

- (id)resolveEntitiesSyncForRequest:(id)a3 error:(id *)a4
{
  id v5;
  GDEntityResolutionTextClientInner *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = self;
  sub_1AE610D68();
  v8 = v7;

  return v8;
}

- (void)resolveEntitiesForBatchRequests:(NSArray *)a3 completionHandler:(id)a4
{
  sub_1AE61124C(self, (int)a2, a3, a4, (uint64_t)&unk_1E5DCE0B8, (uint64_t)&unk_1EED9DE00);
}

- (id)resolveEntitiesSyncForBatchRequests:(id)a3 error:(id *)a4
{
  GDEntityResolutionTextClientInner *v5;
  void *v6;

  sub_1AE53F468(0, &qword_1EED9DDF0);
  sub_1AE9261CC();
  v5 = self;
  sub_1AE61142C();
  swift_bridgeObjectRelease();

  sub_1AE53F468(0, &qword_1ED30FCA0);
  v6 = (void *)sub_1AE9261C0();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)generateMentionsForQuery:(id)a3 error:(id *)a4
{
  GDEntityResolutionTextClientInner *v5;
  void *v6;
  void *v7;

  sub_1AE925E3C();
  v5 = self;
  sub_1AE611724();
  v7 = v6;
  swift_bridgeObjectRelease();

  return v7;
}

- (id)resolveAddressToContactForRequest:(id)a3 error:(id *)a4
{
  id v5;
  GDEntityResolutionTextClientInner *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1AE6128B0(v5);

  return v7;
}

- (BOOL)recordDirectFeedbackWithEngagedIds:(id)a3 rejectedIds:(id)a4 ignoredIds:(id)a5 neverPresentedIds:(id)a6 error:(id *)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GDEntityResolutionTextClientInner *v12;

  v8 = sub_1AE9263E8();
  v9 = sub_1AE9263E8();
  v10 = sub_1AE9263E8();
  v11 = sub_1AE9263E8();
  v12 = self;
  sub_1AE612DE8(v8, v9, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (GDEntityResolutionTextClientInner)init
{
  EntityResolutionTextClient.init()();
}

- (void).cxx_destruct
{
  _s20IntelligencePlatform28InferenceServiceInstanceEnumOwxx_0((uint64_t)self + OBJC_IVAR___GDEntityResolutionTextClientInner_service);

}

@end
