@implementation GKUpdateGroupNotifier

- (GKUpdateGroupNotifier)init
{
  GKUpdateGroupNotifier *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKUpdateGroupNotifier;
  v2 = -[GKUpdateGroupNotifier init](&v4, sel_init);
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v2->_updateQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_group, 0);

  v3.receiver = self;
  v3.super_class = (Class)GKUpdateGroupNotifier;
  -[GKUpdateGroupNotifier dealloc](&v3, sel_dealloc);
}

- (GKUpdateGroupNotifier)retain
{
  dispatch_group_t *Weak;
  objc_super v5;

  -[NSLock lock](self->_lock, "lock");
  v5.receiver = self;
  v5.super_class = (Class)GKUpdateGroupNotifier;
  -[GKUpdateGroupNotifier retain](&v5, sel_retain);
  if (objc_loadWeak((id *)&self->_group)
    && (unint64_t)-[GKUpdateGroupNotifier retainCount](self, "retainCount") >= 2)
  {
    Weak = (dispatch_group_t *)objc_loadWeak((id *)&self->_group);
    dispatch_group_enter(Weak[3]);
  }
  -[NSLock unlock](self->_lock, "unlock");
  return self;
}

- (void)release
{
  NSLock *v3;
  dispatch_group_t *Weak;
  objc_super v5;

  v3 = self->_lock;
  -[NSLock lock](v3, "lock");
  if (objc_loadWeak((id *)&self->_group)
    && (unint64_t)-[GKUpdateGroupNotifier retainCount](self, "retainCount") >= 2)
  {
    Weak = (dispatch_group_t *)objc_loadWeak((id *)&self->_group);
    dispatch_group_leave(Weak[3]);
  }
  v5.receiver = self;
  v5.super_class = (Class)GKUpdateGroupNotifier;
  -[GKUpdateGroupNotifier release](&v5, sel_release);
  -[NSLock unlock](v3, "unlock");

}

- (void)updateError:(id)a3
{
  GKUpdateGroup **p_group;

  if (a3 && !self->_error)
  {
    -[GKUpdateGroupNotifier setError:](self, "setError:");
    p_group = &self->_group;
    if (!objc_msgSend(objc_loadWeak((id *)p_group), "error"))
      objc_msgSend(objc_loadWeak((id *)p_group), "setError:", a3);
  }
}

- (void)addUpdate:(id)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (!a4 || self->_error)
  {
    -[NSLock lock](self->_lock, "lock");
    v6 = -[GKUpdateGroupNotifier retainCount](self, "retainCount");
    v11 = _Block_copy(a3);
    -[NSMutableArray addObject:](self->_updateQueue, "addObject:");
    v7 = -[GKUpdateGroupNotifier retainCount](self, "retainCount");
    -[NSLock unlock](self->_lock, "unlock");
    if (v6 != v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("update block is not allowed to reference notifier"));
      v10 = objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (retainCount == afterRetainCount)\n[%s (%s:%d)]"), v9, "-[GKUpdateGroupNotifier addUpdate:error:]", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKUpdateGroup+NoARC.m"), "lastPathComponent"), "UTF8String"), 118);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
    }

  }
  else
  {
    -[GKUpdateGroupNotifier updateError:](self, "updateError:", a4);
  }
}

- (void)addUpdatesFromGroup:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__GKUpdateGroupNotifier_addUpdatesFromGroup___block_invoke;
  v3[3] = &unk_1E75B2488;
  v3[4] = a3;
  v3[5] = self;
  objc_msgSend(a3, "join:", v3);
}

uint64_t __45__GKUpdateGroupNotifier_addUpdatesFromGroup___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[4];

  result = objc_msgSend(*(id *)(a1 + 32), "updateCount");
  if (result >= 1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __45__GKUpdateGroupNotifier_addUpdatesFromGroup___block_invoke_2;
    v3[3] = &unk_1E75B2460;
    return objc_msgSend(*(id *)(a1 + 40), "addUpdate:error:", v3, objc_msgSend(*(id *)(a1 + 32), "error"));
  }
  return result;
}

uint64_t __45__GKUpdateGroupNotifier_addUpdatesFromGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyUpdates");
}

- (NSLock)lock
{
  return (NSLock *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (GKUpdateGroup)group
{
  return (GKUpdateGroup *)objc_loadWeak((id *)&self->_group);
}

- (void)setGroup:(id)a3
{
  objc_storeWeak((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
}

@end
