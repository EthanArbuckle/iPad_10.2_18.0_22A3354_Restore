@implementation CallScreening.MainAnsweringMachine

- (BOOL)isEnabled
{
  char v2;

  swift_retain();
  v2 = CallScreening.MainAnsweringMachine.enabled.getter();
  swift_release();
  return v2 & 1;
}

- (void)openURL:(NSURL *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSURL *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  swift_retain();
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in CallScreening.MainAnsweringMachine.open(_:), (uint64_t)v7);
}

- (void)screenCallWithUUID:(NSString *)a3 manualScreening:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  NSString *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  v10 = a3;
  swift_retain();
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in CallScreening.MainAnsweringMachine.screenCall(withUUID:manualScreening:), v9);
}

@end
