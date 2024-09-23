@implementation CarPlayConnectionManager

- (void)dealloc
{
  CarPlayConnectionManager *v2;

  v2 = self;
  CarPlayConnectionManager.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

+ (CarPlayConnectionManager)shared
{
  return (CarPlayConnectionManager *)static CarPlayConnectionManager.shared.getter();
}

- (id)radioStore
{
  CarPlayConnectionManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)CarPlayConnectionManager.radioStore()();

  return v3;
}

- (void)registerUpdateHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  CarPlayConnectionManager *v8;

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
  CarPlayConnectionManager.registerUpdateHandler(_:)((uint64_t)v7, v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?((uint64_t)v7);

}

- (CarPlayConnectionManager)init
{
  CarPlayConnectionManager.init()();
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6;
  id v7;
  CarPlayConnectionManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CarPlayConnectionManager.carManager(_:didUpdateCurrentCar:)((uint64_t)v8, (uint64_t)a4);

}

@end
