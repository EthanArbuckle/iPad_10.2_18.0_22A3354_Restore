@implementation DaemonService

- (void)sendMessageWith:(NSData *)a3 completionHandler:(id)a4
{
  NSData *v4;
  _QWORD *v5;
  void *v8;

  v4 = a3;
  v8 = _Block_copy(a4);
  swift_retain();
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a3;
  v5[3] = v8;
  v5[4] = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in DaemonService.sendMessage(with:), (uint64_t)v5);
}

- (void)sendMessageAndWaitForReplyWith:(id)a3 completion:(id)a4
{
  id v4;
  unint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a3;
  v7 = _Block_copy(a4);
  swift_retain();
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  DaemonService.sendMessageAndWaitForReply(with:completion:)(v9, v10, (void (*)(uint64_t, unint64_t))partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> (), v8);
  swift_release();
  outlined consume of Data._Representation(v9, v10);

  swift_release();
}

@end
