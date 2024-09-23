@implementation RIOEntityUsingMaterialCreateFromMtlxURLAsyncWithFiles

uint64_t __RIOEntityUsingMaterialCreateFromMtlxURLAsyncWithFiles_block_invoke(uint64_t a1)
{
  realityio::MaterialXStandalone *v2;
  const __CFURL *v3;
  uint64_t v4;
  std::string v6[2];
  unsigned __int8 v7[48];

  v2 = *(realityio::MaterialXStandalone **)(a1 + 40);
  v3 = (const __CFURL *)(a1 + 48);
  if (*(char *)(a1 + 71) < 0)
    v3 = *(const __CFURL **)v3;
  realityio::MaterialXStandalone::makeSource(v2, v3, (uint64_t)v7);
  v4 = *(_QWORD *)(a1 + 32);
  realityio::Result<std::shared_ptr<realityio::mtlx::NeoDataSource>,realityio::DetailedError>::Result(v6, v7);
  sourceAsync(v4, (uint64_t)v6, *(void **)(a1 + 72), *(void **)(a1 + 80));
  realityio::Result<std::shared_ptr<realityio::SkeletalAnimationAggregationBuilder::SkeletalAnimationSceneDataT>,realityio::DetailedError>::~Result((uint64_t)v6);
  return realityio::Result<std::shared_ptr<realityio::SkeletalAnimationAggregationBuilder::SkeletalAnimationSceneDataT>,realityio::DetailedError>::~Result((uint64_t)v7);
}

@end
