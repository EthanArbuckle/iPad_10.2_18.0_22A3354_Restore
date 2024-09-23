@implementation EXRunningUIViewServiceExtensionClass

void __get_EXRunningUIViewServiceExtensionClass_block_invoke(uint64_t a1)
{
  ExtensionKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_EXRunningUIViewServiceExtension");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_EXRunningUIViewServiceExtensionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_EXRunningUIViewServiceExtensionClass_block_invoke_cold_1();
    ExtensionKitLibrary();
  }
}

uint64_t __get_EXRunningUIViewServiceExtensionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_EXRunningUIKitSceneHostedExtensionClass_block_invoke_cold_1(v0);
}

@end
