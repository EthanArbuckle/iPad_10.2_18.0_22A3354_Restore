@implementation FigSampleCursorServer

uint64_t __FigSampleCursorServer_copyMemoryPool_block_invoke()
{
  uint64_t result;

  result = FigSimpleMutexCreate();
  FigSampleCursorServer_copyMemoryPool_sSharedMemoryPoolWeakRefMutex = result;
  return result;
}

uint64_t __FigSampleCursorServer_maximumStepsForBuildingPartialSampleTable_block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceNumberWithDefault();
  FigSampleCursorServer_maximumStepsForBuildingPartialSampleTable_maximumStepsForBuildingPartialSampleTable = result;
  return result;
}

uint64_t __FigSampleCursorServer_maximumStoragePagesForBuildingPartialSampleTable_block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceNumberWithDefault();
  FigSampleCursorServer_maximumStoragePagesForBuildingPartialSampleTable_maximumStoragePagesForBuildingPartialSampleTable = result;
  return result;
}

void __FigSampleCursorServer_TranslateFormatDescription_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

uint64_t __FigSampleCursorServer_shouldCacheMinimumUpcomingPTSInPartialSampleTable_block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceBooleanWithDefault();
  FigSampleCursorServer_shouldCacheMinimumUpcomingPTSInPartialSampleTable_shouldCacheMinimumUpcomingPTSInPartialSampleTable = result;
  return result;
}

@end
