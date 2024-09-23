@implementation MKPlaceViewControllerClass

Class __get_MKPlaceViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MapKitLibraryCore_frameworkLibrary)
  {
    MapKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MapKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_MKPlaceViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__get_MKPlaceViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  get_MKPlaceViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __get_MKPlaceViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_2_cold_1(v0);
}

@end
