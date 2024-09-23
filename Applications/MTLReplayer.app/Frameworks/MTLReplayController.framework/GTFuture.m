@implementation GTFuture

id __40__GTFuture__addDependency_REQUIRESLOCK___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "broadcast");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
}

void __24__GTFuture_notifyGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __34__GTFuture_notifyOnQueue_handler___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __30__GTFuture_resolveWithFuture___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 40);
  objc_msgSend(*(id *)(v2 + 16), "unlock");
  objc_msgSend(*(id *)(a1 + 40), "_setResult:error:notify_NOLOCK:", v3, v4, 1);

}

id __31__GTFuture_timeoutAfter_label___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 24);
  result = objc_msgSend(*(id *)(v2 + 16), "unlock");
  if (!v3)
    return objc_msgSend(*(id *)(a1 + 32), "_setResult:error:notify_NOLOCK:", 0, +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 5, 0), 1);
  return result;
}

void __29__GTFuture_addResultHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __29__GTFuture_addResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD block[7];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 40);
  objc_msgSend(*(id *)(v2 + 16), "unlock");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __29__GTFuture_addResultHandler___block_invoke_3;
  block[3] = &unk_725168;
  v6 = *(_QWORD *)(a1 + 40);
  block[5] = v4;
  block[6] = v6;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

void __29__GTFuture_addResultHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __26__GTFuture_logPerformance__block_invoke(id a1)
{
  +[GTFuture logPerformance]::log = -[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("GPUDebugger.DYFuture.LogPerformance"));
}

@end
