@implementation AMSBagCachedValueUpdateHandlers

- (AMSBagCachedValueUpdateHandlers)init
{
  return (AMSBagCachedValueUpdateHandlers *)BagCachedValueUpdateHandlers.init()();
}

- (AMSBagCachedValueUpdateHandlers)initWithHandlerQueue:(id)a3
{
  return (AMSBagCachedValueUpdateHandlers *)BagCachedValueUpdateHandlers.init(handlerQueue:)((uint64_t)a3);
}

- (void)removeHandlerWithToken:(unint64_t)a3
{
  AMSBagCachedValueUpdateHandlers *v4;

  v4 = self;
  BagCachedValueUpdateHandlers.removeHandler(token:)(a3);

}

- (void)callHandlersUsingNewBagDictionary:(id)a3 changedKeys:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  AMSBagCachedValueUpdateHandlers *v7;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEAA1A0);
  v5 = sub_18CEC1774();
  v6 = sub_18CEC1B4C();
  v7 = self;
  BagCachedValueUpdateHandlers.callUpdateHandlers(newBagDictionary:changedKeys:)(v5, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (unint64_t)uninitializedToken
{
  return -1;
}

- (unint64_t)addHandlerWithKeys:(id)a3 initialValues:(id)a4 metricsTracker:(id)a5 handler:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  AMSBagCachedValueUpdateHandlers *v12;
  unint64_t v13;
  unint64_t v14;

  v8 = _Block_copy(a6);
  v9 = sub_18CEC1B4C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEAA1A0);
  v10 = sub_18CEC1774();
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v11 = a5;
  v12 = self;
  BagCachedValueUpdateHandlers.addHandler(keys:initialValues:metricsTracker:handler:)(v9, v10, (__n128 *)a5);
  v14 = v13;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v14;
}

- (unint64_t)addHandlerWithKeys:(id)a3 initialValues:(id)a4 handler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  AMSBagCachedValueUpdateHandlers *v9;
  unint64_t v10;
  unint64_t v11;

  v6 = _Block_copy(a5);
  v7 = sub_18CEC1B4C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEAA1A0);
  v8 = sub_18CEC1774();
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v9 = self;
  BagCachedValueUpdateHandlers.addHandler(keys:initialValues:handler:)(v7, v8);
  v11 = v10;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v11;
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_8_8();
}

@end
