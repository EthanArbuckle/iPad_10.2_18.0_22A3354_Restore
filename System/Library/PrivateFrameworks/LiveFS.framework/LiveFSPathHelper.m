@implementation LiveFSPathHelper

+ (id)helperWithMount:(id)a3 andPath:(id)a4
{
  id v5;
  id v6;
  LiveFSPathHelper *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[LiveFSPathHelper initWithMount:andPath:]([LiveFSPathHelper alloc], "initWithMount:andPath:", v6, v5);

  return v7;
}

- (LiveFSPathHelper)initWithMount:(id)a3 andPath:(id)a4
{
  id v7;
  id v8;
  LiveFSPathHelper *v9;
  uint64_t v10;
  NSError *error;
  dispatch_queue_t v12;
  OS_dispatch_queue *ourQueue;
  uint64_t v14;
  NSArray *pathComponents;
  uint64_t v16;
  NSMutableOrderedSet *fileHandleStack;
  uint64_t v18;
  NSMutableArray *attributeStack;
  NSData *attributes;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)LiveFSPathHelper;
  v9 = -[LiveFSPathHelper init](&v22, sel_init);
  if (v9)
  {
    if ((unint64_t)objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4) < 0x401)
    {
      v12 = dispatch_queue_create("com.apple.LiveFSPathHelper.lookup", 0);
      ourQueue = v9->ourQueue;
      v9->ourQueue = (OS_dispatch_queue *)v12;

      objc_storeStrong((id *)&v9->ourMount, a3);
      objc_msgSend(v8, "pathComponents");
      v14 = objc_claimAutoreleasedReturnValue();
      pathComponents = v9->pathComponents;
      v9->pathComponents = (NSArray *)v14;

      v9->currentPathComponent = 0;
      objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", -[NSArray count](v9->pathComponents, "count"));
      v16 = objc_claimAutoreleasedReturnValue();
      fileHandleStack = v9->fileHandleStack;
      v9->fileHandleStack = (NSMutableOrderedSet *)v16;

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v9->pathComponents, "count"));
      v18 = objc_claimAutoreleasedReturnValue();
      attributeStack = v9->attributeStack;
      v9->attributeStack = (NSMutableArray *)v18;

      attributes = v9->_attributes;
      v9->_attributes = 0;

      v9->fileHandleStackCount = 0;
      *(_WORD *)&v9->lookupCompleted = 0;
      v9->resolveTrailingSymlink = 1;
      v9->numberOfSymlinks = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 63, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      error = v9->_error;
      v9->_error = (NSError *)v10;

    }
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  -[LiveFSPathHelper popFileHandle](self, "popFileHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      -[LiveFSVolumeCore reclaim:requestID:reply:](self->ourMount, "reclaim:requestID:reply:", v4, -1, &__block_literal_global_0);
      -[LiveFSPathHelper popFileHandle](self, "popFileHandle");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    while (v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)LiveFSPathHelper;
  -[LiveFSPathHelper dealloc](&v6, sel_dealloc);
}

- (void)finalizeWithError:(id)a3
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id completionHandler;
  id v8;

  v5 = a3;
  if (!self->lookupCompleted)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    *(_WORD *)&self->lookupCompleted = 1;
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2FAC64](self->completionHandler);
    completionHandler = self->completionHandler;
    self->completionHandler = 0;

    ((void (**)(_QWORD, id))v6)[2](v6, v8);
    v5 = v8;
  }

}

- (void)finalizeWithErrno:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LiveFSPathHelper finalizeWithError:](self, "finalizeWithError:", v4);

}

- (id)currentFileHandle
{
  NSString *v3;

  -[LiveFSPathHelper peekFileHandle](self, "peekFileHandle");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = self->rootFileHandle;
  return v3;
}

- (void)reclaimItem:(id)a3 withContinuation:(id)a4
{
  id v6;
  LiveFSVolumeCore *ourMount;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  ourMount = self->ourMount;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__LiveFSPathHelper_reclaimItem_withContinuation___block_invoke;
  v9[3] = &unk_24F64C180;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[LiveFSVolumeCore reclaim:requestID:reply:](ourMount, "reclaim:requestID:reply:", a3, -1, v9);

}

void __49__LiveFSPathHelper_reclaimItem_withContinuation___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__LiveFSPathHelper_reclaimItem_withContinuation___block_invoke_2;
  block[3] = &unk_24F64C158;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __49__LiveFSPathHelper_reclaimItem_withContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processReadLinkReplyForLink:(id)a3 withResult:(int)a4 linkString:(id)a5 andAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BYTE *v14;
  void *v15;
  NSArray *v16;
  NSArray *pathComponents;
  unint64_t i;
  void *v19;
  NSArray *v20;
  _QWORD v21[5];
  int v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4)
    goto LABEL_8;
  v13 = objc_retainAutorelease(v11);
  v14 = (_BYTE *)objc_msgSend(v13, "UTF8String");
  if ((unint64_t)objc_msgSend(v13, "length") < 2)
  {
    a4 = 2;
LABEL_8:
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __84__LiveFSPathHelper_processReadLinkReplyForLink_withResult_linkString_andAttributes___block_invoke;
    v21[3] = &unk_24F64C1A8;
    v21[4] = self;
    v22 = a4;
    -[LiveFSPathHelper reclaimItem:withContinuation:](self, "reclaimItem:withContinuation:", v10, v21);
    goto LABEL_9;
  }
  if ((unint64_t)(objc_msgSend(v13, "length") - 1026) < 0xFFFFFFFFFFFFFBFFLL)
  {
    a4 = 63;
    goto LABEL_8;
  }
  if (*v14 == 47)
  {
    a4 = 18;
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v11, "pathComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v15, "count") + -[NSArray count](self->pathComponents, "count"));
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v16, "addObjectsFromArray:", v15);
  pathComponents = self->pathComponents;
  for (i = self->currentPathComponent + 1; i < -[NSArray count](pathComponents, "count"); ++i)
  {
    -[NSArray objectAtIndex:](self->pathComponents, "objectAtIndex:", i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v16, "addObject:", v19);

    pathComponents = self->pathComponents;
  }
  v20 = self->pathComponents;
  self->pathComponents = v16;

  self->currentPathComponent = 0;
  -[LiveFSPathHelper lookupNextComponent](self, "lookupNextComponent");

}

uint64_t __84__LiveFSPathHelper_processReadLinkReplyForLink_withResult_linkString_andAttributes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalizeWithErrno:", *(unsigned int *)(a1 + 40));
}

- (void)resolveSymlink:(id)a3
{
  id v4;
  void *v5;
  unint64_t numberOfSymlinks;
  LiveFSVolumeCore *ourMount;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  numberOfSymlinks = self->numberOfSymlinks;
  self->numberOfSymlinks = numberOfSymlinks + 1;
  if (numberOfSymlinks == 255)
  {
    -[LiveFSPathHelper finalizeWithErrno:](self, "finalizeWithErrno:", 62);
  }
  else
  {
    ourMount = self->ourMount;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __35__LiveFSPathHelper_resolveSymlink___block_invoke;
    v8[3] = &unk_24F64C1F8;
    v8[4] = self;
    v9 = v4;
    -[LiveFSVolumeCore readLinkOf:requestID:reply:](ourMount, "readLinkOf:requestID:reply:", v9, -1, v8);

  }
}

void __35__LiveFSPathHelper_resolveSymlink___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  int v18;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(v9 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__LiveFSPathHelper_resolveSymlink___block_invoke_2;
  block[3] = &unk_24F64C1D0;
  block[4] = v9;
  v18 = a2;
  v15 = v10;
  v16 = v7;
  v17 = v8;
  v12 = v8;
  v13 = v7;
  dispatch_async(v11, block);

}

uint64_t __35__LiveFSPathHelper_resolveSymlink___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processReadLinkReplyForLink:withResult:linkString:andAttributes:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)processLookupReplyWithResult:(int)a3 item:(id)a4 andAttributes:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  LiveFSPathHelper *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t currentPathComponent;
  NSUInteger v16;
  int v17;
  _QWORD v18[5];

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  if ((_DWORD)v6)
  {
    v10 = self;
    v11 = v6;
  }
  else if (-[NSMutableOrderedSet containsObject:](self->fileHandleStack, "containsObject:", v8))
  {
    v10 = self;
    v11 = 62;
  }
  else
  {
    v12 = objc_retainAutorelease(v9);
    v13 = objc_msgSend(v12, "bytes");
    if ((*(_BYTE *)(v13 + 8) & 1) != 0)
    {
      v14 = v13;
      currentPathComponent = self->currentPathComponent;
      v16 = -[NSArray count](self->pathComponents, "count");
      v17 = *(_DWORD *)(v14 + 24);
      if (currentPathComponent == v16 - 1)
      {
        if (v17 != 3 || !self->resolveTrailingSymlink)
        {
          -[LiveFSPathHelper pushFileHandle:attributes:](self, "pushFileHandle:attributes:", v8, v12);
          -[LiveFSPathHelper finalizeWithError:](self, "finalizeWithError:", 0);
          goto LABEL_8;
        }
      }
      else
      {
        if (v17 == 2)
        {
          -[LiveFSPathHelper pushFileHandle:attributes:](self, "pushFileHandle:attributes:", v8, v12);
          ++self->currentPathComponent;
          -[LiveFSPathHelper lookupNextComponent](self, "lookupNextComponent");
          goto LABEL_8;
        }
        if (v17 != 3)
        {
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __68__LiveFSPathHelper_processLookupReplyWithResult_item_andAttributes___block_invoke;
          v18[3] = &unk_24F64C220;
          v18[4] = self;
          -[LiveFSPathHelper reclaimItem:withContinuation:](self, "reclaimItem:withContinuation:", v8, v18);
          goto LABEL_8;
        }
      }
      -[LiveFSPathHelper resolveSymlink:](self, "resolveSymlink:", v8);
      goto LABEL_8;
    }
    v10 = self;
    v11 = 5;
  }
  -[LiveFSPathHelper finalizeWithErrno:](v10, "finalizeWithErrno:", v11);
LABEL_8:

}

uint64_t __68__LiveFSPathHelper_processLookupReplyWithResult_item_andAttributes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalizeWithErrno:", 20);
}

- (void)lookupNextComponent
{
  unint64_t currentPathComponent;
  id v4;
  void *v5;
  NSArray *pathComponents;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  LiveFSVolumeCore *ourMount;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];

  currentPathComponent = self->currentPathComponent;
  if (currentPathComponent >= -[NSArray count](self->pathComponents, "count"))
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    while (1)
    {
      v5 = v4;
      -[NSArray objectAtIndex:](self->pathComponents, "objectAtIndex:", self->currentPathComponent);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "length"))
      {
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR(".")) & 1) == 0
          && !objc_msgSend(v13, "isEqualToString:", CFSTR("/")))
        {
          break;
        }
      }
      pathComponents = self->pathComponents;
      v7 = self->currentPathComponent + 1;
      self->currentPathComponent = v7;
      v8 = v7 >= -[NSArray count](pathComponents, "count");
      v4 = v13;
      if (v8)
        goto LABEL_10;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("..")))
    {
      ++self->currentPathComponent;
      -[LiveFSPathHelper popFileHandle](self, "popFileHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __39__LiveFSPathHelper_lookupNextComponent__block_invoke;
        v15[3] = &unk_24F64C220;
        v15[4] = self;
        -[LiveFSPathHelper reclaimItem:withContinuation:](self, "reclaimItem:withContinuation:", v12, v15);
      }
      else
      {
        -[LiveFSPathHelper finalizeWithErrno:](self, "finalizeWithErrno:", 18);
      }

      goto LABEL_24;
    }
    v4 = v13;
  }
LABEL_10:
  v13 = v4;
  v9 = self->currentPathComponent;
  if (v9 == -[NSArray count](self->pathComponents, "count"))
  {
    -[LiveFSPathHelper finalizeWithError:](self, "finalizeWithError:", 0);
LABEL_14:

    return;
  }
  if ((unint64_t)objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 4) >= 0x100)
  {
    -[LiveFSPathHelper finalizeWithErrno:](self, "finalizeWithErrno:", 63);
    goto LABEL_14;
  }
  if (!v13)
  {
    -[LiveFSPathHelper finalizeWithErrno:](self, "finalizeWithErrno:", 22);
    return;
  }
  ourMount = self->ourMount;
  -[LiveFSPathHelper currentFileHandle](self, "currentFileHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__LiveFSPathHelper_lookupNextComponent__block_invoke_2;
  v14[3] = &unk_24F64C270;
  v14[4] = self;
  -[LiveFSVolumeCore lookupIn:name:usingFlags:requestID:reply:](ourMount, "lookupIn:name:usingFlags:requestID:reply:", v11, v13, 0, -1, v14);

LABEL_24:
}

uint64_t __39__LiveFSPathHelper_lookupNextComponent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lookupNextComponent");
}

void __39__LiveFSPathHelper_lookupNextComponent__block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int v17;

  v8 = a4;
  v9 = a5;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 8);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__LiveFSPathHelper_lookupNextComponent__block_invoke_3;
  v14[3] = &unk_24F64C248;
  v17 = a2;
  v14[4] = v10;
  v15 = v8;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  dispatch_async(v11, v14);

}

uint64_t __39__LiveFSPathHelper_lookupNextComponent__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processLookupReplyWithResult:item:andAttributes:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)lookupWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  id completionHandler;
  LiveFSVolumeCore *ourMount;
  _QWORD v10[5];
  void (**v11)(_QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->lookupCompleted)
  {
    (*((void (**)(id, NSError *))v4 + 2))(v4, self->_error);
  }
  else if (self->lookupInProgress)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 16, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
  else
  {
    self->lookupInProgress = 1;
    v7 = (void *)MEMORY[0x22E2FAC64](v4);
    completionHandler = self->completionHandler;
    self->completionHandler = v7;

    ourMount = self->ourMount;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__LiveFSPathHelper_lookupWithCompletionHandler___block_invoke;
    v10[3] = &unk_24F64C298;
    v10[4] = self;
    v11 = v5;
    -[LiveFSVolumeCore getRootFileHandleWithError:](ourMount, "getRootFileHandleWithError:", v10);

  }
}

void __48__LiveFSPathHelper_lookupWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__LiveFSPathHelper_lookupWithCompletionHandler___block_invoke_2;
    block[3] = &unk_24F64C220;
    block[4] = v7;
    dispatch_async(v8, block);
  }

}

uint64_t __48__LiveFSPathHelper_lookupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lookupNextComponent");
}

- (void)pushFileHandle:(id)a3 attributes:(id)a4
{
  NSData *v6;
  NSData *attributes;

  v6 = (NSData *)a4;
  -[NSMutableOrderedSet addObject:](self->fileHandleStack, "addObject:", a3);
  -[NSMutableArray addObject:](self->attributeStack, "addObject:", v6);
  attributes = self->_attributes;
  self->_attributes = v6;

  ++self->fileHandleStackCount;
}

- (id)popFileHandle
{
  void *v3;
  unint64_t fileHandleStackCount;
  NSData *v5;
  NSData *attributes;

  -[LiveFSPathHelper peekFileHandle](self, "peekFileHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableOrderedSet removeObject:](self->fileHandleStack, "removeObject:", v3);
    fileHandleStackCount = self->fileHandleStackCount;
    self->fileHandleStackCount = fileHandleStackCount - 1;
    if (fileHandleStackCount == 1)
    {
      attributes = self->_attributes;
      self->_attributes = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->attributeStack, "objectAtIndex:", fileHandleStackCount - 2);
      v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      attributes = self->_attributes;
      self->_attributes = v5;
    }

  }
  return v3;
}

- (id)peekFileHandle
{
  unint64_t fileHandleStackCount;
  void *v3;

  fileHandleStackCount = self->fileHandleStackCount;
  if (fileHandleStackCount)
  {
    -[NSMutableOrderedSet objectAtIndex:](self->fileHandleStack, "objectAtIndex:", fileHandleStackCount - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSData)attributes
{
  NSData *attributes;
  BOOL v3;
  NSObject *ourQueue;
  _QWORD block[5];

  attributes = self->_attributes;
  if (self->fileHandleStackCount)
    v3 = 0;
  else
    v3 = attributes == 0;
  if (v3)
  {
    ourQueue = self->ourQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__LiveFSPathHelper_attributes__block_invoke;
    block[3] = &unk_24F64C220;
    block[4] = self;
    dispatch_sync(ourQueue, block);
    attributes = self->_attributes;
  }
  return attributes;
}

uint64_t __30__LiveFSPathHelper_attributes__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__LiveFSPathHelper_attributes__block_invoke_2;
  v5[3] = &unk_24F64C2C0;
  v5[4] = v1;
  return objc_msgSend(v2, "fileAttributes:requestID:reply:", v3, -1, v5);
}

void __30__LiveFSPathHelper_attributes__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (!a2)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a3);
    v6 = v7;
  }

}

- (BOOL)resolveTrailingSymlink
{
  return self->resolveTrailingSymlink;
}

- (void)setResolveTrailingSymlink:(BOOL)a3
{
  if (!self->lookupInProgress && !self->lookupCompleted)
    self->resolveTrailingSymlink = a3;
}

- (NSString)fileHandle
{
  if (!self->lookupCompleted || self->_error)
    return (NSString *)0;
  -[LiveFSPathHelper currentFileHandle](self, "currentFileHandle");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->completionHandler, 0);
  objc_storeStrong((id *)&self->attributeStack, 0);
  objc_storeStrong((id *)&self->fileHandleStack, 0);
  objc_storeStrong((id *)&self->pathComponents, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->rootFileHandle, 0);
  objc_storeStrong((id *)&self->ourMount, 0);
  objc_storeStrong((id *)&self->ourQueue, 0);
}

@end
