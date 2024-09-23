@implementation MFBufferedQueue

- (MFBufferedQueue)initWithMaximumSize:(unsigned int)a3 latency:(double)a4
{
  MFBufferedQueue *v6;
  CFAbsoluteTime Current;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFBufferedQueue;
  v6 = -[MFBufferedQueue init](&v9, sel_init);
  if (v6)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6->_maximumSize = a3;
    v6->_maximumLatency = a4;
    v6->_timeOfLastFlush = Current;
  }
  return v6;
}

- (MFBufferedQueue)init
{
  return -[MFBufferedQueue initWithMaximumSize:latency:](self, "initWithMaximumSize:latency:", 0, 1.0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFBufferedQueue;
  -[MFBufferedQueue dealloc](&v3, sel_dealloc);
}

- (BOOL)addItem:(id)a3
{
  NSMutableArray *queue;

  self->_currentSize += -[MFBufferedQueue sizeForItem:](self, "sizeForItem:");
  queue = self->_queue;
  if (!queue)
  {
    queue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_queue = queue;
  }
  -[NSMutableArray addObject:](queue, "addObject:", a3);
  -[MFBufferedQueue flushIfNecessary](self, "flushIfNecessary");
  return 1;
}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->_queue, "removeAllObjects");
  self->_timeOfLastFlush = CFAbsoluteTimeGetCurrent();
  self->_currentSize = 0;
}

- (BOOL)_flush
{
  void *v3;
  BOOL v4;

  if (-[NSMutableArray count](self->_queue, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_queue);
    -[MFBufferedQueue removeAllObjects](self, "removeAllObjects");
    if (v3)
    {
      v4 = -[MFBufferedQueue handleItems:](self, "handleItems:", v3);

      return v4;
    }
  }
  else
  {
    -[MFBufferedQueue removeAllObjects](self, "removeAllObjects");
  }
  return 1;
}

- (BOOL)flushIfNecessary
{
  return self->_currentSize < self->_maximumSize
      && CFAbsoluteTimeGetCurrent() <= self->_timeOfLastFlush + self->_maximumLatency
      || -[MFBufferedQueue _flush](self, "_flush");
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_queue, "count") == 0;
}

- (unint64_t)sizeForItem:(id)a3
{
  return 1;
}

- (BOOL)handleItems:(id)a3
{
  return 1;
}

- (unsigned)size
{
  return self->_currentSize;
}

- (unsigned)maximumSize
{
  return self->_maximumSize;
}

- (void)setMaximumSize:(unsigned int)a3
{
  self->_maximumSize = a3;
}

- (double)maximumLatency
{
  return self->_maximumLatency;
}

- (void)setMaximumLatency:(double)a3
{
  self->_maximumLatency = a3;
}

@end
