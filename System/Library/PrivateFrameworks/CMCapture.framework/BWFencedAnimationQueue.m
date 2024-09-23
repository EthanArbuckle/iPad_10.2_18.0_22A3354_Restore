@implementation BWFencedAnimationQueue

- (id)dequeueFencedAnimation
{
  os_unfair_lock_s *p_queueLock;
  id v4;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = (id)-[NSMutableArray firstObject](self->_fencedAnimationQueue, "firstObject");
  if (v4)
  {
    -[NSMutableArray removeObject:](self->_fencedAnimationQueue, "removeObject:", v4);
    os_unfair_lock_unlock(p_queueLock);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fencedAnimationQueueSemaphore);
  }
  else
  {
    os_unfair_lock_unlock(p_queueLock);
  }
  return v4;
}

- (BWFencedAnimationQueue)initWithQueueSize:(unsigned int)a3
{
  BWFencedAnimationQueue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWFencedAnimationQueue;
  v4 = -[BWFencedAnimationQueue init](&v6, sel_init);
  if (v4)
  {
    v4->_fencedAnimationQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_fencedAnimationQueueSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a3);
    v4->_fencedAnimationFramerateThrottle = 0;
    v4->_timeOfLastFencedAnimation = 0.0;
    v4->_queueLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_fencedAnimationQueue, "count");
}

- (void)enqueueFencedAnimation:(id)a3
{
  double v5;
  double v6;
  NSObject *fencedAnimationQueueSemaphore;
  dispatch_time_t v8;

  if (self->_fencedAnimationFramerateThrottle)
  {
    v5 = CFAbsoluteTimeGetCurrent() - self->_timeOfLastFencedAnimation;
    v6 = (float)(1.0 / (float)self->_fencedAnimationFramerateThrottle);
    if (v5 < v6)
      usleep(((v6 - v5) * 1000000.0));
  }
  fencedAnimationQueueSemaphore = self->_fencedAnimationQueueSemaphore;
  v8 = dispatch_time(0, 500000000);
  if (!dispatch_semaphore_wait(fencedAnimationQueueSemaphore, v8))
  {
    os_unfair_lock_lock(&self->_queueLock);
    -[NSMutableArray addObject:](self->_fencedAnimationQueue, "addObject:", a3);
    os_unfair_lock_unlock(&self->_queueLock);
    self->_timeOfLastFencedAnimation = CFAbsoluteTimeGetCurrent();
  }
}

- (void)dealloc
{
  objc_super v3;

  -[BWFencedAnimationQueue flush](self, "flush");

  dispatch_release((dispatch_object_t)self->_fencedAnimationQueueSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)BWFencedAnimationQueue;
  -[BWFencedAnimationQueue dealloc](&v3, sel_dealloc);
}

- (void)flush
{
  os_unfair_lock_s *p_queueLock;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  while (-[NSMutableArray count](self->_fencedAnimationQueue, "count"))
  {
    -[NSMutableArray removeObjectAtIndex:](self->_fencedAnimationQueue, "removeObjectAtIndex:", 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fencedAnimationQueueSemaphore);
  }
  os_unfair_lock_unlock(p_queueLock);
}

@end
