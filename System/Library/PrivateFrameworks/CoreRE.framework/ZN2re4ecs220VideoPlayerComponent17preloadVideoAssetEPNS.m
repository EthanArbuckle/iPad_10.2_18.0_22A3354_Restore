@implementation ZN2re4ecs220VideoPlayerComponent17preloadVideoAssetEPNS

re::AssetLoadRequest **___ZN2re4ecs220VideoPlayerComponent17preloadVideoAssetEPNS_12AssetManagerE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  re::AssetLoadRequest *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  re::AssetLoadRequest **result;
  uint64_t v8;
  _BYTE v9[8];
  id v10;
  _BYTE v11[24];
  _BYTE *v12;
  re::AssetLoadRequest *v13[3];
  re::AssetLoadRequest **v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  re::AssetManager::makeLoadRequest(*(re::AssetManager **)(a1 + 40), v13);
  v2 = *(_QWORD *)(v1 + 32);
  v3 = v13[0];
  *(re::AssetLoadRequest **)(v1 + 32) = v13[0];
  v13[0] = (re::AssetLoadRequest *)v2;
  if (v2)
  {

    v3 = *(re::AssetLoadRequest **)(v1 + 32);
  }
  v13[0] = (re::AssetLoadRequest *)&unk_24ED70990;
  v13[1] = (re::AssetLoadRequest *)&__block_literal_global_27;
  v14 = v13;
  re::AssetLoadRequest::setShouldLoadAndWaitForResourceSharingClients(v3, 1, 1, (uint64_t)v9);
  if (!v9[0])

  re::AssetLoadRequest::addAsset(*(re::AssetLoadRequest::Data ***)(v1 + 32), (const re::AssetHandle *)(v1 + 40));
  v4 = *(_QWORD *)(v1 + 32);
  if (v14)
  {
    if (v14 == v13)
    {
      v12 = v11;
      (*((void (**)(re::AssetLoadRequest **, _BYTE *))v13[0] + 3))(v13, v11);
    }
    else
    {
      v12 = (_BYTE *)(*((uint64_t (**)(void))*v14 + 2))();
    }
  }
  else
  {
    v12 = 0;
  }
  re::AssetLoadRequest::setCompletionHandler(v4, (uint64_t)v11, 0);
  v5 = v12;
  if (v12 == v11)
  {
    v6 = 4;
    v5 = v11;
  }
  else
  {
    if (!v12)
      goto LABEL_15;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_15:
  result = v14;
  if (v14 == v13)
  {
    v8 = 4;
    result = v13;
  }
  else
  {
    if (!v14)
      return result;
    v8 = 5;
  }
  return (re::AssetLoadRequest **)(*((uint64_t (**)(void))*result + v8))();
}

@end
