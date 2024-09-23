@implementation CRKFileBackedConfigurationSource

- (CRKFileBackedConfigurationSource)init
{
  void *v3;
  CRKFileBackedConfigurationSource *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "crk_uniqueTemporaryFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRKFileBackedConfigurationSource initWithFileURL:](self, "initWithFileURL:", v3);

  return v4;
}

- (CRKFileBackedConfigurationSource)initWithFileURL:(id)a3
{
  return -[CRKFileBackedConfigurationSource initWithFileURL:callbackQueue:](self, "initWithFileURL:callbackQueue:", a3, MEMORY[0x24BDAC9B8]);
}

- (CRKFileBackedConfigurationSource)initWithFileURL:(id)a3 callbackQueue:(id)a4
{
  id v7;
  id v8;
  CRKFileBackedConfigurationSource *v9;
  CRKFileBackedConfigurationSource *v10;
  uint64_t v11;
  NSOperationQueue *mFileOperationQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKFileBackedConfigurationSource;
  v9 = -[CRKFileBackedConfigurationSource init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mFileURL, a3);
    objc_storeStrong((id *)&v10->mCallbackQueue, a4);
    v11 = objc_opt_new();
    mFileOperationQueue = v10->mFileOperationQueue;
    v10->mFileOperationQueue = (NSOperationQueue *)v11;

  }
  return v10;
}

- (id)directoryURL
{
  return -[NSURL URLByDeletingLastPathComponent](self->mFileURL, "URLByDeletingLastPathComponent");
}

- (void)executeIntents:(id)a3 accessBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "coordinateAccessWithIntents:queue:byAccessor:", v7, self->mFileOperationQueue, v6);

}

- (void)invokeCompletionBlock:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *mCallbackQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mCallbackQueue = self->mCallbackQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__CRKFileBackedConfigurationSource_invokeCompletionBlock_withError___block_invoke;
  v11[3] = &unk_24D9C6E88;
  v12 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(mCallbackQueue, v11);

}

uint64_t __68__CRKFileBackedConfigurationSource_invokeCompletionBlock_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)invokeCompletionBlock:(id)a3 withConfiguration:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *mCallbackQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  mCallbackQueue = self->mCallbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__CRKFileBackedConfigurationSource_invokeCompletionBlock_withConfiguration_error___block_invoke;
  block[3] = &unk_24D9C7620;
  v17 = v10;
  v18 = v8;
  v16 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(mCallbackQueue, block);

}

uint64_t __82__CRKFileBackedConfigurationSource_invokeCompletionBlock_withConfiguration_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)delegateDidDeleteConfigurationAtURL:(id)a3 inDirectory:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[CRKFileBackedConfigurationSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "fileBackedConfigurationSource:didDeleteConfigurationAtURL:inDirectory:", self, v8, v6);

}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = 8;
  else
    v8 = 1;
  objc_msgSend(MEMORY[0x24BDD1568], "writingIntentWithURL:options:", self->mFileURL, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1568];
  -[CRKFileBackedConfigurationSource directoryURL](self, "directoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "writingIntentWithURL:options:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v9;
  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__CRKFileBackedConfigurationSource_setConfiguration_completion___block_invoke;
  v18[3] = &unk_24D9CA5B0;
  v21 = v12;
  v22 = v7;
  v18[4] = self;
  v19 = v6;
  v20 = v9;
  v14 = v12;
  v15 = v9;
  v16 = v6;
  v17 = v7;
  -[CRKFileBackedConfigurationSource executeIntents:accessBlock:](self, "executeIntents:accessBlock:", v13, v18);

}

void __64__CRKFileBackedConfigurationSource_setConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    goto LABEL_3;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v13, "deleteConfigurationAtURL:inDirectory:error:", v14, v15, &v18);
    v4 = v18;

    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v7 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v17);
  v4 = v17;

  if ((v7 & 1) == 0)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "invokeCompletionBlock:withError:", *(_QWORD *)(a1 + 64), v4);
    goto LABEL_4;
  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  v10 = objc_msgSend(v8, "writeToURL:error:", v9, &v16);
  v11 = v16;

  if (v10)
    v12 = 0;
  else
    v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "invokeCompletionBlock:withError:", *(_QWORD *)(a1 + 64), v12);
  v4 = v11;
LABEL_4:

}

- (BOOL)deleteConfigurationAtURL:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  id v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v11 = objc_msgSend(v10, "removeItemAtURL:error:", v8, &v17);
  v12 = v17;

  objc_msgSend(v12, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    v14 = objc_msgSend(v12, "code") == 4;
  else
    v14 = 0;

  v15 = v11 | v14;
  if (v15 == 1)
  {
    -[CRKFileBackedConfigurationSource delegateDidDeleteConfigurationAtURL:inDirectory:](self, "delegateDidDeleteConfigurationAtURL:inDirectory:", v8, v9);
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(v12);
  }

  return v15;
}

- (void)fetchConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1568], "readingIntentWithURL:options:", self->mFileURL, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1568];
  -[CRKFileBackedConfigurationSource directoryURL](self, "directoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readingIntentWithURL:options:", v7, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v5;
  v15[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__CRKFileBackedConfigurationSource_fetchConfiguration___block_invoke;
  v12[3] = &unk_24D9CA5D8;
  v13 = v5;
  v14 = v4;
  v12[4] = self;
  v10 = v5;
  v11 = v4;
  -[CRKFileBackedConfigurationSource executeIntents:accessBlock:](self, "executeIntents:accessBlock:", v9, v12);

}

void __55__CRKFileBackedConfigurationSource_fetchConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "invokeCompletionBlock:withConfiguration:error:", *(_QWORD *)(a1 + 48), 0, v3);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v5, "dictionaryWithContentsOfURL:error:", v6, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v12;

    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 48);
      v10 = v7;
      v11 = 0;
    }
    else
    {
      if (objc_msgSend(v8, "isReadErrorBenign:", v4))
      {

        v4 = 0;
      }
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 0;
      v11 = v4;
    }
    objc_msgSend(v8, "invokeCompletionBlock:withConfiguration:error:", v9, v10, v11);

  }
}

- (BOOL)isReadErrorBenign:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    v5 = objc_msgSend(v3, "code") == 260;
  else
    v5 = 0;

  return v5;
}

- (CRKFileBackedConfigurationSourceDelegate)delegate
{
  return (CRKFileBackedConfigurationSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mFileOperationQueue, 0);
  objc_storeStrong((id *)&self->mCallbackQueue, 0);
  objc_storeStrong((id *)&self->mFileURL, 0);
}

@end
