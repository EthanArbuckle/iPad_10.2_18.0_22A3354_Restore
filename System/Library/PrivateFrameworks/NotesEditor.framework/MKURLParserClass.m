@implementation MKURLParserClass

Class __get_MKURLParserClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MapKitLibraryCore_frameworkLibrary_0)
  {
    MapKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!MapKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_MKURLParser");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__get_MKURLParserClass_block_invoke_cold_1();
    free(v3);
  }
  get_MKURLParserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __get_MKURLParserClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[ICTK2TodoTextAttachmentViewProvider didPressTodoButton:].cold.1(v0);
}

@end
