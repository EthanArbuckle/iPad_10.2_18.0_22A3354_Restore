@implementation REComponentContainsAssetReference

uint64_t __REComponentContainsAssetReference_block_invoke(uint64_t a1, re *a2)
{
  uint64_t result;
  uint64_t v5[4];
  re *v6[2];
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(re **__return_ptr))(**(_QWORD **)(a1 + 40) + 56))(v6);
  RETypeRegistryGetTypeInfoByTypeID(a2, v6[0], v6[1], v7);
  re::TypeInfo::TypeInfo((uint64_t)v5, (uint64_t)v7);
  result = re::AssetHandle::hasAssetHandle(v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
