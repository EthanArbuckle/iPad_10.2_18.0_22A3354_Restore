@implementation FAFamilyCircleRequestConnectionProvider

void __58___FAFamilyCircleRequestConnectionProvider_sharedInstance__block_invoke()
{
  _FAFamilyCircleRequestConnectionProvider *v0;
  void *v1;

  v0 = objc_alloc_init(_FAFamilyCircleRequestConnectionProvider);
  v1 = (void *)sharedInstance_sProvider;
  sharedInstance_sProvider = (uint64_t)v0;

}

void __88___FAFamilyCircleRequestConnectionProvider_createResumedConnectionWithFactory_provider___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "connectionWasInterrupted:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __88___FAFamilyCircleRequestConnectionProvider_createResumedConnectionWithFactory_provider___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "connectionWasInvalidated:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

@end
