@implementation NTKHighPriorityApply

void __NTKHighPriorityApply_block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("HighPriorityApplyWorkloop");
  v1 = (void *)NTKHighPriorityApply__workloop;
  NTKHighPriorityApply__workloop = (uint64_t)inactive;

  dispatch_workloop_set_scheduler_priority();
  dispatch_activate((dispatch_object_t)NTKHighPriorityApply__workloop);
}

void __NTKHighPriorityApply_block_invoke_282(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int v3;
  signed int v4;
  unsigned int *v5;
  unsigned int v6;
  signed int v7;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1[5] + 8) + 40));
  v2 = (unsigned int *)(*(_QWORD *)(a1[6] + 8) + 40);
  do
  {
    v3 = __ldxr(v2);
    v4 = v3 + 1;
  }
  while (__stxr(v4, v2));
  if (a1[7] > (unint64_t)v4)
  {
    do
    {
      (*(void (**)(void))(a1[4] + 16))();
      v5 = (unsigned int *)(*(_QWORD *)(a1[6] + 8) + 40);
      do
      {
        v6 = __ldxr(v5);
        v7 = v6 + 1;
      }
      while (__stxr(v7, v5));
    }
    while (a1[7] > (unint64_t)v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[5] + 8) + 40));
}

@end
