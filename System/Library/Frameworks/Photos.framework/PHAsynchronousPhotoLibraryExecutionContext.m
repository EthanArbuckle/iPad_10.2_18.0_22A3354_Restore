@implementation PHAsynchronousPhotoLibraryExecutionContext

- (void)dispatchOnQueue:(id)a3 block:(id)a4
{
  dispatch_async((dispatch_queue_t)a3, a4);
}

- (void)sendChangesRequest:(id)a3 onClient:(id)a4 reply:(id)a5
{
  objc_msgSend(a4, "sendChangesRequest:reply:", a3, a5);
}

- (void)callTransactionCompletionHandler:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  v7 = a5;
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    v9 = v7;
    pl_dispatch_async();

  }
}

uint64_t __97__PHAsynchronousPhotoLibraryExecutionContext_callTransactionCompletionHandler_withSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (PHAsynchronousPhotoLibraryExecutionContext)asynchronousExecutionContext
{
  return objc_alloc_init(PHAsynchronousPhotoLibraryExecutionContext);
}

@end
