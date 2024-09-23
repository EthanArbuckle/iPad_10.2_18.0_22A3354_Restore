@implementation AppIntentsUIKitBridgeLoaderClass

Class __get_AppIntentsUIKitBridgeLoaderClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!_AppIntents_UIKitLibraryCore_frameworkLibrary)
    _AppIntents_UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("_AppIntentsUIKitBridgeLoader");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_AppIntentsUIKitBridgeLoaderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
