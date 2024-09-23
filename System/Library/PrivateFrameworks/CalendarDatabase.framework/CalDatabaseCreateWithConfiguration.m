@implementation CalDatabaseCreateWithConfiguration

uint64_t __CalDatabaseCreateWithConfiguration_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  CDBLockingAssertionsEnabled = result;
  return result;
}

void __CalDatabaseCreateWithConfiguration_block_invoke_66(uint64_t a1)
{
  pthread_mutex_t *WeakRetained;
  pthread_mutex_t *v2;
  pthread_mutex_t *v3;
  uint64_t v4;

  WeakRetained = (pthread_mutex_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = WeakRetained + 3;
    pthread_mutex_lock(WeakRetained + 3);
    v4 = *(_QWORD *)&v2[2].__opaque[48];
    if (v4)
      (*(void (**)(void))(v4 + 16))();
    pthread_mutex_unlock(v3);
    CFRelease(v2);
  }
}

@end
