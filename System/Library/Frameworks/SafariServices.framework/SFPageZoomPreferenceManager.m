@implementation SFPageZoomPreferenceManager

void __45___SFPageZoomPreferenceManager_sharedManager__block_invoke()
{
  _SFPageZoomPreferenceManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [_SFPageZoomPreferenceManager alloc];
  objc_msgSend(MEMORY[0x1E0D8AAE0], "sharedStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[_SFPageZoomPreferenceManager initWithPerSitePreferencesStore:](v0, "initWithPerSitePreferencesStore:", v3);
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v1;

}

uint64_t __82___SFPageZoomPreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t result;

  v2 = a2;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  if (v2)
    return objc_msgSend(MEMORY[0x1E0CB35B0], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
  return result;
}

uint64_t __79___SFPageZoomPreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t result;

  v2 = a2;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  if (v2)
    return objc_msgSend(MEMORY[0x1E0CB35B0], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
  return result;
}

uint64_t __98___SFPageZoomPreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t result;

  v2 = a2;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  if (v2)
    return objc_msgSend(MEMORY[0x1E0CB35B0], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
  return result;
}

@end
