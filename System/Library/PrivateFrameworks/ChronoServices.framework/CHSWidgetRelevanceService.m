@implementation CHSWidgetRelevanceService

- (CHSWidgetRelevanceService)initWithOptions:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  CHSWidgetRelevanceService *v12;
  uint64_t v14;

  v5 = sub_18FBCCE24();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v10 = CHSWidgetRelevanceServiceCacheDirectory();
  sub_18FBCCDE8();

  v11 = (void *)sub_18FBCCD94();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = -[CHSWidgetRelevanceService initWithConnection:cacheURL:options:](self, sel_initWithConnection_cacheURL_options_, v9, v11, a3);

  return v12;
}

- (CHSWidgetRelevanceService)initWithConnection:(id)a3 cacheURL:(id)a4 options:(unint64_t)a5
{
  uint64_t v7;
  char *v8;
  uint64_t v10;

  sub_18FBCCE24();
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18FBCCDE8();
  return (CHSWidgetRelevanceService *)sub_18FB87C2C(a3, (uint64_t)v8, a5);
}

- (void)dealloc
{
  CHSWidgetRelevanceService *v2;

  v2 = self;
  sub_18FB88F20();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CHSWidgetRelevanceService_keybagStateProvider);
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  CHSWidgetRelevanceService *v2;

  v2 = self;
  CHSWidgetRelevanceService.invalidate()();

}

- (NSDictionary)timelineEntryRelevances
{
  CHSWidgetRelevanceService *v2;
  void *v3;

  v2 = self;
  CHSWidgetRelevanceService.timelineEntryRelevances.getter();

  sub_18FB1F254(0, &qword_1EE18B400);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE18B678);
  sub_18FB8B558((unint64_t *)&unk_1EE18B680, &qword_1EE18B400, (uint64_t)off_1E2A568E8, MEMORY[0x1E0DEFCF8]);
  v3 = (void *)sub_18FBCD040();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (NSArray)widgetRelevanceProperties
{
  CHSWidgetRelevanceService *v2;
  void *v3;

  v2 = self;
  CHSWidgetRelevanceService.widgetRelevanceProperties.getter();

  sub_18FB1F254(0, &qword_1EE1880F8);
  v3 = (void *)sub_18FBCD280();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)registerObserver:(id)a3
{
  sub_18FB89CC4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CHSWidgetRelevanceService.registerObserver(_:));
}

- (void)unregisterObserver:(id)a3
{
  sub_18FB89CC4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CHSWidgetRelevanceService.unregisterObserver(_:));
}

- (void)reloadWidgetRelevanceForExtensionIdentity:(id)a3 kind:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  CHSWidgetRelevanceService *v13;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_18FBCD0DC();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  CHSWidgetRelevanceService.reloadWidgetRelevance(for:kind:completion:)(v12, v9, (uint64_t)a4, (uint64_t)sub_18FB8B5C4, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)acquireWidgetLifetimeAssertionForWidget:(id)a3 metrics:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  CHSWidgetRelevanceService *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  CHSWidgetRelevanceService.acquireWidgetLifetimeAssertion(for:metrics:completion:)(v10, v11, (uint64_t)sub_18FB8B5BC, v9);

  swift_release();
}

- (CHSWidgetRelevanceService)init
{
  CHSWidgetRelevanceService *result;

  result = (CHSWidgetRelevanceService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CHSChronoServicesConnectionClient)_connectionClient
{
  return (CHSChronoServicesConnectionClient *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR___CHSWidgetRelevanceService_connectionClient));
}

- (void)_syncOnInternalQueue
{
  CHSWidgetRelevanceService *v2;

  v2 = self;
  sub_18FB8B160();

}

@end
