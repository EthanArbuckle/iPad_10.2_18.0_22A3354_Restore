@implementation NSURLQueue

+ (id)newNode
{
  return objc_alloc_init(NSURLQueueNode);
}

- (NSURLQueue)init
{
  NSURLQueue *v2;
  NSCondition *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSURLQueue;
  v2 = -[NSURLQueue init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NSCondition);
    v2->tail = 0;
    v2->monitor = v3;
    v2->count = 0;
    v2->head = 0;
    v2->waitOnTake = 1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSURLQueue clear](self, "clear");

  v3.receiver = self;
  v3.super_class = (Class)NSURLQueue;
  -[NSURLQueue dealloc](&v3, sel_dealloc);
}

- (void)put:(id)a3
{
  NSURLQueueNode *tail;
  NSURLQueueNode *v6;

  objc_msgSend(self->monitor, "lock");
  tail = self->tail;
  v6 = +[NSURLQueue newNode](NSURLQueue, "newNode");
  self->tail = v6;
  v6->next = 0;
  self->tail->object = a3;
  if (tail)
    tail->next = self->tail;
  if (!self->head)
    self->head = self->tail;
  ++self->count;
  objc_msgSend(self->monitor, "signal");
  objc_msgSend(self->monitor, "unlock");
}

- (id)take
{
  NSURLQueueNode *head;
  id v4;
  NSURLQueueNode *next;

  objc_msgSend(self->monitor, "lock");
  while (!self->count && self->waitOnTake)
    objc_msgSend(self->monitor, "wait");
  head = self->head;
  if (head)
  {
    v4 = head->object;
    --self->count;
    next = head->next;
    self->head = next;
    if (!next)
      self->tail = 0;

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(self->monitor, "unlock");
  return v4;
}

- (id)peek
{
  NSURLQueueNode *head;
  id object;

  objc_msgSend(self->monitor, "lock");
  head = self->head;
  if (head)
    object = head->object;
  else
    object = 0;
  objc_msgSend(self->monitor, "unlock");
  return object;
}

- (id)peekAt:(unint64_t)a3
{
  unint64_t v5;
  NSURLQueue *v6;
  void *count;

  objc_msgSend(self->monitor, "lock");
  if (self->count <= a3)
  {
    count = 0;
  }
  else
  {
    v5 = a3 + 1;
    v6 = self;
    do
    {
      v6 = (NSURLQueue *)v6->head;
      --v5;
    }
    while (v5);
    count = (void *)v6->count;
  }
  objc_msgSend(self->monitor, "unlock");
  return count;
}

- (BOOL)remove:(id)a3
{
  NSURLQueueNode **p_head;
  NSURLQueueNode *head;
  NSURLQueueNode *v7;
  NSURLQueueNode *v8;
  BOOL v9;

  objc_msgSend(self->monitor, "lock");
  p_head = &self->head;
  head = self->head;
  if (!head)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_14;
  }
  if (head->object != a3)
  {
    v7 = self->head;
    while (1)
    {
      v8 = v7;
      v7 = v7->next;
      if (!v7)
        goto LABEL_9;
      if (v7->object == a3)
      {
        if (head != v7)
          p_head = &v8->next;
        head = v7;
        goto LABEL_11;
      }
    }
  }
  v8 = 0;
LABEL_11:
  *p_head = head->next;
  if (self->tail == head)
    self->tail = v8;

  --self->count;
  v9 = 1;
LABEL_14:
  objc_msgSend(self->monitor, "unlock");
  return v9;
}

- (void)clear
{
  NSURLQueueNode *head;
  NSURLQueueNode *next;

  objc_msgSend(self->monitor, "lock");
  head = self->head;
  if (head)
  {
    do
    {
      next = head->next;

      head = next;
    }
    while (next);
  }
  self->count = 0;
  self->head = 0;
  self->tail = 0;
  objc_msgSend(self->monitor, "unlock");
}

- (int64_t)indexOf:(id)a3
{
  NSURLQueueNode *head;
  int64_t v6;

  objc_msgSend(self->monitor, "lock");
  head = self->head;
  if (head)
  {
    v6 = 0;
    while (head->object != a3)
    {
      ++v6;
      head = head->next;
      if (!head)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = -1;
  }
  objc_msgSend(self->monitor, "unlock");
  return v6;
}

- (BOOL)isEmpty
{
  return self->count == 0;
}

- (unint64_t)count
{
  return self->count;
}

- (BOOL)waitOnTake
{
  return self->waitOnTake;
}

- (void)setWaitOnTake:(BOOL)a3
{
  self->waitOnTake = a3;
}

@end
