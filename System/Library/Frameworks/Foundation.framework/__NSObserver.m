@implementation __NSObserver

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

+ (_QWORD)observerWithCenter:(uint64_t)a1
{
  _QWORD *v3;

  objc_opt_self();
  v3 = (_QWORD *)objc_opt_new();
  v3[1] = a2;
  if (qword_1ECD098E0 != -1)
    dispatch_once(&qword_1ECD098E0, &__block_literal_global_26);
  os_unfair_lock_lock(&_MergedGlobals_9);
  CFSetAddValue((CFMutableSetRef)qword_1ECD098E8, v3);
  os_unfair_lock_unlock(&_MergedGlobals_9);
  return v3;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)dealloc
{
  NSNotificationCenter *nc;
  id block;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&_MergedGlobals_9);
  nc = self->nc;
  self->nc = 0;
  os_unfair_lock_unlock(&_MergedGlobals_9);
  block = self->_block;
  if (block)
    _Block_release(block);
  -[NSNotificationCenter removeObserver:](nc, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)__NSObserver;
  -[__NSObserver dealloc](&v5, sel_dealloc);
}

- (id)block
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
