@implementation SYQuiescenceObserver

void __54___SYQuiescenceObserver_notifyOnDeallocationComplete___block_invoke(uint64_t a1)
{
  id v2;
  id *v3;

  +[_SYQuiescenceObserver sharedInstance](_SYQuiescenceObserver, "sharedInstance");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v2 = v3[3];
  objc_sync_enter(v2);
  _CleanupAllocations(v3[3]);
  objc_sync_exit(v2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
