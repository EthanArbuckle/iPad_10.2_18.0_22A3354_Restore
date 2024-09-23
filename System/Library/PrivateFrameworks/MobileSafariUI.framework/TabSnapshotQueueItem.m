@implementation TabSnapshotQueueItem

- (TabSnapshotQueueItem)initWithRequest:(id)a3 contentProvider:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  TabSnapshotQueueItem *v12;
  TabSnapshotQueueItem *v13;
  void *v14;
  id completionHandler;
  TabSnapshotQueueItem *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TabSnapshotQueueItem;
  v12 = -[TabSnapshotQueueItem init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_contentProvider, a4);
    v14 = _Block_copy(v11);
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = v14;

    v16 = v13;
  }

  return v13;
}

- (void)appendCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id completionHandler;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = _Block_copy(self->_completionHandler);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__TabSnapshotQueueItem_appendCompletionHandler___block_invoke;
  v10[3] = &unk_1E9CF4600;
  v11 = v5;
  v12 = v4;
  v6 = v4;
  v7 = v5;
  v8 = _Block_copy(v10);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v8;

}

void __48__TabSnapshotQueueItem_appendCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (TabSnapshotRequest)request
{
  return self->_request;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (TabSnapshotContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contentProvider, a3);
}

- (BOOL)snappshottingIsInProgress
{
  return self->_snappshottingIsInProgress;
}

- (void)setSnappshottingIsInProgress:(BOOL)a3
{
  self->_snappshottingIsInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
