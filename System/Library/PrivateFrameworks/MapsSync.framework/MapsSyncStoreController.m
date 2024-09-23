@implementation MapsSyncStoreController

- (NSArray)storeSubscriptionTypes
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB660);
  v2 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB660);
  v4 = sub_1A423C1C4();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync23MapsSyncStoreController_storeSubscriptionTypes);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC8MapsSync23MapsSyncStoreController)initWithConfig:(id)a3 notifyForChanges:(id)a4 callbackQueue:(id)a5 delegate:(id)a6
{
  uint64_t v9;
  id v10;
  id v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB660);
  v9 = sub_1A423C1C4();
  v10 = a3;
  v11 = a5;
  swift_unknownObjectRetain();
  return (_TtC8MapsSync23MapsSyncStoreController *)MapsSyncStoreController.init(config:notifyForChanges:callbackQueue:delegate:)(v10, v9, a5, (uint64_t)a6);
}

- (_TtC8MapsSync23MapsSyncStoreController)initWithNotifyForChanges:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  _TtC8MapsSync23MapsSyncStoreController *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB660);
  sub_1A423C1C4();
  swift_unknownObjectRetain();
  v6 = _s8MapsSync0aB11StoreConfigC07defaultcD0ACvgZ_0();
  v7 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  v8 = -[MapsSyncStoreController initWithConfig:notifyForChanges:callbackQueue:delegate:](self, sel_initWithConfig_notifyForChanges_callbackQueue_delegate_, v6, v7, 0, a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v4;
  _TtC8MapsSync23MapsSyncStoreController *v5;

  v4 = sub_1A423C1C4();
  v5 = self;
  sub_1A4140B34(v4);

  swift_bridgeObjectRelease();
}

- (_TtC8MapsSync23MapsSyncStoreController)init
{
  _TtC8MapsSync23MapsSyncStoreController *result;

  result = (_TtC8MapsSync23MapsSyncStoreController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1A41112A4((uint64_t)self + OBJC_IVAR____TtC8MapsSync23MapsSyncStoreController__delegate);
}

@end
