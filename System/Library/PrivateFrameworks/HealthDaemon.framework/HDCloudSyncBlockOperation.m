@implementation HDCloudSyncBlockOperation

- (HDCloudSyncBlockOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 synchronousBlock:(id)a5
{
  id v8;
  id v9;
  HDCloudSyncBlockOperation *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__HDCloudSyncBlockOperation_initWithConfiguration_cloudState_synchronousBlock___block_invoke;
  v12[3] = &unk_1E6CFF418;
  v13 = v8;
  v9 = v8;
  v10 = -[HDCloudSyncBlockOperation initWithConfiguration:cloudState:block:](self, "initWithConfiguration:cloudState:block:", a3, a4, v12);

  return v10;
}

void __79__HDCloudSyncBlockOperation_initWithConfiguration_cloudState_synchronousBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, id, id *);
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v3 = *(uint64_t (**)(uint64_t, id, id *))(v2 + 16);
  v4 = a2;
  v5 = v3(v2, v4, &v7);
  v6 = v7;
  objc_msgSend(v4, "finishWithSuccess:error:", v5, v6);

}

- (HDCloudSyncBlockOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 block:(id)a5
{
  id v8;
  HDCloudSyncBlockOperation *v9;
  uint64_t v10;
  id block;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncBlockOperation;
  v9 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    block = v9->_block;
    v9->_block = (id)v10;

  }
  return v9;
}

- (void)main
{
  id block;

  (*((void (**)(void))self->_block + 2))();
  block = self->_block;
  self->_block = 0;

}

- (void)skip
{
  id block;
  objc_super v4;

  block = self->_block;
  self->_block = 0;

  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncBlockOperation;
  -[HDCloudSyncOperation skip](&v4, sel_skip);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
