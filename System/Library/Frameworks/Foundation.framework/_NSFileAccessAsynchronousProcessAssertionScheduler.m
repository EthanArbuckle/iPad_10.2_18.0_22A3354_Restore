@implementation _NSFileAccessAsynchronousProcessAssertionScheduler

+ (id)sharedInstance
{
  if (qword_1ECD0A3D8 != -1)
    dispatch_once(&qword_1ECD0A3D8, &__block_literal_global_61_0);
  return (id)qword_1ECD0A3E0;
}

- (void)removeAssertionWithToken:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_assertionsPerPID, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a3, "PID")));
  v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "count");
    if (v8 <= 1 && v9 >= 3)
      v11 = (void *)objc_msgSend(v6, "objectAtIndex:", 2);
    else
      v11 = 0;
    objc_msgSend(a3, "invalidate");
    objc_msgSend(v6, "removeObjectAtIndex:", v8);
    os_unfair_lock_unlock(p_lock);
    if (v11)
      objc_msgSend(v11, "beginAssertion");
  }
}

- (id)addAssertionWithName:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  id v8;
  unint64_t v9;
  _NSFileAccessAsynchronousProcessAssertion *v10;

  v4 = *(_QWORD *)&a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = (id)-[NSMutableDictionary objectForKey:](self->_assertionsPerPID, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKey:](self->_assertionsPerPID, "setObject:forKey:", v8, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));

  }
  v9 = objc_msgSend(v8, "count");
  v10 = -[_NSFileAccessAsynchronousProcessAssertion initWithPID:name:]([_NSFileAccessAsynchronousProcessAssertion alloc], "initWithPID:name:", v4, a3);
  objc_msgSend(v8, "addObject:", v10);
  os_unfair_lock_unlock(p_lock);
  if (v9 <= 1)
    -[_NSFileAccessAsynchronousProcessAssertion beginAssertion](v10, "beginAssertion");
  return v10;
}

- (_NSFileAccessAsynchronousProcessAssertionScheduler)init
{
  _NSFileAccessAsynchronousProcessAssertionScheduler *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_NSFileAccessAsynchronousProcessAssertionScheduler;
  v2 = -[_NSFileAccessAsynchronousProcessAssertionScheduler init](&v4, sel_init);
  if (v2)
  {
    v2->_assertionsPerPID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

@end
