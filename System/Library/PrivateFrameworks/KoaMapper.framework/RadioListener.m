@implementation RadioListener

- (id)updateHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = RadioListener.updateHandler.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = thunk for @escaping @callee_guaranteed (@guaranteed String) -> ();
  v6[3] = &block_descriptor_11;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setUpdateHandler:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  RadioListener *v6;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()partial apply;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  RadioListener.updateHandler.setter((uint64_t)v4, v5);

}

- (NSString)appId
{
  uint64_t v2;
  void *v3;

  v2 = RadioListener.appId.getter();
  v3 = (void *)MEMORY[0x219A1A7A0](v2);
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (RadioListener)initWithSerialQueue:(id)a3
{
  return (RadioListener *)RadioListener.init(serialQueue:)(a3);
}

- (void)dealloc
{
  RadioListener *v2;

  v2 = self;
  RadioListener.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_27_0();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectUnownedDestroy();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(*(uint64_t *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR___RadioListener_updateHandler));
}

- (void)teardownPublisherSubscriptions
{
  RadioListener *v2;

  v2 = self;
  RadioListener.teardownPublisherSubscriptions()();

}

- (void)registerUpdateHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  RadioListener *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ();
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  RadioListener.registerUpdateHandler(_:)((uint64_t)v7, v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?((uint64_t)v7);

}

- (id)radioStations
{
  RadioListener *v2;
  Class isa;

  v2 = self;
  RadioListener.radioStations()();

  type metadata accessor for KVItem(0, (unint64_t *)&lazy cache variable for type metadata for KVItem);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)donationUpdateTriggered
{
  RadioListener *v2;

  v2 = self;
  RadioListener.donationUpdateTriggered()();

}

- (RadioListener)init
{
  RadioListener.init()();
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  RadioListener *v6;

  v5 = a3;
  v6 = self;
  RadioListener.accessoryDidUpdate(_:receivedAllValues:)(v5);

}

@end
