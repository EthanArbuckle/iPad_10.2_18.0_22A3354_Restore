@implementation DASSchedulerClass

void __get_DASSchedulerClass_block_invoke(uint64_t a1)
{
  MLBackgroundPredictionTask *v2;
  SEL v3;
  id v4;

  DuetActivitySchedulerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_DASScheduler");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DASSchedulerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (MLBackgroundPredictionTask *)abort_report_np();
    -[MLBackgroundPredictionTask encodeWithCoder:](v2, v3, v4);
  }
}

@end
