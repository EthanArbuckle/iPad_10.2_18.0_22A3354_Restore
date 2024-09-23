@implementation APBrowserRapportManagerUpdatePreferences

uint64_t __APBrowserRapportManagerUpdatePreferences_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = APBrowserRapportManager_ensurePreferencesUpdated(*(_BYTE **)(a1 + 40), 1);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
