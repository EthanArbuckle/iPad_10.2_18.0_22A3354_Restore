@implementation ZL44getCCUIAppLaunchOriginControlCenterSymbolLocv

void *___ZL44getCCUIAppLaunchOriginControlCenterSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!ControlCenterUIKitLibraryCore(char **)::frameworkLibrary)
    ControlCenterUIKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v2 = (void *)ControlCenterUIKitLibraryCore(char **)::frameworkLibrary;
  if (!ControlCenterUIKitLibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ControlCenterUIKitLibrary()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("CPSLaunchContentViewController.mm"), 41, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "CCUIAppLaunchOriginControlCenter");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getCCUIAppLaunchOriginControlCenterSymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
