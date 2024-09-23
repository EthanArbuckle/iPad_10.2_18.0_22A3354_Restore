@implementation DPNumericDataRecorderClass

Class __get_DPNumericDataRecorderClass_block_invoke(uint64_t a1)
{
  Class result;

  DifferentialPrivacyLibrary();
  result = objc_getClass("_DPNumericDataRecorder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DPNumericDataRecorderClass_block_invoke_cold_1();
  get_DPNumericDataRecorderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DPNumericDataRecorderClass_block_invoke_cold_1()
{
  abort_report_np();
  AVTAvatarKitSnapshotVersionNumber();
}

@end
