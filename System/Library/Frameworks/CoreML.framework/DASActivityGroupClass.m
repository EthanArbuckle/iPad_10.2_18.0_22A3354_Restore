@implementation DASActivityGroupClass

void __get_DASActivityGroupClass_block_invoke(uint64_t a1)
{
  uint64_t v2;

  DuetActivitySchedulerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_DASActivityGroup");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DASActivityGroupClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = abort_report_np();
    __get_DASSchedulerClass_block_invoke(v2);
  }
}

@end
