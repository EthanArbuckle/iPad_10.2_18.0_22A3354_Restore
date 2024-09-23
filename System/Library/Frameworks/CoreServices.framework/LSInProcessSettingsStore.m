@implementation LSInProcessSettingsStore

uint64_t __57___LSInProcessSettingsStore_userElectionForExtensionKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_internalQueue_selectUserElectionForIdentifier:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __33___LSInProcessSettingsStore_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_internalQueue_purgeDatabase");

}

@end
