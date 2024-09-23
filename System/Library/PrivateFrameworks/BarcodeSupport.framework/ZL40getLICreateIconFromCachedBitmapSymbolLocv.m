@implementation ZL40getLICreateIconFromCachedBitmapSymbolLocv

void *___ZL40getLICreateIconFromCachedBitmapSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!MobileIconsLibraryCore(char **)::frameworkLibrary)
    MobileIconsLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v2 = (void *)MobileIconsLibraryCore(char **)::frameworkLibrary;
  if (!MobileIconsLibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MobileIconsLibrary()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("BCSNotificationIcon.mm"), 30, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "LICreateIconFromCachedBitmap");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getLICreateIconFromCachedBitmapSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
