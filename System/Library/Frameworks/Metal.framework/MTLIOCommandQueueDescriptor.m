@implementation MTLIOCommandQueueDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMaxCommandBufferCount:", -[MTLIOCommandQueueDescriptor maxCommandBufferCount](self, "maxCommandBufferCount"));
  objc_msgSend(v4, "setPriority:", -[MTLIOCommandQueueDescriptor priority](self, "priority"));
  objc_msgSend(v4, "setScratchBufferAllocator:", -[MTLIOCommandQueueDescriptor scratchBufferAllocator](self, "scratchBufferAllocator"));
  objc_msgSend(v4, "setType:", -[MTLIOCommandQueueDescriptor type](self, "type"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  NSUInteger v6;
  MTLIOPriority v7;
  MTLIOCommandQueueType v9;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v6 = -[MTLIOCommandQueueDescriptor maxCommandBufferCount](self, "maxCommandBufferCount");
  if (v6 != objc_msgSend(a3, "maxCommandBufferCount"))
    return 0;
  v7 = -[MTLIOCommandQueueDescriptor priority](self, "priority");
  if (v7 != objc_msgSend(a3, "priority")
    || (objc_msgSend(-[MTLIOCommandQueueDescriptor scratchBufferAllocator](self, "scratchBufferAllocator"), "isEqual:", objc_msgSend(a3, "scratchBufferAllocator")) & 1) != 0)
  {
    return 0;
  }
  v9 = -[MTLIOCommandQueueDescriptor type](self, "type");
  return v9 == objc_msgSend(a3, "type");
}

- (unint64_t)hash
{
  int v4;
  NSUInteger v5;
  MTLIOPriority v6;
  uint64_t v7;
  MTLIOCommandQueueType v8;

  bzero(&v4, 0x28uLL);
  v5 = -[MTLIOCommandQueueDescriptor maxCommandBufferCount](self, "maxCommandBufferCount");
  v6 = -[MTLIOCommandQueueDescriptor priority](self, "priority");
  v7 = objc_msgSend(-[MTLIOCommandQueueDescriptor scratchBufferAllocator](self, "scratchBufferAllocator"), "hash");
  v8 = -[MTLIOCommandQueueDescriptor type](self, "type");
  return _MTLHashState(&v4, 0x28uLL);
}

- (MTLIOCommandQueueDescriptor)init
{
  MTLIOCommandQueueDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLIOCommandQueueDescriptor;
  result = -[MTLIOCommandQueueDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_type = 0;
    result->_maxWorkerThreads = 4;
    *(_OWORD *)&result->_maxCommandBufferCount = xmmword_18281A0C0;
    result->_scratchBufferAllocator = 0;
  }
  return result;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  __CFString *v8;
  unint64_t priority;
  int64_t type;
  MTLIOScratchBufferAllocator *scratchBufferAllocator;
  objc_super v13;
  _QWORD v14[13];

  v14[12] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)MTLIOCommandQueueDescriptor;
  v6 = -[MTLIOCommandQueueDescriptor description](&v13, sel_description);
  v14[0] = v4;
  v14[1] = CFSTR("maxCommandBufferCount =");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxCommandBufferCount);
  v8 = 0;
  v14[2] = v7;
  v14[3] = v4;
  v14[4] = CFSTR("priority =");
  priority = self->_priority;
  if (priority <= 2)
    v8 = off_1E0FE4200[priority];
  v14[5] = v8;
  v14[6] = v4;
  scratchBufferAllocator = self->_scratchBufferAllocator;
  type = self->_type;
  v14[7] = CFSTR("scratchBufferAllocator =");
  v14[8] = scratchBufferAllocator;
  v14[9] = v4;
  v14[10] = CFSTR("type =");
  v14[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", type);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 12), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLIOCommandQueueDescriptor formattedDescription:](self, "formattedDescription:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLIOCommandQueueDescriptor;
  -[MTLIOCommandQueueDescriptor dealloc](&v3, sel_dealloc);
}

- (NSUInteger)maxCommandBufferCount
{
  return self->_maxCommandBufferCount;
}

- (void)setMaxCommandBufferCount:(NSUInteger)maxCommandBufferCount
{
  self->_maxCommandBufferCount = maxCommandBufferCount;
}

- (MTLIOPriority)priority
{
  return self->_priority;
}

- (void)setPriority:(MTLIOPriority)priority
{
  self->_priority = priority;
}

- (id)scratchBufferAllocator
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setScratchBufferAllocator:(id)scratchBufferAllocator
{
  objc_setProperty_atomic(self, a2, scratchBufferAllocator, 24);
}

- (MTLIOCommandQueueType)type
{
  return self->_type;
}

- (void)setType:(MTLIOCommandQueueType)type
{
  self->_type = type;
}

- (NSUInteger)maxCommandsInFlight
{
  return self->_maxCommandsInFlight;
}

- (void)setMaxCommandsInFlight:(NSUInteger)maxCommandsInFlight
{
  self->_maxCommandsInFlight = maxCommandsInFlight;
}

- (unint64_t)maxWorkerThreads
{
  return self->_maxCommandsInFlight;
}

- (void)setMaxWorkerThreads:(unint64_t)a3
{
  self->_maxCommandsInFlight = a3;
}

@end
