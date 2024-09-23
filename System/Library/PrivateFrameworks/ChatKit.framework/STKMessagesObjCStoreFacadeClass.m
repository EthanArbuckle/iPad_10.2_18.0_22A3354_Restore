@implementation STKMessagesObjCStoreFacadeClass

Class __get_STKMessagesObjCStoreFacadeClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!StickersLibraryCore_frameworkLibrary)
    StickersLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("_STKMessagesObjCStoreFacade");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_STKMessagesObjCStoreFacadeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
