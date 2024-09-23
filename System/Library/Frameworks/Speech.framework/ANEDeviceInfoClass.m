@implementation ANEDeviceInfoClass

Class __get_ANEDeviceInfoClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AppleNeuralEngineLibraryCore_frameworkLibrary)
    AppleNeuralEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("_ANEDeviceInfo");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_ANEDeviceInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
