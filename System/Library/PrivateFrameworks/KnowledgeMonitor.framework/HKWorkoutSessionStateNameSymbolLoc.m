@implementation HKWorkoutSessionStateNameSymbolLoc

void *__get_HKWorkoutSessionStateNameSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (HealthKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)HealthKitLibraryCore_frameworkLibrary;
  }
  else
  {
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)HealthKitLibraryCore_frameworkLibrary;
    if (!HealthKitLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "_HKWorkoutSessionStateName");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_HKWorkoutSessionStateNameSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
