@implementation GEOIsFeatureActive

void __GEOIsFeatureActive_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id global_queue;

  v0 = geo_isolater_create();
  v1 = (void *)_MergedGlobals_322;
  _MergedGlobals_322 = v0;

  geo_isolate_sync();
  global_queue = (id)geo_get_global_queue();
  _GEOConfigAddBlockListenerForKey(MapsFeaturesConfig_RemoteFeatureFlags, (uint64_t)off_1EDF4AF38, global_queue, &__block_literal_global_13);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECDBCAC0;
  qword_1ECDBCAC0 = v2;

}

void __GEOIsFeatureActive_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  _getValue(MapsFeaturesConfig_RemoteFeatureFlags, (uint64_t)off_1EDF4AF38, 1, 0, 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GEOIsFeatureActive_remoteFeatureFlags;
  GEOIsFeatureActive_remoteFeatureFlags = v0;

}

uint64_t __GEOIsFeatureActive_block_invoke_3()
{
  return geo_isolate_sync();
}

void __GEOIsFeatureActive_block_invoke_4()
{
  uint64_t v0;
  void *v1;

  _getValue(MapsFeaturesConfig_RemoteFeatureFlags, (uint64_t)off_1EDF4AF38, 1, 0, 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GEOIsFeatureActive_remoteFeatureFlags;
  GEOIsFeatureActive_remoteFeatureFlags = v0;

}

uint64_t __GEOIsFeatureActive_block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)GEOIsFeatureActive_remoteFeatureFlags, "containsObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
