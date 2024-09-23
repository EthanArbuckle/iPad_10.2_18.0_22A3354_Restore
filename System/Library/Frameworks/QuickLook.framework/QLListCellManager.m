@implementation QLListCellManager

- (QLListCellManager)init
{
  QLListCellManager *v2;
  uint64_t v3;
  NSMutableDictionary *operations;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  uint64_t v7;
  NSOperationQueue *generationQueue;
  QLListCellManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)QLListCellManager;
  v2 = -[QLListCellManager init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    operations = v2->_operations;
    v2->_operations = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_create("com.apple.quicklook.celllistmanager.serialqueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    generationQueue = v2->_generationQueue;
    v2->_generationQueue = (NSOperationQueue *)v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_generationQueue, "setMaxConcurrentOperationCount:", 4);
    v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_generationQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)QLListCellManager;
  -[QLListCellManager dealloc](&v3, sel_dealloc);
}

- (void)setupCell:(id)a3 withItem:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *serialQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  serialQueue = self->_serialQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__QLListCellManager_setupCell_withItem_atIndex___block_invoke;
  v13[3] = &unk_24C724E88;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(serialQueue, v13);

}

void __48__QLListCellManager_setupCell_withItem_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  QLListCellDataGenerationOperation *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id from;
  id location;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "cancel");
  objc_msgSend(*(id *)(a1 + 40), "setRow:", *(_QWORD *)(a1 + 56));
  v5 = -[QLListCellDataGenerationOperation initWithListCell:index:item:delegate:]([QLListCellDataGenerationOperation alloc], "initWithListCell:index:item:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, v5);
  objc_initWeak(&from, *(id *)(a1 + 32));
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __48__QLListCellManager_setupCell_withItem_atIndex___block_invoke_2;
  v9 = &unk_24C725B78;
  objc_copyWeak(&v10, &from);
  objc_copyWeak(&v11, &location);
  -[QLListCellDataGenerationOperation setCompletionBlock:](v5, "setCompletionBlock:", &v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v5, v2, v6, v7, v8, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addOperation:", v5);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __48__QLListCellManager_setupCell_withItem_atIndex___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_operationDidFinish:", v2);

}

- (void)_operationDidFinish:(id)a3
{
  id v4;
  void *v5;
  NSObject *serialQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "index"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__QLListCellManager__operationDidFinish___block_invoke;
  block[3] = &unk_24C724728;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_sync(serialQueue, block);

}

void __41__QLListCellManager__operationDidFinish___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[6];

  if (v2 == v3)
    objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);
}

- (void)operation:(id)a3 didGenerateThumbnail:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if ((objc_msgSend(v8, "isCancelled") & 1) == 0)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__QLListCellManager_operation_didGenerateThumbnail___block_invoke;
    block[3] = &unk_24C724778;
    v10 = v8;
    v11 = v6;
    dispatch_sync(serialQueue, block);

  }
}

void __52__QLListCellManager_operation_didGenerateThumbnail___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;
  id v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "index");
  objc_msgSend(*(id *)(a1 + 32), "cell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 == objc_msgSend(v4, "row"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");

    if ((v3 & 1) == 0)
    {
      v5 = *(id *)(a1 + 32);
      v6 = *(id *)(a1 + 40);
      QLRunInMainThread();

    }
  }
  else
  {

  }
}

void __52__QLListCellManager_operation_didGenerateThumbnail___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setThumbnail:", v1);

}

- (void)operation:(id)a3 didDetermineFileSize:(id)a4 fileTypeString:(id)a5
{
  id v8;
  id v9;
  NSObject *serialQueue;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v11, "isCancelled") & 1) == 0)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__QLListCellManager_operation_didDetermineFileSize_fileTypeString___block_invoke;
    block[3] = &unk_24C724728;
    v13 = v11;
    v14 = v8;
    v15 = v9;
    dispatch_sync(serialQueue, block);

  }
}

void __67__QLListCellManager_operation_didDetermineFileSize_fileTypeString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "index");
  objc_msgSend(*(id *)(a1 + 32), "cell");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 != objc_msgSend(v10, "row"))
  {

    return;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", objc_msgSend(*(id *)(a1 + 40), "longLongValue"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(void **)(a1 + 48);
    if (v6 && v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ – %@"), *(_QWORD *)(a1 + 48), v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v6)
    {
      v7 = v6;
    }
    else
    {
      if (!v4)
      {
        v8 = 0;
        goto LABEL_12;
      }
      v7 = v4;
    }
    v8 = v7;
LABEL_12:
    v11 = *(id *)(a1 + 32);
    v9 = v8;
    QLRunInMainThread();

  }
}

void __67__QLListCellManager_operation_didDetermineFileSize_fileTypeString___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubtitleString:", v1);

}

- (NSMutableDictionary)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
  objc_storeStrong((id *)&self->_operations, a3);
}

- (NSOperationQueue)generationQueue
{
  return self->_generationQueue;
}

- (void)setGenerationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_generationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
