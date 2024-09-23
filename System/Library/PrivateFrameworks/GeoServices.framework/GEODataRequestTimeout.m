@implementation GEODataRequestTimeout

void __GEODataRequestTimeout_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *global_queue;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v0 = geo_isolater_create();
  v1 = (void *)qword_1ECDBBCE8;
  qword_1ECDBBCE8 = v0;

  _MergedGlobals_216 = _GEOConfigHasValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88);
  global_queue = (void *)geo_get_global_queue();
  _GEOConfigAddBlockListenerForKey(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88, global_queue, &__block_literal_global_199);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECDBBCF0;
  qword_1ECDBBCF0 = v3;

  if (_MergedGlobals_216)
    v5 = (uint64_t *)&off_1EDF4E258;
  else
    v5 = (uint64_t *)&off_1EDF4E248;
  v6 = *v5;
  if (_MergedGlobals_216)
    v7 = &GeoServicesConfig_RequestTypeTimeoutsForNonDefaultEnvironments;
  else
    v7 = &GeoServicesConfig_RequestTypeTimeouts;
  v8 = *v7;
  _updateTimeoutWatcherIsolated(*v7, v6);
  _loadTimeouts(v8, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1ECDBBCF8;
  qword_1ECDBBCF8 = v9;

}

void __GEODataRequestTimeout_block_invoke_2()
{
  int HasValue;
  BOOL v1;
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  HasValue = _GEOConfigHasValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  geo_isolate_sync_data();
  if (*((unsigned __int8 *)v6 + 24) != HasValue)
  {
    v1 = HasValue == 0;
    if (HasValue)
      v2 = off_1EDF4E258;
    else
      v2 = off_1EDF4E248;
    if (v1)
      v3 = GeoServicesConfig_RequestTypeTimeouts;
    else
      v3 = GeoServicesConfig_RequestTypeTimeoutsForNonDefaultEnvironments;
    _loadTimeouts(v3, (uint64_t)v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    geo_isolate_sync_data();

  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __GEODataRequestTimeout_block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = _MergedGlobals_216;
  _MergedGlobals_216 = *(_BYTE *)(result + 40);
  return result;
}

void __GEODataRequestTimeout_block_invoke_4(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_DWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  if (v2 != (_DWORD)v3 || v4 != v5)
    _updateTimeoutWatcherIsolated(v3, v5);
  objc_storeStrong((id *)&qword_1ECDBBCF8, *(id *)(a1 + 32));
}

void __GEODataRequestTimeout_block_invoke_200(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)qword_1ECDBBCF8);
}

@end
