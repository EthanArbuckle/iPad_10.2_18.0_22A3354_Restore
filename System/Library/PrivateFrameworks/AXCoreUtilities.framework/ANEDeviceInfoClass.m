@implementation ANEDeviceInfoClass

Class __get_ANEDeviceInfoClass_block_invoke(uint64_t a1)
{
  Class result;
  id v3;

  if (!AppleNeuralEngineLibraryCore_frameworkLibrary)
  {
    AppleNeuralEngineLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleNeuralEngineLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_ANEDeviceInfo");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = __get_ANEDeviceInfoClass_block_invoke_cold_1();
    free(v3);
  }
  get_ANEDeviceInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id __get_ANEDeviceInfoClass_block_invoke_cold_1()
{
  AXBaseSettings *v0;
  SEL v1;
  id v2;

  v0 = (AXBaseSettings *)abort_report_np();
  return -[AXBaseSettings domainNameForPreferenceKey:](v0, v1, v2);
}

@end
