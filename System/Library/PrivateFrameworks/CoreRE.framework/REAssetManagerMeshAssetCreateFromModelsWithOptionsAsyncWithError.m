@implementation REAssetManagerMeshAssetCreateFromModelsWithOptionsAsyncWithError

void __REAssetManagerMeshAssetCreateFromModelsWithOptionsAsyncWithError_block_invoke(re::MeshAsset *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  id v5;
  _QWORD v6[3];

  v2 = *((_QWORD *)a1 + 5);
  v3 = *((_QWORD *)a1 + 6);
  v4 = re::MeshAsset::assetType(a1);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 416))(v6, v2, v3, v4, 1, 0, 0);
  if (v6[0])
    v5 = (id)(v6[0] + 8);
  (*(void (**)(void))(*((_QWORD *)a1 + 4) + 16))();
  re::AssetHandle::~AssetHandle((re::AssetHandle *)v6);
}

uint64_t __REAssetManagerMeshAssetCreateFromModelsWithOptionsAsyncWithError_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
