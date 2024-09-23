@implementation MPModelLibraryRequestPropertyFilterClass

Class __get_MPModelLibraryRequestPropertyFilterClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!MediaPlayerLibraryCore_frameworkLibrary_26)
  {
    MediaPlayerLibraryCore_frameworkLibrary_26 = _sl_dlopen();
    if (!MediaPlayerLibraryCore_frameworkLibrary_26)
    {
      abort_report_np();
LABEL_6:
      __get_MPModelLibraryRequestPropertyFilterClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("_MPModelLibraryRequestPropertyFilter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  get_MPModelLibraryRequestPropertyFilterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_MPModelLibraryRequestPropertyFilterClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_21205CCE4();
}

@end
