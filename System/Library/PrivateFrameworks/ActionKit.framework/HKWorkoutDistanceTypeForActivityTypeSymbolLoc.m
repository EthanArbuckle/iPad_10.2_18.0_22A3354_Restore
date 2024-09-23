@implementation HKWorkoutDistanceTypeForActivityTypeSymbolLoc

void *__get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!HealthKitLibraryCore_frameworkLibrary)
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)HealthKitLibraryCore_frameworkLibrary;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HealthKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFFitnessUIHelper.m"), 21, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "_HKWorkoutDistanceTypeForActivityType");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
