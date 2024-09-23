@implementation GEORegionalResourcesVersionMigrationTask

void __145___GEORegionalResourcesVersionMigrationTask_initWithMigrator_manifestConfiguration_newTileGroup_inResourceManifest_activeScales_activeScenarios___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

uint64_t __86___GEORegionalResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63___GEORegionalResourcesVersionMigrationTask_populateTileGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "length"))
  {
    GEOCanonicalResourceNameForVersionedName(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

  }
}

@end
