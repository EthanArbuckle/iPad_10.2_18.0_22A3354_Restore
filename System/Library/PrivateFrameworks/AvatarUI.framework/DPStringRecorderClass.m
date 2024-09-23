@implementation DPStringRecorderClass

Class __get_DPStringRecorderClass_block_invoke(uint64_t a1)
{
  Class result;

  DifferentialPrivacyLibrary();
  result = objc_getClass("_DPStringRecorder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DPStringRecorderClass_block_invoke_cold_1();
  get_DPStringRecorderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DPStringRecorderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __get_DPNumericDataRecorderClass_block_invoke_cold_1(v0);
}

@end
