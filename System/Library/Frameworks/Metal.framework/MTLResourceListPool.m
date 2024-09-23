@implementation MTLResourceListPool

- (MTLResourceListPool)initWithResourceListCapacity:(int)a3
{
  MTLResourceListPool *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLResourceListPool;
  result = -[MTLResourceListPool init](&v5, sel_init);
  if (result)
  {
    result->_priv.queue.tqh_first = 0;
    result->_resourceListCapacity = a3;
    result->_priv.queue.tqh_last = (id *)&result->_priv.queue.tqh_first;
    *(_QWORD *)&result->_priv.lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)purge
{
  os_unfair_lock_s *p_lock;
  MTLResourceList *tqh_first;
  id *tqe_prev;
  MTLResourceList *tqe_next;
  MTLResourceList *v7;

  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  tqh_first = self->_priv.queue.tqh_first;
  if (tqh_first)
  {
    do
    {
      tqe_next = tqh_first->_listPriv.entry.tqe_next;
      tqe_prev = tqh_first->_listPriv.entry.tqe_prev;
      if (tqe_next)
      {
        tqe_next->_listPriv.entry.tqe_prev = tqe_prev;
        v7 = tqh_first->_listPriv.entry.tqe_next;
        tqe_prev = tqh_first->_listPriv.entry.tqe_prev;
      }
      else
      {
        v7 = 0;
        self->_priv.queue.tqh_last = tqe_prev;
      }
      *tqe_prev = v7;
      --self->_priv.count;

      tqh_first = tqe_next;
    }
    while (tqe_next);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  MTLResourceList *tqh_first;
  id *tqe_prev;
  MTLResourceList *tqe_next;
  MTLResourceList *v6;
  objc_super v7;

  tqh_first = self->_priv.queue.tqh_first;
  if (tqh_first)
  {
    do
    {
      tqe_next = tqh_first->_listPriv.entry.tqe_next;
      tqe_prev = tqh_first->_listPriv.entry.tqe_prev;
      if (tqe_next)
      {
        tqe_next->_listPriv.entry.tqe_prev = tqe_prev;
        v6 = tqh_first->_listPriv.entry.tqe_next;
        tqe_prev = tqh_first->_listPriv.entry.tqe_prev;
      }
      else
      {
        v6 = 0;
        self->_priv.queue.tqh_last = tqe_prev;
      }
      *tqe_prev = v6;
      --self->_priv.count;

      tqh_first = tqe_next;
    }
    while (tqe_next);
  }
  v7.receiver = self;
  v7.super_class = (Class)MTLResourceListPool;
  -[MTLResourceListPool dealloc](&v7, sel_dealloc);
}

- (int)availableCount
{
  return self->_priv.count;
}

@end
