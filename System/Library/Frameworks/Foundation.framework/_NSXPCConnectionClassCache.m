@implementation _NSXPCConnectionClassCache

- (os_unfair_lock_s)containsClass:(os_unfair_lock_s *)result
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    v4 = result + 4;
    os_unfair_lock_lock_with_options();
    v5 = *(void **)&v3[2]._os_unfair_lock_opaque;
    if (!v5)
    {
      v5 = (void *)objc_opt_new();
      *(_QWORD *)&v3[2]._os_unfair_lock_opaque = v5;
    }
    v6 = objc_msgSend(v5, "containsObject:", a2);
    os_unfair_lock_unlock(v4);
    return (os_unfair_lock_s *)v6;
  }
  return result;
}

- (void)addClass:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock_with_options();
    v5 = *(void **)(a1 + 8);
    if (!v5)
    {
      v5 = (void *)objc_opt_new();
      *(_QWORD *)(a1 + 8) = v5;
    }
    objc_msgSend(v5, "addObject:", a2);
    os_unfair_lock_unlock(v4);
  }
}

- (_NSXPCConnectionClassCache)init
{
  _NSXPCConnectionClassCache *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSXPCConnectionClassCache;
  result = -[_NSXPCConnectionClassCache init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSXPCConnectionClassCache;
  -[_NSXPCConnectionClassCache dealloc](&v3, sel_dealloc);
}

- (void)clear
{
  os_unfair_lock_s *v2;
  void *v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock_with_options();
    v3 = *(void **)(a1 + 8);
    if (!v3)
    {
      v3 = (void *)objc_opt_new();
      *(_QWORD *)(a1 + 8) = v3;
    }
    objc_msgSend(v3, "removeAllObjects");
    os_unfair_lock_unlock(v2);
  }
}

@end
