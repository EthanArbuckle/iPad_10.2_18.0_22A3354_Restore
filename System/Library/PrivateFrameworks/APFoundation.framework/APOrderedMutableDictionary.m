@implementation APOrderedMutableDictionary

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSMutableOrderedSet *mutableOrderedSet;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSMutableOrderedSet *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  id v21;

  if (a3 && a4)
  {
    mutableOrderedSet = self->_mutableOrderedSet;
    v7 = a4;
    v21 = a3;
    v10 = objc_msgSend_indexOfObject_(mutableOrderedSet, v8, (uint64_t)v7, v9);
    v13 = self->_mutableOrderedSet;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_addObject_(self->_mutableOrderedSet, v11, (uint64_t)v7, v12);
    }
    else
    {
      objc_msgSend_indexSetWithIndex_(MEMORY[0x1E0CB36B8], v11, v10, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend_count(self->_mutableOrderedSet, v16, v17, v18);
      objc_msgSend_moveObjectsAtIndexes_toIndex_(v13, v20, (uint64_t)v15, v19 - 1);

    }
    objc_msgSend_setObject_forKey_(self->_dictionary, v14, (uint64_t)v21, (uint64_t)v7);

  }
}

- (APOrderedMutableDictionary)init
{
  APOrderedMutableDictionary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionary;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *mutableOrderedSet;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APOrderedMutableDictionary;
  v2 = -[APOrderedMutableDictionary init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    mutableOrderedSet = v2->_mutableOrderedSet;
    v2->_mutableOrderedSet = v5;

  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectForKey_(self->_dictionary, a2, (uint64_t)a3, v3);
}

- (unint64_t)count
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_mutableOrderedSet, a2, v2, v3);
}

- (APOrderedMutableDictionary)initWithCapacity:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;
  APOrderedMutableDictionary *v6;
  uint64_t v7;
  NSMutableDictionary *dictionary;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableOrderedSet *mutableOrderedSet;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APOrderedMutableDictionary;
  v6 = -[APOrderedMutableDictionary init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], v4, a3, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSMutableDictionary *)v7;

    objc_msgSend_orderedSetWithCapacity_(MEMORY[0x1E0C99E10], v9, a3, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    mutableOrderedSet = v6->_mutableOrderedSet;
    v6->_mutableOrderedSet = (NSMutableOrderedSet *)v11;

  }
  return v6;
}

+ (id)dictionary
{
  return objc_alloc_init(APOrderedMutableDictionary);
}

+ (id)dictionaryWithCapacity:(unint64_t)a3
{
  APOrderedMutableDictionary *v4;
  const char *v5;
  uint64_t v6;

  v4 = [APOrderedMutableDictionary alloc];
  return (id)objc_msgSend_initWithCapacity_(v4, v5, a3, v6);
}

- (NSArray)allKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_array(self->_mutableOrderedSet, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copy(v4, v5, v6, v7);

  return (NSArray *)v8;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  id v7;
  char *v8;

  v8 = (char *)a3;
  v7 = a4;
  if (v7)
  {
    if (v8)
      objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, (uint64_t)v7);
    else
      objc_msgSend_removeObjectForKey_(self, 0, (uint64_t)v7, v6);
  }

}

- (void)removeObjectForKey:(id)a3
{
  NSMutableOrderedSet *mutableOrderedSet;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  if (a3)
  {
    mutableOrderedSet = self->_mutableOrderedSet;
    v9 = a3;
    objc_msgSend_removeObject_(mutableOrderedSet, v5, (uint64_t)v9, v6);
    objc_msgSend_removeObjectForKey_(self->_dictionary, v7, (uint64_t)v9, v8);

  }
}

- (BOOL)containsKey:(id)a3
{
  uint64_t v3;

  return objc_msgSend_containsObject_(self->_mutableOrderedSet, a2, (uint64_t)a3, v3);
}

- (id)firstObject
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend_firstObject(self->_mutableOrderedSet, a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_objectForKey_(self->_dictionary, v5, (uint64_t)v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)firstKey
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_firstObject(self->_mutableOrderedSet, a2, v2, v3);
}

- (id)lastObject
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend_lastObject(self->_mutableOrderedSet, a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_objectForKey_(self->_dictionary, v5, (uint64_t)v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)lastKey
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_lastObject(self->_mutableOrderedSet, a2, v2, v3);
}

- (void)enumerateKeysUsingBlock:(id)a3
{
  uint64_t v3;

  objc_msgSend_enumerateObjectsUsingBlock_(self->_mutableOrderedSet, a2, (uint64_t)a3, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableOrderedSet, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
