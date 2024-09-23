@implementation ZL11sourceAsyncP8REEngineN9realityio6ResultINSt3

_QWORD *___ZL11sourceAsyncP8REEngineN9realityio6ResultINSt3__110shared_ptrINS1_4mtlx13NeoDataSourceEEENS1_13DetailedErrorEEEU13block_pointerFPK8__CFDataPKcEU13block_pointerFvP8REEntityP9__CFErrorE_block_invoke_16(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;

  if (!*a2)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  assetToEntity(&v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return realityio::WrappedRERef<REEntity *>::~WrappedRERef(&v4);
}

@end
