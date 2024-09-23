@implementation REAssetManagerMeshAssetCreateFromMeshAssetDescriptorAndOptionsAsync

void __REAssetManagerMeshAssetCreateFromMeshAssetDescriptorAndOptionsAsync_block_invoke(re::MeshAsset *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  const StringID *v8;
  uint64_t v9;
  re *v10;
  uint64_t *v11;
  uint64_t v12;
  re::SkeletonAsset *v13;
  uint64_t v14;
  uint64_t *v15;
  _QWORD v16[3];
  StringID v17;
  unint64_t v18[3];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];

  v2 = *((_QWORD *)a1 + 5);
  v3 = *((_QWORD *)a1 + 6);
  v4 = re::MeshAsset::assetType(a1);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 416))(v25, v2, v3, v4, 1, 0, 0);
  if (v25[0])
    v5 = (id)(v25[0] + 8);
  v6 = *((_QWORD *)a1 + 6);
  v7 = *((_QWORD *)a1 + 9);
  if (*(_QWORD *)(v6 + 216) < v7)
  {
    re::DynamicArray<re::AssetHandle>::setCapacity((_QWORD *)(v6 + 208), v7);
    v7 = *((_QWORD *)a1 + 9);
  }
  if (v7)
  {
    v8 = (const StringID *)*((_QWORD *)a1 + 11);
    v9 = 112 * v7;
    do
    {
      re::StringID::StringID((re::StringID *)&v17, v8);
      re::FixedArray<re::StringID>::FixedArray(v18, (uint64_t)&v8[1]);
      re::FixedArray<unsigned int>::FixedArray(&v19, (uint64_t)&v8[2].var1);
      v10 = (re *)re::FixedArray<re::GenericSRT<float>>::FixedArray(&v22, (uint64_t)&v8[4]);
      v11 = re::globalAllocators(v10);
      v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v11[2] + 32))(v11[2], 248, 8);
      v13 = (re::SkeletonAsset *)re::SkeletonAsset::SkeletonAsset(v12, &v17);
      v14 = *((_QWORD *)a1 + 5);
      v15 = re::SkeletonAsset::assetType(v13);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t *, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v14 + 416))(v16, v14, v12, v15, 0, 0, 0);
      re::DynamicArray<re::AssetHandle>::add((_anonymous_namespace_ *)(*((_QWORD *)a1 + 6) + 208), (re::AssetHandle *)v16);
      re::AssetHandle::~AssetHandle((re::AssetHandle *)v16);
      if (v22)
      {
        if (v23)
        {
          (*(void (**)(void))(*(_QWORD *)v22 + 40))();
          v23 = 0;
          v24 = 0;
        }
        v22 = 0;
      }
      if (v19)
      {
        if (v20)
        {
          (*(void (**)(void))(*(_QWORD *)v19 + 40))();
          v20 = 0;
          v21 = 0;
        }
        v19 = 0;
      }
      re::FixedArray<re::StringID>::deinit(v18);
      re::StringID::destroyString((re::StringID *)&v17);
      v8 += 7;
      v9 -= 112;
    }
    while (v9);
  }
  (*(void (**)(void))(*((_QWORD *)a1 + 4) + 16))();
  re::AssetHandle::~AssetHandle((re::AssetHandle *)v25);
}

uint64_t __REAssetManagerMeshAssetCreateFromMeshAssetDescriptorAndOptionsAsync_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
