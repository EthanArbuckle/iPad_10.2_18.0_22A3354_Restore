@implementation GPKAccountManager

+ (GPKAccountManager)sharedInstance
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return (GPKAccountManager *)static GPKAccountManager.shared.getter();
}

- (void)fetchAllAccountHandlesAndReturnError:(id)a3
{
  GPKAccountManager *v3;
  uint64_t v4;
  void *v5;

  v5 = _Block_copy(a3);
  v3 = self;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 24) = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in GPKAccountManager.allAccountHandles(), v4);
}

- (void)fetchPreferredHandleAndReturnError:(id)a3
{
  GPKAccountManager *v3;
  uint64_t v4;
  void *v5;

  v5 = _Block_copy(a3);
  v3 = self;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 24) = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in GPKAccountManager.preferredHandle(), v4);
}

- (void)setPreferredHandle:(NSString *)a3 completionHandler:(id)a4
{
  NSString *v4;
  GPKAccountManager *v5;
  _QWORD *v6;
  void *v9;

  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in GPKAccountManager.setPreferredHandle(_:), (uint64_t)v6);
}

- (GPKAccountManager)init
{
  return (GPKAccountManager *)GPKAccountManager.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPKAccountManager_daemonMessageSender);
}

@end
