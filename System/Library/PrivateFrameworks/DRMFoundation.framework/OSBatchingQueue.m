@implementation OSBatchingQueue

uint64_t __87___OSBatchingQueue_initWithName_maxBatchingDelay_maxQueueDepth_queue_workItemsHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unprotectedExecuteWorkItems");
}

void __47___OSBatchingQueue_unprotectedExecuteWorkItems__block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 40), "workHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 48));

}

void __32___OSBatchingQueue_addWorkItem___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 >= *(_QWORD *)(v3 + 16))
  {
    objc_msgSend((id)v3, "unprotectedExecuteWorkItems");
  }
  else if (v2 == 1)
  {
    v4 = *(NSObject **)(v3 + 56);
    v5 = dispatch_time(0, (uint64_t)(*(double *)(v3 + 8) * 1000000000.0));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 8) / 10.0 * 1000000000.0));
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 56));
  }
}

@end
