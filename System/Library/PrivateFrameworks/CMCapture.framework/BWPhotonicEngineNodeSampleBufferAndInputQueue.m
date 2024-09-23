@implementation BWPhotonicEngineNodeSampleBufferAndInputQueue

- (BWPhotonicEngineNodeSampleBufferAndInputQueue)init
{
  BWPhotonicEngineNodeSampleBufferAndInputQueue *v2;
  BWPhotonicEngineNodeSampleBufferAndInputQueue *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWPhotonicEngineNodeSampleBufferAndInputQueue;
  v2 = -[BWPhotonicEngineNodeSampleBufferAndInputQueue init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sampleBufferAndInputQueueLock._os_unfair_lock_opaque = 0;
    v2->_sampleBufferAndInputQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPhotonicEngineNodeSampleBufferAndInputQueue;
  -[BWPhotonicEngineNodeSampleBufferAndInputQueue dealloc](&v3, sel_dealloc);
}

- (id)newDequeuedSampleBufferAndInput
{
  os_unfair_lock_s *p_sampleBufferAndInputQueueLock;
  id v4;

  p_sampleBufferAndInputQueueLock = &self->_sampleBufferAndInputQueueLock;
  os_unfair_lock_lock(&self->_sampleBufferAndInputQueueLock);
  if (-[NSMutableArray count](self->_sampleBufferAndInputQueue, "count"))
  {
    v4 = (id)-[NSMutableArray firstObject](self->_sampleBufferAndInputQueue, "firstObject");
    -[NSMutableArray removeObjectAtIndex:](self->_sampleBufferAndInputQueue, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_sampleBufferAndInputQueueLock);
  return v4;
}

- (void)enqueue:(id)a3
{
  os_unfair_lock_s *p_sampleBufferAndInputQueueLock;

  p_sampleBufferAndInputQueueLock = &self->_sampleBufferAndInputQueueLock;
  os_unfair_lock_lock(&self->_sampleBufferAndInputQueueLock);
  -[NSMutableArray addObject:](self->_sampleBufferAndInputQueue, "addObject:", a3);
  os_unfair_lock_unlock(p_sampleBufferAndInputQueueLock);
}

- (id)newSampleBuffersAndInputsWithPredicate:(id)a3
{
  id v3;
  os_unfair_lock_s *p_sampleBufferAndInputQueueLock;
  void *v6;

  v3 = a3;
  if (a3)
  {
    p_sampleBufferAndInputQueueLock = &self->_sampleBufferAndInputQueueLock;
    os_unfair_lock_lock(&self->_sampleBufferAndInputQueueLock);
    v6 = (void *)MEMORY[0x1A858DD40]();
    v3 = (id)-[NSMutableArray filteredArrayUsingPredicate:](self->_sampleBufferAndInputQueue, "filteredArrayUsingPredicate:", v3);
    objc_autoreleasePoolPop(v6);
    -[NSMutableArray removeObjectsInArray:](self->_sampleBufferAndInputQueue, "removeObjectsInArray:", v3);
    os_unfair_lock_unlock(p_sampleBufferAndInputQueueLock);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v3;
}

@end
