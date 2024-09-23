@implementation NSCloudKitMirroringRequest

- (NSCloudKitMirroringRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  NSCloudKitMirroringRequest *v6;
  NSCloudKitMirroringRequest *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSCloudKitMirroringRequest;
  v6 = -[NSCloudKitMirroringRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
      v8 = objc_msgSend(a3, "copy");
    else
      v8 = -[NSCloudKitMirroringRequest createDefaultOptions](v6, "createDefaultOptions");
    v7->_options = (NSCloudKitMirroringRequestOptions *)v8;
    v7->_requestIdentifier = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v7->_requestCompletionBlock = (id)objc_msgSend(a4, "copy");
    v7->_deferredByBackgroundTimeout = 0;
    v7->_containerBlocks = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v7;
}

- (NSCloudKitMirroringRequest)initWithActivity:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  NSCloudKitMirroringRequest *v6;

  v6 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](self, "initWithOptions:completionBlock:", a4, a5);
  if (v6)
    v6->_schedulerActivity = (CKSchedulerActivity *)a3;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_requestIdentifier = 0;
  self->_options = 0;

  self->_requestCompletionBlock = 0;
  self->_schedulerActivity = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (unint64_t)requestType
{
  return 9;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v4), self, self->_requestIdentifier);
}

- (id)createDefaultOptions
{
  return objc_alloc_init(NSCloudKitMirroringRequestOptions);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringRequest;
  v4 = -[NSPersistentStoreRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[2] = self->_requestIdentifier;
  v4[3] = self->_options;
  v4[4] = self->_requestCompletionBlock;
  v4[8] = self->_schedulerActivity;
  *((_BYTE *)v4 + 56) = self->_isContainerRequest;
  v4[6] = -[NSMutableArray mutableCopy](self->_containerBlocks, "mutableCopy");
  return v4;
}

- (BOOL)validateForUseWithStore:(id)a3 error:(id *)a4
{
  return 1;
}

- (uint64_t)invokeCompletionBlockWithResult:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 32);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
    return -[NSCloudKitMirroringRequest _invokeContainerBlocksWithResult:](v2);
  }
  return result;
}

- (uint64_t)_invokeContainerBlocksWithResult:(uint64_t)result
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    v1 = *(void **)(result + 48);
    result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v6;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v6 != v3)
            objc_enumerationMutation(v1);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v5 + 1) + 8 * v4++) + 16))();
        }
        while (v2 != v4);
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
        v2 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)addContainerBlock:(uint64_t)a1
{
  void *v4;
  void *v5;

  if (a1)
  {
    v4 = (void *)MEMORY[0x18D76B4E4]();
    v5 = (void *)objc_msgSend(a2, "copy");
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

    objc_autoreleasePoolPop(v4);
  }
}

+ (id)allRequestClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v3 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 11);
  return (id)objc_msgSend(v2, "setWithArray:", v3, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSCloudKitMirroringRequestOptions)options
{
  return self->_options;
}

- (id)requestCompletionBlock
{
  return self->_requestCompletionBlock;
}

@end
