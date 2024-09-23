@implementation REAssetManagerPreloadVideoAssetOnce

void __REAssetManagerPreloadVideoAssetOnce_block_invoke(uint64_t a1)
{
  re::AssetLoadRequest *AssetRequest;
  void *v3;
  _QWORD v4[5];
  _BYTE v5[24];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 931) = *(_BYTE *)(a1 + 80);
  re::AssetHandle::AssetHandle((re::AssetHandle *)v5, (const re::AssetHandle *)(a1 + 40));
  re::AssetHandle::payloadDidChangeIfPossible((re::AssetHandle *)v5);
  AssetRequest = REAssetManagerCreateAssetRequest(*(re::AssetManager **)(a1 + 64));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __REAssetManagerPreloadVideoAssetOnce_block_invoke_2;
  v4[3] = &__block_descriptor_40_e8_v12__0B8l;
  v4[4] = AssetRequest;
  v3 = _Block_copy(v4);
  REAssetLoadRequestSetLoadAndWaitForResourceSharingClients(AssetRequest, 1, 1, 0);
  REAssetLoadRequestAddAsset((re::AssetLoadRequest::Data **)AssetRequest, *(_QWORD *)(a1 + 72));
  REAssetLoadRequestSetCompletionHandler((uint64_t)AssetRequest, v3);

  re::AssetHandle::~AssetHandle((re::AssetHandle *)v5);
}

void __REAssetManagerPreloadVideoAssetOnce_block_invoke_2(re *a1, int a2)
{
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v4 = *re::videoLogObjects(a1);
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224FE9000, v4, OS_LOG_TYPE_DEFAULT, "[REAssetManagerPreloadVideoAsset] Completed preloading video asset load request", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_224FE9000, v4, OS_LOG_TYPE_ERROR, "[REAssetManagerPreloadVideoAsset] Failed to create an asset load request", v5, 2u);
  }

}

@end
