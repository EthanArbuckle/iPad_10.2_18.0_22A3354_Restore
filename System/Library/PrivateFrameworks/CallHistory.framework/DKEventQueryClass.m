@implementation DKEventQueryClass

void __get_DKEventQueryClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_DKEventQuery");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKEventQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_DKEventQueryClass_block_invoke_cold_1();
    CoreDuetLibrary();
  }
}

uint64_t __get_DKEventQueryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_DKSystemEventStreamsClass_block_invoke_cold_1(v0);
}

@end
