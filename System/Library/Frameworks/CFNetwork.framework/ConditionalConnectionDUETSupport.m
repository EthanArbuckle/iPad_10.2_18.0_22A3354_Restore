@implementation ConditionalConnectionDUETSupport

uint64_t ____ConditionalConnectionDUETSupport_StartActivity_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  double v4;
  double Helper_x8__OBJC_CLASS____DASScheduler;
  uint64_t v6;
  void *v7;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  Helper_x8__OBJC_CLASS____DASScheduler = gotLoadHelper_x8__OBJC_CLASS____DASScheduler(v4);
  v7 = (void *)objc_msgSend(*(id *)(v6 + 2352), "sharedScheduler", Helper_x8__OBJC_CLASS____DASScheduler);
  if (v3)
    return objc_msgSend(v7, "activityStarted:", a2);
  else
    return objc_msgSend(v7, "activityCompleted:", a2);
}

@end
