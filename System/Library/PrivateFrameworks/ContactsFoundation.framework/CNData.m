@implementation CNData

- (CNData)init
{
  CNFileManager *v3;
  CNData *v4;

  v3 = objc_alloc_init(CNFileManager);
  v4 = -[CNData initWithFileManager:](self, "initWithFileManager:", v3);

  return v4;
}

- (CNData)initWithFileManager:(id)a3
{
  id v4;
  void *v5;
  CNData *v6;

  v4 = a3;
  +[CNURLSessionFactory defaultFactory](CNURLSessionFactory, "defaultFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNData initWithFileManager:urlSessionFactory:](self, "initWithFileManager:urlSessionFactory:", v4, v5);

  return v6;
}

- (CNData)initWithFileManager:(id)a3 urlSessionFactory:(id)a4
{
  id v7;
  id v8;
  CNData *v9;
  CNData *v10;
  CNData *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNData;
  v9 = -[CNData init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileManager, a3);
    objc_storeStrong((id *)&v10->_sessionFactory, a4);
    v11 = v10;
  }

  return v10;
}

+ (id)dataWithContentsOfURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNURLSessionFactory defaultFactory](CNURLSessionFactory, "defaultFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataWithContentsOfURL:sessionFactory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dataWithContentsOfFileURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CNData_dataWithContentsOfFileURL___block_invoke;
  v7[3] = &unk_1E29B94B8;
  v8 = v3;
  v4 = v3;
  +[CNFuture futureWithBlock:](CNFuture, "futureWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __36__CNData_dataWithContentsOfFileURL___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", *(_QWORD *)(a1 + 32), 0, a2);
}

+ (id)dataWithContentsOfURL:(id)a3 sessionFactory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNPromise *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CNPromise *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  CNPromise *v30;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFileURL"))
  {
    objc_msgSend(a1, "dataWithContentsOfFileURL:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc_init(CNPromise);
    objc_msgSend(v7, "defaultSessionConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionWithConfiguration:delegate:delegateQueue:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke;
    v29[3] = &unk_1E29B94E0;
    v30 = v9;
    v13 = v9;
    objc_msgSend(v11, "dataTaskWithURL:completionHandler:", v6, v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");
    -[CNPromise future](v13, "future");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke_2;
    v26[3] = &unk_1E29B9508;
    v27 = v14;
    v16 = v11;
    v28 = v16;
    v17 = v14;
    objc_msgSend(v15, "addFailureBlock:", v26);

    -[CNPromise future](v13, "future");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v12;
    v22 = 3221225472;
    v23 = __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke_3;
    v24 = &unk_1E29B9530;
    v25 = v16;
    v19 = v16;
    objc_msgSend(v18, "addSuccessBlock:", &v21);

    -[CNPromise future](v13, "future", v21, v22, v23, v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a4);
  }
  else
  {
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11 && (v12 = objc_msgSend(v11, "statusCode"), v12 >= 400))
    {
      v13 = v12;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB28A8];
      v20[0] = CFSTR("status code");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = CFSTR("description");
      v21[0] = v16;
      objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 256, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v19);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v7);
    }

  }
}

uint64_t __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (+[CNFoundationError isCanceledError:](CNFoundationError, "isCanceledError:", a2))
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "invalidateAndCancel");
}

uint64_t __47__CNData_dataWithContentsOfURL_sessionFactory___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateAndCancel");
}

- (id)synchronousDataWithContentsOfURL:(id)a3
{
  void *v3;
  void *v4;

  -[CNData dataWithContentsOfURL:](self, "dataWithContentsOfURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNResult resultWithFuture:](CNResult, "resultWithFuture:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)synchronousDataWithContentsOfURL:(id)a3 timeout:(double)a4
{
  void *v5;
  void *v6;

  -[CNData dataWithContentsOfURL:](self, "dataWithContentsOfURL:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNResult resultWithFuture:timeout:](CNResult, "resultWithFuture:timeout:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNData)dataWithContentsOfURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CNData sessionFactory](self, "sessionFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithContentsOfURL:sessionFactory:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNData *)v7;
}

+ (id)observableWithContentsOfURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNURLSessionFactory defaultFactory](CNURLSessionFactory, "defaultFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observableWithContentsOfURL:sessionFactory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)observableWithContentsOfURL:(id)a3 sessionFactory:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v5 = a3;
  v6 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__2;
  v18[4] = __Block_byref_object_dispose__2;
  v19 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke;
  v14[3] = &unk_1E29B9580;
  v8 = v6;
  v15 = v8;
  v17 = v18;
  v9 = v5;
  v16 = v9;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_5;
  v13[3] = &unk_1E29B95A8;
  v13[4] = v18;
  objc_msgSend(v10, "doOnTerminate:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v18, 8);
  return v11;
}

id __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _CNDataURLSessionTaskAdapter *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  v4 = objc_alloc_init(_CNDataURLSessionTaskAdapter);
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_2;
  v20[3] = &unk_1E29B9530;
  v6 = v3;
  v21 = v6;
  -[_CNDataURLSessionTaskAdapter setOnDataReceived:](v4, "setOnDataReceived:", v20);
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_3;
  v18[3] = &unk_1E29B9558;
  v19 = v6;
  v7 = v6;
  -[_CNDataURLSessionTaskAdapter setOnCompletion:](v4, "setOnCompletion:", v18);
  objc_msgSend(*(id *)(a1 + 32), "defaultSessionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionWithConfiguration:delegate:delegateQueue:", v8, v4, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "dataTaskWithURL:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_4;
  v16[3] = &unk_1E29B9358;
  v17 = v12;
  v13 = v12;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

uint64_t __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "observerDidFailWithError:", a2);
  else
    return objc_msgSend(v2, "observerDidComplete");
}

uint64_t __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __53__CNData_observableWithContentsOfURL_sessionFactory___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidateAndCancel");
}

- (id)observableWithContentsOfURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CNData sessionFactory](self, "sessionFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observableWithContentsOfURL:sessionFactory:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  CNFileManager *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(CNFileManager);
  objc_msgSend(a1, "writeData:toURL:options:fileManager:", v9, v8, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 fileManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  v14 = MEMORY[0x1E0C809B0];
  if ((a5 & 1) != 0)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __46__CNData_writeData_toURL_options_fileManager___block_invoke;
    v25[3] = &unk_1E29B95D0;
    v26 = v12;
    v27 = v11;
    +[CNFuture futureWithBlock:](CNFuture, "futureWithBlock:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CNFuture futureWithResult:](CNFuture, "futureWithResult:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __46__CNData_writeData_toURL_options_fileManager___block_invoke_2;
  v20[3] = &unk_1E29B9620;
  v23 = a1;
  v24 = a5;
  v21 = v10;
  v22 = v11;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v15, "flatMap:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __46__CNData_writeData_toURL_options_fileManager___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:", v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (a2 && !v8)
    *a2 = objc_retainAutorelease(v7);

  return v9;
}

id __46__CNData_writeData_toURL_options_fileManager___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__CNData_writeData_toURL_options_fileManager___block_invoke_3;
  v5[3] = &unk_1E29B95F8;
  v2 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = v2;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  +[CNFuture futureWithBlock:](CNFuture, "futureWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __46__CNData_writeData_toURL_options_fileManager___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "writeToURL:options:error:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "NSDataWritingOptionsFromCNDataWritingOptions:", *(_QWORD *)(a1 + 56)), a2))v3 = *(void **)(a1 + 40);
  else
    v3 = 0;
  return v3;
}

+ (unint64_t)NSDataWritingOptionsFromCNDataWritingOptions:(unint64_t)a3
{
  void (**v3)(void *, uint64_t, uint64_t);
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CNData_NSDataWritingOptionsFromCNDataWritingOptions___block_invoke;
  v6[3] = &unk_1E29B9648;
  v6[4] = &v7;
  v6[5] = a3;
  v3 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(v6);
  v3[2](v3, 1024, 1);
  v3[2](v3, 2048, 2);
  v3[2](v3, 4096, 0x10000000);
  v3[2](v3, 0x2000, 0x20000000);
  v3[2](v3, 0x4000, 805306368);
  v3[2](v3, 0x8000, 0x40000000);
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__CNData_NSDataWritingOptionsFromCNDataWritingOptions___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((a2 & ~*(_QWORD *)(result + 40)) == 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) |= a3;
  return result;
}

- (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  -[CNData fileManager](self, "fileManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "writeData:toURL:options:fileManager:", v9, v8, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CNFileManager)fileManager
{
  return self->_fileManager;
}

- (CNURLSessionFactory)sessionFactory
{
  return self->_sessionFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionFactory, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
