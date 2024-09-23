@implementation MKResultView

uint64_t __34___MKResultView_setShowsDistance___block_invoke(uint64_t result)
{
  uint64_t v1;
  MKLocationManager *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 449))
  {
    v1 = result;
    v2 = objc_alloc_init(MKLocationManager);
    v3 = *(_QWORD *)(v1 + 32);
    v4 = *(void **)(v3 + 464);
    *(_QWORD *)(v3 + 464) = v2;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/CoreParsec.framework"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 464), "setEffectiveBundle:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 464), "setDistanceFilter:", 100.0);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 464), "setDesiredAccuracy:", *MEMORY[0x1E0C9E4A8]);
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 464), "startLocationUpdateWithObserver:");
  }
  return result;
}

@end
