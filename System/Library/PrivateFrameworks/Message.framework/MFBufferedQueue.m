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

- (BOOL)addItem:(id)a3
{
  id v4;
  NSMutableArray *queue;
  NSMutableArray *v6;
  NSMutableArray *v7;

  v4 = a3;
  self->_currentSize += -[MFBufferedQueue sizeForItem:](self, "sizeForItem:", v4);
  queue = self->_queue;
  if (!queue)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_queue;
    self->_queue = v6;

    queue = self->_queue;
  }
  -[NSMutableArray addObject:](queue, "addObject:", v4);
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
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_queue);
  else
    v3 = 0;
  -[MFBufferedQueue removeAllObjects](self, "removeAllObjects");
  if (v3)
    v4 = -[MFBufferedQueue handleItems:](self, "handleItems:", v3);
  else
    v4 = 1;

  return v4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
