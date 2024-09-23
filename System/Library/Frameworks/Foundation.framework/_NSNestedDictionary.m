@implementation _NSNestedDictionary

- (id)objectForKey:(id)a3
{
  id result;

  result = (id)objc_msgSend(self->_locals, "objectForKey:");
  if (!result)
    return (id)objc_msgSend(self->_bindings, "objectForKey:", a3);
  return result;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id locals;

  locals = self->_locals;
  if (!locals)
  {
    locals = objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_locals = locals;
  }
  objc_msgSend(locals, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  objc_msgSend(self->_locals, "removeObjectForKey:", a3);
}

- (uint64_t)_recursiveAllKeys
{
  __objc2_class *Class;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  Class = (__objc2_class *)object_getClass(*(id *)(a1 + 16));
  v3 = *(void **)(a1 + 16);
  if (Class == _NSNestedDictionary)
    v4 = -[_NSNestedDictionary _recursiveAllKeys](v3);
  else
    v4 = objc_msgSend(v3, "allKeys");
  v5 = v4;
  if (*(_QWORD *)(a1 + 8))
  {
    if (v4)
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
    else
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = v6;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = *(void **)(a1 + 8);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v10);
    }
    v5 = objc_msgSend(v7, "allObjects");

  }
  if (!v5)
    return objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return v5;
}

- (uint64_t)_recursiveAllValues
{
  __objc2_class *Class;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  Class = (__objc2_class *)object_getClass(*(id *)(a1 + 16));
  v3 = *(void **)(a1 + 16);
  if (Class == _NSNestedDictionary)
    v4 = -[_NSNestedDictionary _recursiveAllValues](v3);
  else
    v4 = objc_msgSend(v3, "allValues");
  v5 = v4;
  if (*(_QWORD *)(a1 + 8))
  {
    if (v4)
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
    else
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = v6;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = *(void **)(a1 + 8);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(a1 + 8), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i)));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v10);
    }
    v5 = objc_msgSend(v7, "allObjects");

  }
  if (!v5)
    return objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return v5;
}

- (unint64_t)count
{
  id bindings;
  uint64_t v5;

  bindings = self->_bindings;
  if (bindings && self->_locals)
    return objc_msgSend((id)-[_NSNestedDictionary _recursiveAllKeys]((uint64_t)self), "count");
  v5 = objc_msgSend(bindings, "count");
  return objc_msgSend(self->_locals, "count") + v5;
}

- (id)keyEnumerator
{
  return (id)objc_msgSend((id)-[_NSNestedDictionary _recursiveAllKeys]((uint64_t)self), "objectEnumerator");
}

- (id)objectEnumerator
{
  return (id)objc_msgSend((id)-[_NSNestedDictionary _recursiveAllValues]((uint64_t)self), "objectEnumerator");
}

@end
