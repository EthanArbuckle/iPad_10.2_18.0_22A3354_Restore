@implementation ICProactiveTriggerClass

Class __get_ICProactiveTriggerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  InputContextLibrary();
  result = objc_getClass("_ICProactiveTrigger");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_ICProactiveTriggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_ICProactiveTriggerClass_block_invoke_cold_1();
    return (Class)__getMCProfileConnectionClass_block_invoke(v3);
  }
  return result;
}

uint64_t __get_ICProactiveTriggerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMCProfileConnectionClass_block_invoke_cold_1(v0);
}

@end
