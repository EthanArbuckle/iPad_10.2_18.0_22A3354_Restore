@implementation CUTUnsafePromise

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUTUnsafePromise;
  return -[CUTUnsafePromise init](&v3, sel_init);
}

- (void)registerResultBlock:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUTPromise.m"), 60, CFSTR("CUTUnsafePromise is abstract and should never be created"));

}

+ (id)failedPromiseWithError:(id)a3
{
  id v3;
  _CUTStaticPromise *v4;
  CUTResult *v5;
  _CUTStaticPromise *v6;

  v3 = a3;
  v4 = [_CUTStaticPromise alloc];
  v5 = -[CUTResult initWithError:]([CUTResult alloc], "initWithError:", v3);

  v6 = -[_CUTStaticPromise initWithResult:safe:](v4, "initWithResult:safe:", v5, 0);
  return v6;
}

+ (id)fulfilledPromiseWithValue:(id)a3
{
  id v3;
  _CUTStaticPromise *v4;
  CUTResult *v5;
  _CUTStaticPromise *v6;

  v3 = a3;
  v4 = [_CUTStaticPromise alloc];
  v5 = -[CUTResult initWithSuccess:]([CUTResult alloc], "initWithSuccess:", v3);

  v6 = -[_CUTStaticPromise initWithResult:safe:](v4, "initWithResult:safe:", v5, 0);
  return v6;
}

+ (id)all:(id)a3
{
  id v3;
  CUTUnsafePromiseSeal *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  CUTUnsafePromiseSeal *v15;
  id v16;
  uint64_t *v17;
  _QWORD *v18;
  int v19;
  _QWORD v20[3];
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v3 = a3;
  v4 = objc_alloc_init(CUTUnsafePromiseSeal);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      ++v6;
    }
    while (objc_msgSend(v3, "count") > v6);
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  if (!objc_msgSend(v3, "count"))
  {
    -[CUTUnsafePromiseSeal fulfillWithValue:](v4, "fulfillWithValue:", v5);
    *((_BYTE *)v23 + 24) = 1;
  }
  v8 = 0;
  v9 = MEMORY[0x1E0C809B0];
  while (objc_msgSend(v3, "count") > v8)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = sub_1A0BCFD70;
    v14[3] = &unk_1E44906F0;
    v17 = &v22;
    v15 = v4;
    v11 = v5;
    v19 = v8;
    v16 = v11;
    v18 = v20;
    objc_msgSend(v10, "registerResultBlock:", v14);

    ++v8;
  }
  -[CUTUnsafePromiseSeal promise](v4, "promise");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

+ (id)allWithPartialSuccesses:(id)a3
{
  id v3;
  CUTUnsafePromiseSeal *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  CUTUnsafePromiseSeal *v16;
  _QWORD *v17;
  int v18;
  _QWORD v19[3];
  int v20;

  v3 = a3;
  v4 = objc_alloc_init(CUTUnsafePromiseSeal);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      ++v6;
    }
    while (objc_msgSend(v3, "count") > v6);
  }
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  if (!objc_msgSend(v3, "count"))
    -[CUTUnsafePromiseSeal fulfillWithValue:](v4, "fulfillWithValue:", v5);
  v8 = 0;
  v9 = MEMORY[0x1E0C809B0];
  while (objc_msgSend(v3, "count") > v8)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = sub_1A0BD0048;
    v14[3] = &unk_1E4490718;
    v11 = v5;
    v18 = v8;
    v15 = v11;
    v17 = v19;
    v16 = v4;
    objc_msgSend(v10, "registerResultBlock:", v14);

    ++v8;
  }
  -[CUTUnsafePromiseSeal promise](v4, "promise");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v19, 8);

  return v12;
}

- (id)then:(id)a3
{
  return sub_1A0BCF4E0(self, a3);
}

@end
