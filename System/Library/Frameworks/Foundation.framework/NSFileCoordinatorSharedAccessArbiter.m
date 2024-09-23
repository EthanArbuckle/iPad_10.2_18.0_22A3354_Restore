@implementation NSFileCoordinatorSharedAccessArbiter

uint64_t __NSFileCoordinatorSharedAccessArbiter_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  qword_1ECD0A7A8 = result;
  return result;
}

NSFileAccessArbiterProxy *__NSFileCoordinatorSharedAccessArbiter_block_invoke()
{
  qos_class_t v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  id v4;
  NSFileAccessArbiterProxy *v5;

  v0 = qos_class_main();
  v1 = dispatch_queue_attr_make_with_qos_class(0, v0, 0);
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(v1, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = dispatch_queue_create("com.apple.FileCoordination.3", v2);
  v4 = +[NSFileCoordinator _createConnectionToFileAccessArbiterForQueue:](NSFileCoordinator, "_createConnectionToFileAccessArbiterForQueue:", v3);
  objc_msgSend(v4, "setRemoteObjectInterface:", +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  objc_msgSend(v4, "setOptions:", 4096);
  v5 = -[NSFileAccessArbiterProxy initWithServer:queue:]([NSFileAccessArbiterProxy alloc], "initWithServer:queue:", v4, v3);
  objc_msgSend(v4, "resume");

  dispatch_release(v3);
  return v5;
}

@end
