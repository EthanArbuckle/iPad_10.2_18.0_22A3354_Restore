@implementation CUTPromise

- (void)registerResultBlock:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUTPromise.m"), 168, CFSTR("CUTPromise is abstract and should never be created"));

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

  v6 = -[_CUTStaticPromise initWithResult:safe:](v4, "initWithResult:safe:", v5, 1);
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

  v6 = -[_CUTStaticPromise initWithResult:safe:](v4, "initWithResult:safe:", v5, 1);
  return v6;
}

+ (id)all:(id)a3
{
  id v3;
  _CUTLockingPromise *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  CUTResult *v9;
  unint64_t i;
  void *v11;
  id v12;
  void *v14;
  _QWORD v17[4];
  id v18;
  _CUTLockingPromise *v19;
  id v20;
  uint64_t *v21;
  _QWORD *v22;
  int v23;
  _QWORD v24[3];
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v3 = a3;
  v4 = objc_alloc_init(_CUTLockingPromise);
  -[_CUTLockingPromise lock](v4, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (objc_msgSend(v3, "count") > v7);
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  if (!objc_msgSend(v3, "count"))
  {
    v9 = -[CUTResult initWithSuccess:]([CUTResult alloc], "initWithSuccess:", v6);
    -[_CUTLockingPromise _fulfillWithResult:](v4, "_fulfillWithResult:", v9);

    *((_BYTE *)v27 + 24) = 1;
  }
  for (i = 0; objc_msgSend(v3, "count") > i; ++i)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CUTPromise.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[promise isKindOfClass:[CUTPromise class]]"));

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1A0BD060C;
    v17[3] = &unk_1E4490740;
    v18 = v5;
    v21 = &v26;
    v19 = v4;
    v12 = v6;
    v23 = i;
    v20 = v12;
    v22 = v24;
    objc_msgSend(v11, "registerResultBlock:", v17);

  }
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v4;
}

+ (id)allWithPartialSuccesses:(id)a3
{
  id v3;
  _CUTLockingPromise *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  CUTResult *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v15;
  _QWORD v18[4];
  id v19;
  id v20;
  _CUTLockingPromise *v21;
  _QWORD *v22;
  int v23;
  _QWORD v24[3];
  int v25;

  v3 = a3;
  v4 = objc_alloc_init(_CUTLockingPromise);
  -[_CUTLockingPromise lock](v4, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (objc_msgSend(v3, "count") > v7);
  }
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  if (!objc_msgSend(v3, "count"))
  {
    v9 = -[CUTResult initWithSuccess:]([CUTResult alloc], "initWithSuccess:", v6);
    -[_CUTLockingPromise _fulfillWithResult:](v4, "_fulfillWithResult:", v9);

  }
  v10 = 0;
  v11 = MEMORY[0x1E0C809B0];
  while (objc_msgSend(v3, "count") > v10)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CUTPromise.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[promise isKindOfClass:[CUTPromise class]]"));

    }
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = sub_1A0BD09CC;
    v18[3] = &unk_1E4490768;
    v19 = v5;
    v13 = v6;
    v23 = v10;
    v20 = v13;
    v22 = v24;
    v21 = v4;
    objc_msgSend(v12, "registerResultBlock:", v18);

    ++v10;
  }
  _Block_object_dispose(v24, 8);

  return v4;
}

- (id)then:(id)a3
{
  return sub_1A0BCF730(self, a3);
}

@end
