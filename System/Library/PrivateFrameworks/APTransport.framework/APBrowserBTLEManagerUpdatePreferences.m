@implementation APBrowserBTLEManagerUpdatePreferences

uint64_t __APBrowserBTLEManagerUpdatePreferences_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "ensurePreferencesUpdatedWithShouldForce:", 1);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
