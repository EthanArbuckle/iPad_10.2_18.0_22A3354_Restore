@implementation CKRequestAssetOperation

- (CKRequestAssetOperation)initWithAssetMetadata:(id)a3 requestCallback:(id)a4
{
  id v7;
  id v8;
  CKRequestAssetOperation *v9;
  CKRequestAssetOperation *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id requestCallback;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKRequestAssetOperation;
  v9 = -[CKRequestAssetOperation init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    v14 = objc_msgSend_copy(v8, v11, v12, v13);
    requestCallback = v10->_requestCallback;
    v10->_requestCallback = (id)v14;

  }
  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setState:(int64_t)a3
{
  const char *v4;
  uint64_t v5;
  int64_t state;
  BOOL v7;
  int v8;
  BOOL v9;
  int v10;
  CKRequestAssetOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  state = obj->_state;
  if (state != a3)
  {
    v7 = a3 == 1 || state == 1;
    v8 = v7;
    if (v7)
      objc_msgSend_willChangeValueForKey_(obj, v4, (uint64_t)CFSTR("isExecuting"), v5);
    v9 = a3 == 2 || state == 2;
    v10 = v9;
    if (v9)
      objc_msgSend_willChangeValueForKey_(obj, v4, (uint64_t)CFSTR("isFinished"), v5);
    obj->_state = a3;
    if (v8)
      objc_msgSend_didChangeValueForKey_(obj, v4, (uint64_t)CFSTR("isExecuting"), v5);
    if (v10)
      objc_msgSend_didChangeValueForKey_(obj, v4, (uint64_t)CFSTR("isFinished"), v5);
  }
  objc_sync_exit(obj);

}

- (int64_t)state
{
  CKRequestAssetOperation *v2;
  int64_t state;

  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (BOOL)isExecuting
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_state(self, a2, v2, v3) == 1;
}

- (BOOL)isFinished
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_state(self, a2, v2, v3) == 2;
}

- (void)start
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CKException *v18;
  const char *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  if ((objc_msgSend_isCancelled(self, a2, v2, v3) & 1) == 0)
  {
    if (objc_msgSend_state(self, v5, v6, v7))
    {
      v18 = [CKException alloc];
      v20 = (id)objc_msgSend_initWithName_format_(v18, v19, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("The operation must be in the Pending state at start"));
      objc_exception_throw(v20);
    }
    objc_initWeak(&location, self);
    objc_msgSend_setState_(self, v8, 1, v9);
    objc_msgSend_requestCallback(self, v10, v11, v12);
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_metadata(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_18A77400C;
    v21[3] = &unk_1E1F645A8;
    objc_copyWeak(&v22, &location);
    ((void (**)(_QWORD, void *, _QWORD *))v13)[2](v13, v17, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (CKUploadRequestMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (id)assetRequestCompletionBlock
{
  return self->_assetRequestCompletionBlock;
}

- (void)setAssetRequestCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)requestCallback
{
  return self->_requestCallback;
}

- (void)setRequestCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestCallback, 0);
  objc_storeStrong(&self->_assetRequestCompletionBlock, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
