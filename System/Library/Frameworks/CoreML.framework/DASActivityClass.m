@implementation DASActivityClass

Class __get_DASActivityClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;

  DuetActivitySchedulerLibrary();
  result = objc_getClass("_DASActivity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DASActivityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[MLBackgroundTask scheduleTask:](v3, v4, v5);
  }
  return result;
}

@end
