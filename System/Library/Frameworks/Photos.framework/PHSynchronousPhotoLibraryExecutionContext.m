@implementation PHSynchronousPhotoLibraryExecutionContext

- (void)dispatchOnQueue:(id)a3 block:(id)a4
{
  dispatch_sync((dispatch_queue_t)a3, a4);
}

- (void)sendChangesRequest:(id)a3 onClient:(id)a4 reply:(id)a5
{
  void (**v7)(id, uint64_t, id);
  uint64_t v8;
  id v9;
  id v10;

  v10 = 0;
  v7 = (void (**)(id, uint64_t, id))a5;
  v8 = objc_msgSend(a4, "sendChangesRequest:error:", a3, &v10);
  v9 = v10;
  v7[2](v7, v8, v9);

}

- (void)callTransactionCompletionHandler:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  if (a3)
    (*((void (**)(id, BOOL, id))a3 + 2))(a3, a4, a5);
}

+ (PHSynchronousPhotoLibraryExecutionContext)synchronousExecutionContext
{
  return objc_alloc_init(PHSynchronousPhotoLibraryExecutionContext);
}

@end
