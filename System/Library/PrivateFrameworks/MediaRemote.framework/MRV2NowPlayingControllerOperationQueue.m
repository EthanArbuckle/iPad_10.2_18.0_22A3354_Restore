@implementation MRV2NowPlayingControllerOperationQueue

- (MRV2NowPlayingControllerOperationQueue)initWithQueue:(id)a3
{
  id v4;
  MRV2NowPlayingControllerOperationQueue *v5;
  NSOperationQueue *v6;
  NSOperationQueue *queue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRV2NowPlayingControllerOperationQueue;
  v5 = -[MRV2NowPlayingControllerOperationQueue init](&v9, sel_init);
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v5->_queue;
    v5->_queue = v6;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_queue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setUnderlyingQueue:](v5->_queue, "setUnderlyingQueue:", v4);
  }

  return v5;
}

- (void)invalidate
{
  MRV2NowPlayingControllerOperationQueue *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_invalidated = 1;
  -[NSOperationQueue cancelAllOperations](obj->_queue, "cancelAllOperations");
  objc_sync_exit(obj);

}

- (void)addOperationWithBlock:(id)a3
{
  MRV2NowPlayingControllerOperationQueue *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_invalidated)
    -[NSOperationQueue addOperationWithBlock:](v4->_queue, "addOperationWithBlock:", v5);
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
