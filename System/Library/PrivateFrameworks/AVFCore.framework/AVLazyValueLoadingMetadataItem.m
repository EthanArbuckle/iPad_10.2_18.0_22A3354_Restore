@implementation AVLazyValueLoadingMetadataItem

+ (id)metadataItemWithPropertiesOfMetadataItem:(id)a3 valueLoadingHandler:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithFigMetadataDictionary:valueLoadingHandler:", objc_msgSend(a3, "_figMetadataDictionaryWithValue:diviningValueDataType:", 0, 0), a4);
}

- (id)_initWithFigMetadataDictionary:(id)a3 valueLoadingHandler:(id)a4
{
  _QWORD *v5;
  AVLazyValueLoadingMetadataItemInternal *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVLazyValueLoadingMetadataItem;
  v5 = -[AVMetadataItem _initWithFigMetadataDictionary:](&v8, sel__initWithFigMetadataDictionary_, a3);
  if (v5)
  {
    v6 = objc_alloc_init(AVLazyValueLoadingMetadataItemInternal);
    v5[2] = v6;
    if (v6)
    {
      CFRetain(v6);
      if (a4)
      {
        *(_QWORD *)(v5[2] + 24) = +[AVMetadataItemValueRequest metadataItemValueRequestWithMetadataItem:](AVMetadataItemValueRequest, "metadataItemValueRequestWithMetadataItem:", v5);
        *(_QWORD *)(v5[2] + 32) = objc_msgSend(a4, "copy");
        *(_QWORD *)(v5[2] + 40) = 0;
        *(_QWORD *)(v5[2] + 56) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      }
      else
      {
        *(_QWORD *)(v5[2] + 40) = 2;
      }
      *(_QWORD *)(v5[2] + 64) = av_readwrite_dispatch_queue_create("com.apple.avfoundation.avmetadataitem");
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  AVLazyValueLoadingMetadataItemInternal *lazyMetadataItem;
  AVLazyValueLoadingMetadataItemInternal *v4;
  NSObject *readWriteQueue;
  objc_super v6;

  lazyMetadataItem = self->_lazyMetadataItem;
  if (lazyMetadataItem)
  {

    v4 = self->_lazyMetadataItem;
    readWriteQueue = v4->readWriteQueue;
    if (readWriteQueue)
    {
      dispatch_release(readWriteQueue);
      v4 = self->_lazyMetadataItem;
    }

    CFRelease(self->_lazyMetadataItem);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVLazyValueLoadingMetadataItem;
  -[AVMetadataItem dealloc](&v6, sel_dealloc);
}

- (void)_valueRequestDidFinish
{
  NSObject *readWriteQueue;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  readWriteQueue = self->_lazyMetadataItem->readWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVLazyValueLoadingMetadataItem__valueRequestDidFinish__block_invoke;
  block[3] = &unk_1E302FDB0;
  block[4] = self;
  block[5] = &v12;
  av_readwrite_dispatch_queue_write(readWriteQueue, block);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = (void *)v13[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i) + 16))();
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

_QWORD *__56__AVLazyValueLoadingMetadataItem__valueRequestDidFinish__block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result[4] + 16);
  if (*(uint64_t *)(v1 + 40) <= 2)
  {
    v2 = result;
    v3 = objc_msgSend(*(id *)(v1 + 24), "value");
    v4 = *(_QWORD *)(v2[4] + 16);
    if (v3)
    {
      *(_QWORD *)(v4 + 40) = 2;
      *(_QWORD *)(*(_QWORD *)(v2[4] + 16) + 8) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v2[4] + 16) + 24), "value"), "copyWithZone:", objc_msgSend((id)v2[4], "zone"));
      result = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v2[4] + 16) + 24), "dataType"), "copy");
      v5 = 16;
    }
    else
    {
      *(_QWORD *)(v4 + 40) = 3;
      result = (id)objc_msgSend(*(id *)(*(_QWORD *)(v2[4] + 16) + 24), "error");
      v5 = 48;
    }
    *(_QWORD *)(*(_QWORD *)(v2[4] + 16) + v5) = result;
    *(_QWORD *)(*(_QWORD *)(v2[5] + 8) + 40) = *(_QWORD *)(*(_QWORD *)(v2[4] + 16) + 56);
    *(_QWORD *)(*(_QWORD *)(v2[4] + 16) + 56) = 0;
  }
  return result;
}

- (BOOL)_valueForKeyDependsOnMetadataValue:(id)a3
{
  uint64_t v5;

  if (a3
    && ((objc_msgSend(a3, "isEqualToString:", CFSTR("value")) & 1) != 0
     || objc_msgSend(a3, "rangeOfString:options:", CFSTR("Value"), 14) != 0x7FFFFFFFFFFFFFFFLL
     || v5))
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqualToString:", CFSTR("dataType"));
  }
}

- (int64_t)_valueStatus
{
  NSObject *readWriteQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  readWriteQueue = self->_lazyMetadataItem->readWriteQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVLazyValueLoadingMetadataItem__valueStatus__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(readWriteQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__AVLazyValueLoadingMetadataItem__valueStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 16)
                                                                              + 40);
  return result;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  int64_t result;

  if (!-[AVLazyValueLoadingMetadataItem _valueForKeyDependsOnMetadataValue:](self, "_valueForKeyDependsOnMetadataValue:", a3))return 2;
  result = -[AVLazyValueLoadingMetadataItem _valueStatus](self, "_valueStatus");
  if (a4)
  {
    if (result == 3)
      *a4 = self->_lazyMetadataItem->valueLoadingError;
  }
  return result;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  NSObject *readWriteQueue;
  _BOOL4 v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "indexesOfObjectsPassingTest:", &__block_literal_global_275), "count"))
  {
    readWriteQueue = self->_lazyMetadataItem->readWriteQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_2;
    block[3] = &unk_1E3030A28;
    block[4] = self;
    block[5] = a4;
    block[6] = &v9;
    av_readwrite_dispatch_queue_write(readWriteQueue, block);
    v7 = *((_BYTE *)v10 + 24) != 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v7 = 1;
    *((_BYTE *)v10 + 24) = 1;
    if (!a4)
      goto LABEL_7;
  }
  if (v7)
    (*((void (**)(id))a4 + 2))(a4);
LABEL_7:
  _Block_object_dispose(&v9, 8);
}

BOOL __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;

  if (!a2)
    return 0;
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("value")) & 1) != 0)
    return 1;
  return objc_msgSend(a2, "rangeOfString:options:", CFSTR("Value"), 14) != 0x7FFFFFFFFFFFFFFFLL || v4 != 0;
}

void __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *global_queue;
  void *v6;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1[4] + 16);
  v3 = *(_QWORD *)(v2 + 40);
  if (v3 == 1)
  {
    v6 = (void *)a1[5];
    if (v6)
      objc_msgSend(*(id *)(v2 + 56), "addObject:", (id)objc_msgSend(v6, "copy"));
  }
  else if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    *(_QWORD *)(v2 + 40) = 1;
    v4 = (void *)a1[5];
    if (v4)
      objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 16) + 56), "addObject:", (id)objc_msgSend(v4, "copy"));
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_3;
    block[3] = &unk_1E302FA10;
    block[4] = a1[4];
    dispatch_async(global_queue, block);
  }
}

void __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 32) + 16))();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 32) = 0;
}

- (void)_waitForLoadingOfValueDependentKey:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];

  if (-[AVLazyValueLoadingMetadataItem _valueStatus](self, "_valueStatus") <= 1)
  {
    v5 = dispatch_semaphore_create(0);
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__AVLazyValueLoadingMetadataItem__waitForLoadingOfValueDependentKey___block_invoke;
    v7[3] = &unk_1E302FA10;
    v7[4] = v5;
    -[AVLazyValueLoadingMetadataItem loadValuesAsynchronouslyForKeys:completionHandler:](self, "loadValuesAsynchronouslyForKeys:completionHandler:", v6, v7);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
  }
}

intptr_t __69__AVLazyValueLoadingMetadataItem__waitForLoadingOfValueDependentKey___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)value
{
  -[AVLazyValueLoadingMetadataItem _waitForLoadingOfValueDependentKey:](self, "_waitForLoadingOfValueDependentKey:", CFSTR("value"));
  return self->_lazyMetadataItem->value;
}

- (id)dataType
{
  id result;
  objc_super v4;

  -[AVLazyValueLoadingMetadataItem _waitForLoadingOfValueDependentKey:](self, "_waitForLoadingOfValueDependentKey:", CFSTR("dataType"));
  result = self->_lazyMetadataItem->dataType;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)AVLazyValueLoadingMetadataItem;
    return -[AVMetadataItem dataType](&v4, sel_dataType);
  }
  return result;
}

@end
