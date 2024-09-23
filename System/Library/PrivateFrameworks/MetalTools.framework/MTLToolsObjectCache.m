@implementation MTLToolsObjectCache

- (MTLToolsObjectCache)init
{
  MTLToolsObjectCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLToolsObjectCache;
  v2 = -[MTLToolsObjectCache init](&v4, sel_init);
  if (v2)
  {
    v2->_map = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 514, 5, 16);
    v2->_listLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)removeKey:(id)a3
{
  os_unfair_lock_s *p_listLock;
  id *value;
  vector<id, std::allocator<id>> *p_keyRemoveList;
  __end_cap_ **var0;
  __end_cap_ **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  __end_ **v15;
  id *v16;
  __end_cap_ **v17;
  __end_ **begin;
  __end_ *v19;
  unint64_t v20;
  void *v21;
  __end_cap_ **v22;
  __end_ **v23;
  __end_ *v24;

  if (a3)
  {
    p_listLock = &self->_listLock;
    os_unfair_lock_lock(&self->_listLock);
    value = self->_keyRemoveList.var1.__value_;
    p_keyRemoveList = &self->_keyRemoveList;
    var0 = self->_keyRemoveList.var0;
    if (var0 >= (__end_cap_ **)value)
    {
      v10 = var0 - p_keyRemoveList->__begin_;
      if ((unint64_t)(v10 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v11 = (char *)value - (char *)p_keyRemoveList->__begin_;
      v12 = v11 >> 2;
      if (v11 >> 2 <= (unint64_t)(v10 + 1))
        v12 = v10 + 1;
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
        v13 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v13 = v12;
      if (v13)
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&self->_keyRemoveList.var1, v13);
      else
        v14 = 0;
      v15 = (__end_ **)&v14[8 * v10];
      v16 = (id *)&v14[8 * v13];
      *v15 = (__end_ *)a3;
      v9 = v15 + 1;
      begin = self->_keyRemoveList.__begin_;
      v17 = self->_keyRemoveList.var0;
      if (v17 != begin)
      {
        do
        {
          v19 = *--v17;
          *--v15 = v19;
        }
        while (v17 != begin);
        v17 = p_keyRemoveList->__begin_;
      }
      self->_keyRemoveList.__begin_ = v15;
      self->_keyRemoveList.var0 = v9;
      self->_keyRemoveList.var1.__value_ = v16;
      if (v17)
        operator delete(v17);
    }
    else
    {
      *var0 = (__end_cap_ *)a3;
      v9 = var0 + 1;
    }
    self->_keyRemoveList.var0 = v9;
    v20 = (char *)v9 - (char *)self->_keyRemoveList.__begin_;
    os_unfair_lock_unlock(p_listLock);
    if (v20 >= 0x189)
    {
      v21 = (void *)MEMORY[0x22E309364]();
      std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
      os_unfair_lock_lock(p_listLock);
      v23 = self->_keyRemoveList.__begin_;
      v22 = self->_keyRemoveList.var0;
      if ((unint64_t)((char *)v22 - (char *)v23) >= 0x189)
      {
        if (v23 != v22)
        {
          do
          {
            v24 = *v23;
            if (!-[NSMapTable objectForKey:](self->_map, "objectForKey:", *v23))
              -[NSMapTable removeObjectForKey:](self->_map, "removeObjectForKey:", v24);
            ++v23;
          }
          while (v23 != v22);
          v22 = p_keyRemoveList->__begin_;
        }
        self->_keyRemoveList.var0 = v22;
      }
      os_unfair_lock_unlock(p_listLock);
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->_lock);
      objc_autoreleasePoolPop(v21);
    }
  }
}

- (id)getCachedObjectForKey:(id)a3
{
  id v3;
  void *v5;

  v3 = a3;
  if (a3)
  {
    v5 = (void *)MEMORY[0x22E309364](self, a2);
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
    v3 = -[NSMapTable objectForKey:](self->_map, "objectForKey:", v3);
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_lock);
    objc_autoreleasePoolPop(v5);
  }
  return v3;
}

- (id)getCachedObjectForKey:(id)a3 onMiss:(id)a4
{
  void *v7;
  id v8;
  id v9;

  if (!a3)
    return 0;
  v7 = (void *)MEMORY[0x22E309364](self, a2);
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  v8 = -[NSMapTable objectForKey:](self->_map, "objectForKey:", a3);
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v9 = (id)(*((uint64_t (**)(id))a4 + 2))(a4);
    -[NSMapTable setObject:forKey:](self->_map, "setObject:forKey:", v9, a3);
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)&self->_lock);
  objc_autoreleasePoolPop(v7);
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsObjectCache;
  -[MTLToolsObjectCache dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  __end_ **begin;

  begin = self->_keyRemoveList.__begin_;
  if (begin)
  {
    self->_keyRemoveList.var0 = begin;
    operator delete(begin);
  }
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_lock);
}

- (id).cxx_construct
{
  MEMORY[0x22E309094](&self->_lock, a2);
  self->_keyRemoveList.__begin_ = 0;
  self->_keyRemoveList.var0 = 0;
  self->_keyRemoveList.var1.__value_ = 0;
  return self;
}

@end
