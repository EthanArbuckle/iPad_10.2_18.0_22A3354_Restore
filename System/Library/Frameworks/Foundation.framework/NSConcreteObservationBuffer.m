@implementation NSConcreteObservationBuffer

- (NSConcreteObservationBuffer)initWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5
{
  NSConcreteObservationBuffer *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSConcreteObservationBuffer;
  v8 = -[NSObservationBuffer initWithMaximumObjectCount:fullPolicy:outputQueue:](&v10, sel_initWithMaximumObjectCount_fullPolicy_outputQueue_);
  if (v8)
  {
    v8->_dequeue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_policy = a4;
    v8->_maxCount = a3;
    v8->_outputQueue = (NSOperationQueue *)a5;
    v8->_inputQueue = (OS_dispatch_queue *)dispatch_queue_create("Input Queue", 0);
    v8->_automaticallyEmitsObjects = 1;
    pthread_mutex_init(&v8->_lock, 0);
  }
  return v8;
}

- (void)dealloc
{
  _opaque_pthread_mutex_t *p_lock;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);

  self->_dequeue = 0;
  pthread_mutex_unlock(p_lock);

  dispatch_release((dispatch_object_t)self->_inputQueue);
  v4.receiver = self;
  v4.super_class = (Class)NSConcreteObservationBuffer;
  -[NSObservationSource dealloc](&v4, sel_dealloc);
}

- (void)_alreadyOnQueueEmitObject
{
  __objc2_class **v3;
  __objc2_class *v4;
  int v5;
  uint64_t StackObservedValueClassAndBoxSize;
  uint64_t v7;
  Class v8;
  _DWORD *v9;
  uint64_t v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = _popFront((uint64_t)self);
  v4 = v3[1];
  v5 = *((_DWORD *)v3 + 6);
  v10 = 0;
  StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(&v10);
  MEMORY[0x1E0C80A78](StackObservedValueClassAndBoxSize);
  v9 = objc_constructInstance(v8, (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9[6] = v5;
  *((_QWORD *)v9 + 1) = v4;
  *((_QWORD *)v9 + 2) = self;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSConcreteObservationBuffer;
    -[NSConcreteObservationBuffer _receiveBox:](&v11, sel__receiveBox_, v9);
  }
}

- (void)emitObject
{
  NSOperationQueue *outputQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  outputQueue = self->_outputQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__NSConcreteObservationBuffer_emitObject__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](outputQueue, "addOperationWithBlock:", v3);
}

uint64_t __41__NSConcreteObservationBuffer_emitObject__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_alreadyOnQueueEmitObject");
}

- (void)_alreadyOnQueueEmitAllObjects
{
  void *v3;
  int updated;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  _QWORD v8[5];
  _OWORD v9[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_suspend((dispatch_object_t)self->_inputQueue);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke;
  v8[3] = &unk_1E0F516E0;
  v8[4] = self;
  if (self->_state)
  {
    pthread_mutex_lock(&self->_lock);
    v3 = (void *)-[NSMutableArray copy](self->_dequeue, "copy");
    -[NSMutableArray removeAllObjects](self->_dequeue, "removeAllObjects");
    updated = updateState((uint64_t)self);
    pthread_mutex_unlock(&self->_lock);
    if (updated == 2 || updated == 1)
      (*(void (**)(void))(-[NSConcreteObservationBuffer bufferFullHandler](self, "bufferFullHandler") + 16))();
    memset(v9, 0, sizeof(v9));
    v5 = objc_msgSend(v3, "count");
    v6 = v5;
    v7 = (uint64_t *)v9;
    if (v5 >= 0x21)
      v7 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
    objc_msgSend(v3, "getObjects:range:", v7, 0, v6);
    __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke((uint64_t)v8, v7, v6);
    if (v7 != (uint64_t *)v9)
      free(v7);

  }
  else
  {
    __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke((uint64_t)v8, (uint64_t *)&emptyValue, 1);
  }
  dispatch_resume((dispatch_object_t)self->_inputQueue);
}

uint64_t __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke(uint64_t result, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t StackObservedValueClassAndBoxSize;
  uint64_t v11;
  Class v12;
  _DWORD *v13;
  _QWORD v15[2];
  id (*v16)(id, uint64_t);
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    v5 = result;
    do
    {
      v6 = *a2++;
      v7 = *(_QWORD *)(v5 + 32);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v16 = __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke_2;
      v17 = &unk_1E0F516B8;
      v18 = v7;
      v19[0] = 0;
      v8 = *(_QWORD *)(v6 + 8);
      v9 = *(_DWORD *)(v6 + 24);
      StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v19);
      MEMORY[0x1E0C80A78](StackObservedValueClassAndBoxSize);
      v13 = objc_constructInstance(v12, (char *)&v15[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
      v13[6] = v9;
      *((_QWORD *)v13 + 1) = v8;
      *((_QWORD *)v13 + 2) = v7;
      result = (uint64_t)v16(v15, (uint64_t)v13);
      --v3;
    }
    while (v3);
  }
  return result;
}

id __60__NSConcreteObservationBuffer__alreadyOnQueueEmitAllObjects__block_invoke_2(id result, uint64_t a2)
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2 + 24))
  {
    v2.receiver = (id)*((_QWORD *)result + 4);
    v2.super_class = (Class)NSConcreteObservationBuffer;
    return objc_msgSendSuper2(&v2, sel__receiveBox_, a2);
  }
  return result;
}

- (void)emitAllObjects
{
  NSOperationQueue *outputQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  outputQueue = self->_outputQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__NSConcreteObservationBuffer_emitAllObjects__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](outputQueue, "addOperationWithBlock:", v3);
}

uint64_t __45__NSConcreteObservationBuffer_emitAllObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_alreadyOnQueueEmitAllObjects");
}

- (void)_receiveBox:(id)a3
{
  int64_t policy;
  uint64_t v6;
  _QWORD block[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  if (self->_state == 2)
  {
    policy = self->_policy;
    if (policy == 2)
    {
      -[NSConcreteObservationBuffer _mergeChanges](self, "_mergeChanges");
    }
    else if (policy == 1)
    {
      do
        _popFront((uint64_t)self);
      while (self->_state == 2);
    }
  }
  v6 = objc_msgSend(a3, "copyToHeap");
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = __Block_byref_object_copy__19;
  v8[4] = __Block_byref_object_dispose__19;
  v8[5] = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NSConcreteObservationBuffer__receiveBox___block_invoke;
  block[3] = &unk_1E0F51708;
  block[4] = v6;
  block[5] = v8;
  dispatch_sync((dispatch_queue_t)self->_inputQueue, block);
  _Block_object_dispose(v8, 8);
}

uint64_t __43__NSConcreteObservationBuffer__receiveBox___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int updated;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
  {
    v2 = result;
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 72));
    objc_msgSend(*(id *)(v1 + 136), "addObject:", *(_QWORD *)(v2 + 32));

    updated = updateState(v1);
    result = pthread_mutex_unlock((pthread_mutex_t *)(v1 + 72));
    if (updated == 2 || updated == 1)
      return (*(uint64_t (**)(void))(objc_msgSend((id)v1, "bufferFullHandler") + 16))();
  }
  return result;
}

- (id)bufferFullHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setBufferFullHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (BOOL)automaticallyEmitsObjects
{
  return self->_automaticallyEmitsObjects;
}

- (void)setAutomaticallyEmitsObjects:(BOOL)a3
{
  self->_automaticallyEmitsObjects = a3;
}

- (BOOL)isMemoryPressureSensitive
{
  return self->_memoryPressureSensitive;
}

- (void)setMemoryPressureSensitive:(BOOL)a3
{
  self->_memoryPressureSensitive = a3;
}

@end
