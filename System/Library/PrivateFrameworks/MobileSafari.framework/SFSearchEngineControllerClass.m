@implementation SFSearchEngineControllerClass

Class __get_SFSearchEngineControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    SafariServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SafariServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_SFSearchEngineController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__get_SFSearchEngineControllerClass_block_invoke_cold_1();
    free(v3);
  }
  get_SFSearchEngineControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __get_SFSearchEngineControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __92__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectOfClasses_completionHandler___block_invoke_cold_1(v0);
}

@end
