@implementation PKLRUCache

- (PKLRUCache)init
{
  PKLRUCache *v2;
  PKLRUCache *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMapTable *itemTable;
  uint64_t v8;
  NSMutableArray *freeKeys;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKLRUCache;
  v2 = -[PKLRUCache init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v4, v5, 2048);
    itemTable = v3->_itemTable;
    v3->_itemTable = (NSMapTable *)v6;

    v3->_totalCostLimit = 0x4000000;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4096);
    v8 = objc_claimAutoreleasedReturnValue();
    freeKeys = v3->_freeKeys;
    v3->_freeKeys = (NSMutableArray *)v8;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PKLRUCache removeAllObjects]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PKLRUCache;
  -[PKLRUCache dealloc](&v3, sel_dealloc);
}

- (void)removeAllObjects
{
  os_unfair_lock_s *v2;
  id *v3;
  id v4;
  void *v5;
  id *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    while (1)
    {
      v3 = *(id **)(a1 + 8);
      if (!v3)
        break;
      v4 = v3[3];
      v5 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v4;
      v6 = v3;

      v7 = v6[1];
      v6[1] = 0;

      v8 = v6[5];
      v6[5] = 0;

      v9 = v6[4];
      v6[4] = 0;

      v10 = v3[3];
      v3[3] = 0;

    }
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    v11 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    *(_QWORD *)(a1 + 40) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (char)objectForKey:(char *)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    -[PKLRUCache objectForKey:scaleFactor:](a1, v3, 1);
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_QWORD)_keyItemForKey:(uint64_t)a3 scaleFactor:
{
  id v5;
  void *v6;
  _QWORD *p_isa;
  const char *v8;
  PKLRUCacheKey *v9;
  const char *v10;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (a3 == 1)
    {
      p_isa = v5;
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      objc_msgSend(*(id *)(a1 + 48), "lastObject");
      p_isa = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "removeLastObject");
      if (p_isa)
      {
        p_isa[2] = a3;
        objc_setProperty_nonatomic_copy(p_isa, v8, v6, 8);
      }
    }
    else
    {
      v9 = objc_alloc_init(PKLRUCacheKey);
      p_isa = &v9->super.isa;
      if (v9)
      {
        objc_setProperty_nonatomic_copy(v9, v10, v6, 8);
        p_isa[2] = a3;
      }
    }
  }
  else
  {
    p_isa = 0;
  }

  return p_isa;
}

- (char)objectForKey:(uint64_t)a3 scaleFactor:
{
  id v5;
  os_unfair_lock_s *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  id v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id v16;

  v5 = a2;
  if (a1)
  {
    v6 = (os_unfair_lock_s *)(a1 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)a1 + 14);
    -[PKLRUCache _keyItemForKey:scaleFactor:]((uint64_t)a1, v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1 + 4), "objectForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (id *)v8;
    if (v8)
    {
      v10 = *(id *)(v8 + 40);
      v11 = (id *)(a1 + 16);
      if (v9 != *((id **)a1 + 2))
      {
        v12 = (id *)v9[4];
        if (v12)
          objc_storeStrong(v12 + 3, v9[3]);
        v13 = (id *)v9[3];
        if (v13)
          objc_storeStrong(v13 + 4, v9[4]);
        objc_storeStrong(v9 + 4, *((id *)a1 + 2));
        v15 = (id *)*((_QWORD *)a1 + 1);
        v14 = (id *)(a1 + 8);
        if (v9 == v15)
          objc_storeStrong(v14, v9[3]);
        v16 = v9[3];
        v9[3] = 0;

        objc_storeStrong((id *)*v11 + 3, v9);
        objc_storeStrong(v11, v9);
      }
    }
    else
    {
      v10 = 0;
    }
    a1 = (char *)v10;

    os_unfair_lock_unlock(v6);
  }

  return a1;
}

- (void)_removeItem:(uint64_t)a1
{
  id *v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id *v21;

  v4 = a2;
  if (!a1)
    goto LABEL_14;
  v5 = v4[4];
  v21 = v4;
  v6 = v5;
  v7 = v21[3];
  v8 = v7;
  if (v6)
  {
    v9 = (void *)v6[3];
    v6[3] = v7;

    if (!v8)
    {
      objc_storeStrong((id *)(a1 + 16), v5);
      v10 = (void *)v6[3];
      v6[3] = 0;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v11 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;

  if (v8)
  {
    v12 = (void *)v8[4];
    v8[4] = 0;

LABEL_7:
    v13 = v6;
    v10 = (void *)v8[4];
    v8[4] = v13;
    goto LABEL_8;
  }
  v10 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
LABEL_8:

  v14 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 40) -= v21[6];
  objc_msgSend(v14, "removeObjectForKey:", v21[1]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") <= 0xFFF)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v21[1]);
  v15 = v21[1];
  v21[1] = 0;

  v16 = v21[5];
  v21[5] = 0;

  v17 = v21[3];
  v21[3] = 0;

  v18 = v21[4];
  v21[4] = 0;

  if (*(uint64_t *)(a1 + 72) <= 1023)
  {
    v20 = *(void **)(a1 + 24);
    v19 = a1 + 24;
    objc_storeStrong(v21 + 3, v20);
    objc_storeStrong((id *)v19, a2);
    ++*(_QWORD *)(v19 + 48);
  }

  v4 = v21;
LABEL_14:

}

- (void)setObject:(void *)a3 forKey:(unint64_t)a4 cost:
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (a1)
    -[PKLRUCache setObject:forKey:cost:scaleFactor:](a1, v8, v7, a4, 1);

}

- (void)setObject:(void *)a3 forKey:(unint64_t)a4 cost:(uint64_t)a5 scaleFactor:
{
  id v10;
  void *v11;
  void *v12;
  void **i;
  unint64_t v14;
  PKLRUCacheItem *v15;
  PKLRUCacheItem *next;
  uint64_t v17;
  NSCopying *key;
  PKLRUCacheItem *v19;
  PKLRUCacheItem *v20;
  id *v21;
  id v22;
  id v23;
  void *v24;
  id v25;

  v25 = a2;
  v10 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    -[PKLRUCache _keyItemForKey:scaleFactor:](a1, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[PKLRUCache _removeItem:](a1, v12);
    for (i = (void **)(a1 + 8); *i; -[PKLRUCache _removeItem:](a1, *i))
    {
      v14 = *(_QWORD *)(a1 + 64);
      if (!v14 || *(_QWORD *)(a1 + 40) + a4 <= v14)
        break;
    }
    if (*(uint64_t *)(a1 + 72) < 1)
    {
      v15 = objc_alloc_init(PKLRUCacheItem);
    }
    else
    {
      v15 = (PKLRUCacheItem *)*(id *)(a1 + 24);
      objc_storeStrong((id *)(a1 + 24), *(id *)(*(_QWORD *)(a1 + 24) + 24));
      --*(_QWORD *)(a1 + 72);
      next = v15->_next;
      v15->_next = 0;

    }
    v17 = objc_msgSend(v11, "copyWithZone:", 0);
    key = v15->_key;
    v15->_key = (NSCopying *)v17;

    objc_storeStrong(&v15->_object, a2);
    v15->_cost = a4;
    v19 = v15;
    v20 = v19;
    v21 = (id *)(a1 + 16);
    if (*(_QWORD *)(a1 + 8))
    {
      objc_storeStrong((id *)&v19->_prev, *v21);
      objc_storeStrong((id *)*v21 + 3, v15);
      v22 = v20;
      i = (void **)(a1 + 16);
    }
    else
    {
      objc_storeStrong((id *)(a1 + 16), v15);
      v22 = *v21;
    }
    v23 = v22;
    v24 = *i;
    *i = v23;

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v20, v15->_key);
    *(_QWORD *)(a1 + 40) += v15->_cost;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }

}

- (void)removeObjectForKey:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    -[PKLRUCache removeObjectForKey:scaleFactor:](a1, v3, 1);

}

- (void)removeObjectForKey:(uint64_t)a3 scaleFactor:
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  if (a1)
  {
    v8 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    -[PKLRUCache _keyItemForKey:scaleFactor:](a1, v8, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[PKLRUCache _removeItem:](a1, v7);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v5 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeKeys, 0);
  objc_storeStrong((id *)&self->_itemTable, 0);
  objc_storeStrong((id *)&self->_freeItems, 0);
  objc_storeStrong((id *)&self->_lastItem, 0);
  objc_storeStrong((id *)&self->_firstItem, 0);
}

@end
