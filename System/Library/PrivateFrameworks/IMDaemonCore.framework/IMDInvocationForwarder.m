@implementation IMDInvocationForwarder

- (IMDInvocationForwarder)initWithTargets:(id)a3
{
  IMDInvocationForwarder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDInvocationForwarder;
  v4 = -[IMDInvocationForwarder init](&v6, sel_init);
  if (v4)
  {
    v4->_targets = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSLock lock](self->_lock, "lock");

  -[NSLock unlock](self->_lock, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)IMDInvocationForwarder;
  -[IMDInvocationForwarder dealloc](&v3, sel_dealloc);
}

- (void)addTarget:(id)a3
{
  NSMutableArray *targets;

  if (a3)
  {
    -[NSLock lock](self->_lock, "lock");
    if (-[NSMutableArray containsObjectIdenticalTo:](self->_targets, "containsObjectIdenticalTo:", a3))
    {
      targets = self->_targets;
      if (!targets)
      {
        targets = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        self->_targets = targets;
      }
      -[NSMutableArray addObject:](targets, "addObject:", a3);
    }
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)removeTarget:(id)a3
{
  if (a3)
  {
    -[NSLock lock](self->_lock, "lock");
    -[NSMutableArray removeObjectIdenticalTo:](self->_targets, "removeObjectIdenticalTo:", a3);
    if (!-[NSMutableArray count](self->_targets, "count"))
    {

      self->_targets = 0;
    }
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5;

  -[NSLock lock](self->_lock, "lock");
  v5 = (id)objc_msgSend((id)-[NSMutableArray __imFirstObject](self->_targets, "__imFirstObject"), "methodSignatureForSelector:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  objc_super v7;

  -[NSLock lock](self->_lock, "lock");
  v7.receiver = self;
  v7.super_class = (Class)IMDInvocationForwarder;
  if (-[IMDInvocationForwarder respondsToSelector:](&v7, sel_respondsToSelector_, a3))
  {
    v5 = 1;
  }
  else
  {
    -[NSMutableArray __imFirstObject](self->_targets, "__imFirstObject");
    v5 = objc_opt_respondsToSelector();
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  NSMutableArray *targets;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  targets = self->_targets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](targets, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(targets);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1D17EA968]();
        objc_msgSend(a3, "invokeWithTarget:", v9);
        objc_autoreleasePoolPop(v10);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](targets, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (NSMutableArray)_targets
{
  return self->_targets;
}

- (void)set_targets:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSLock)_lock
{
  return self->_lock;
}

- (void)set_lock:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
