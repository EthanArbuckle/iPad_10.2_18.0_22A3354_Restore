@implementation SFBrowserWindowSettings

uint64_t __60___SFBrowserWindowSettings_validateWindowSettingsWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
}

void __36___SFBrowserWindowSettings_settings__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedSettingsInstance;
  sharedSettingsInstance = (uint64_t)v1;

}

void __65___SFBrowserWindowSettings__initializeSettingsDictionaryIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __39___SFBrowserWindowSettings_synchronize__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_synchronizeNow");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return result;
}

@end
