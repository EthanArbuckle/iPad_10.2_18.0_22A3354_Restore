@implementation CalStoreDelegateToggled

void ___CalStoreDelegateToggled_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("delegateDataCleanupQueue", 0);
  v1 = (void *)_CalStoreDelegateToggled_delegateDataCleanupQueue;
  _CalStoreDelegateToggled_delegateDataCleanupQueue = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)_CalStoreDelegateToggled_storeIDsPendingCleanup;
  _CalStoreDelegateToggled_storeIDsPendingCleanup = v2;

}

void ___CalStoreDelegateToggled_block_invoke_2(uint64_t a1)
{
  id obj;

  obj = (id)_CalStoreDelegateToggled_storeIDsPendingCleanup;
  objc_sync_enter(obj);
  if (objc_msgSend((id)_CalStoreDelegateToggled_storeIDsPendingCleanup, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend((id)_CalStoreDelegateToggled_storeIDsPendingCleanup, "removeObject:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(obj);

    objc_msgSend(*(id *)(a1 + 32), "intValue");
    _CalStoreDeleteDisabledDelegateData();
  }
  else
  {
    objc_sync_exit(obj);

  }
}

@end
