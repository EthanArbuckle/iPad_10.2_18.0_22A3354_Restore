@implementation _NSOperationQueueProgress

- (id)initWithQueue:(id)result
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_NSOperationQueueProgress;
    result = objc_msgSendSuper2(&v3, sel_initWithParent_userInfo_, 0, 0);
    if (result)
    {
      *((_QWORD *)result + 15) = a2;
      *((_DWORD *)result + 32) = 0;
    }
  }
  return result;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_NSOperationQueueProgress;
  -[NSProgress setTotalUnitCount:](&v4, sel_setTotalUnitCount_, a3);
  os_unfair_lock_lock(&self->_queueLock);
  atomic_store(1u, &self->_queue->_iqp.__progressReporting);
  os_unfair_lock_unlock(&self->_queueLock);
}

@end
