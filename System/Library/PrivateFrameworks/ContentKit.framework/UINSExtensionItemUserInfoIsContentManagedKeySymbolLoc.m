@implementation UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc

void *__get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!UIKitLibraryCore_frameworkLibrary)
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UIKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFNSExtensionItemContentItem.m"), 26, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "_UINSExtensionItemUserInfoIsContentManagedKey");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
