@implementation GEOURLManifestListener

void __41___GEOURLManifestListener_sharedListener__block_invoke()
{
  _GEOURLManifestListener *v0;
  void *v1;

  v0 = objc_alloc_init(_GEOURLManifestListener);
  v1 = (void *)qword_1ECDBC728;
  qword_1ECDBC728 = (uint64_t)v0;

}

uint64_t __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = GEOConfigGetBOOL(GeoServicesConfig_ShouldUpdateResourceManifestAtLaunch, (uint64_t)off_1EDF4E848);
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

void __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeServerConnection");

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "_finish:", a2 == 0);
}

uint64_t __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_finish:", 0);
}

@end
