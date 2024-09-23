@implementation ABCCreateAddressBookWithDatabaseDirectoryAndForceInProcessMigrationInProcessLinkingAndResetSortKeys

uint64_t __ABCCreateAddressBookWithDatabaseDirectoryAndForceInProcessMigrationInProcessLinkingAndResetSortKeys_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 280));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 272);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v2 = *(_QWORD *)(a1 + 32);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(v2 + 280));
}

@end
