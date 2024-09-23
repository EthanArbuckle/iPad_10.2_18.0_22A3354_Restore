@implementation MIOFifoBuffer

- (MIOFifoBuffer)initWithCapacity:(unint64_t)a3
{
  MIOFifoBuffer *v4;
  MIOFifoBuffer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MIOFifoBuffer;
  v4 = -[MIOFifoBuffer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, &v4->_queue);
  }
  return v5;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unint64_t)usage
{
  return CMSimpleQueueGetCount(self->_queue);
}

- (void)dealloc
{
  opaqueCMSimpleQueue *queue;
  objc_super v4;

  -[MIOFifoBuffer emptyFifoBuffer](self, "emptyFifoBuffer");
  queue = self->_queue;
  if (queue)
    CFRelease(queue);
  v4.receiver = self;
  v4.super_class = (Class)MIOFifoBuffer;
  -[MIOFifoBuffer dealloc](&v4, sel_dealloc);
}

- (void)emptyFifoBuffer
{
  MIOFifoBuffer *v2;
  id v3;

  v2 = self;
  while (-[MIOFifoBuffer usage](self, "usage"))
  {
    v3 = -[MIOFifoBuffer dequeue](v2, "dequeue");
    self = v2;
  }
}

- (BOOL)enqueue:(id)a3
{
  id v4;
  opaqueCMSimpleQueue *queue;
  id v6;

  v4 = a3;
  queue = self->_queue;
  v6 = v4;
  LOBYTE(queue) = CMSimpleQueueEnqueue(queue, v6) == 0;

  return (char)queue;
}

- (id)dequeue
{
  return (id)(id)CMSimpleQueueDequeue(self->_queue);
}

- (BOOL)prohibitDropping
{
  return self->_prohibitDropping;
}

- (void)setProhibitDropping:(BOOL)a3
{
  self->_prohibitDropping = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
