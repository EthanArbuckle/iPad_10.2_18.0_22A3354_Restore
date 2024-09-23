@implementation AXIndexMap

- (AXIndexMap)initWithObjects:(id *)a3 andIndexes:(unint64_t *)a4 count:(unint64_t)a5
{
  AXIndexMap *v8;
  CFMutableDictionaryRef Mutable;
  AXIndexMap *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXIndexMap;
  v8 = -[AXIndexMap init](&v12, sel_init);
  if (v8
    && (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]),
        (v8->_map = Mutable) != 0))
  {
    for (; a5; --a5)
    {
      if (*a3)
        CFDictionarySetValue(v8->_map, (const void *)*a4, *a3);
      ++a4;
      ++a3;
    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (AXIndexMap)init
{
  AXIndexMap *v2;
  CFMutableDictionaryRef Mutable;
  AXIndexMap *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXIndexMap;
  v2 = -[AXIndexMap init](&v6, sel_init);
  if (v2
    && (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]),
        (v2->_map = Mutable) != 0))
  {
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_initWithIndexMap:(id)a3
{
  _QWORD *v4;
  AXIndexMap *v5;
  const __CFDictionary *v6;
  CFIndex Count;
  CFMutableDictionaryRef MutableCopy;
  AXIndexMap *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXIndexMap;
  v5 = -[AXIndexMap init](&v11, sel_init);
  if (v5
    && (v6 = (const __CFDictionary *)v4[1],
        Count = CFDictionaryGetCount(v6),
        MutableCopy = CFDictionaryCreateMutableCopy(0, Count, v6),
        (v5->_map = MutableCopy) != 0))
  {
    v9 = v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_initAndDeepCopyIndexMap:(id)a3
{
  id v4;
  AXIndexMap *v5;
  CFMutableDictionaryRef Mutable;
  uint64_t v7;
  _QWORD *v8;
  unint64_t i;
  void *v10;
  void *v11;
  AXIndexMap *v12;
  NSObject *v14;
  unint64_t v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AXIndexMap;
  v5 = -[AXIndexMap init](&v16, sel_init);
  if (v5
    && (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]),
        (v5->_map = Mutable) != 0))
  {
    v15 = 0;
    v7 = objc_msgSend(v4, "_createIndexesWithSize:", &v15);
    if (v7)
    {
      v8 = (_QWORD *)v7;
      if (v15)
      {
        for (i = 0; i < v15; ++i)
        {
          objc_msgSend(v4, "objectForIndex:", v8[i]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            AXLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              -[AXIndexMap _initAndDeepCopyIndexMap:].cold.1((uint64_t)v10, v14);

            abort();
          }
          v11 = (void *)objc_msgSend(v10, "copyWithZone:", 0);

          CFDictionarySetValue(v5->_map, (const void *)v8[i], v11);
        }
      }
      free(v8);
    }
    v12 = v5;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AXIndexMap _initWithIndexMap:](+[AXIndexMap allocWithZone:](AXIndexMap, "allocWithZone:", a3), "_initWithIndexMap:", self);
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  return -[AXIndexMap _initAndDeepCopyIndexMap:](+[AXIndexMap allocWithZone:](AXIndexMap, "allocWithZone:", a3), "_initAndDeepCopyIndexMap:", self);
}

- (AXIndexMap)initWithCoder:(id)a3
{
  id v4;
  AXIndexMap *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  AXIndexMap *v11;
  id v12;

  v4 = a3;
  v5 = -[AXIndexMap init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("values"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __28__AXIndexMap_initWithCoder___block_invoke;
    v10[3] = &unk_1E28C2A98;
    v11 = v5;
    v12 = v7;
    v8 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  }
  return v5;
}

void __28__AXIndexMap_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongValue");

  objc_msgSend(v4, "setObject:forIndex:", v8, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t *v7;
  unint64_t i;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v16 = 0;
  v7 = -[AXIndexMap _createIndexesWithSize:](self, "_createIndexesWithSize:", &v16);
  if (v16)
  {
    for (i = 0; i < v16; ++i)
    {
      v9 = v7[i];
      -[AXIndexMap objectForIndex:](self, "objectForIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE1417C8))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

        objc_msgSend(v6, "addObject:", v10);
      }
      else if (!v10)
      {
        _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/DataStructures/AXIndexMap.m", (void *)0xA6, (uint64_t)"-[AXIndexMap encodeWithCoder:]", CFSTR("nil value for an index returned from _createIndexesWithSize, this should never happen"), v11, v12, v13, v15);
      }

    }
  }
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("indexes"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("values"));
  free(v7);

}

- (void)dealloc
{
  __CFDictionary *map;
  objc_super v4;

  map = self->_map;
  if (map)
  {
    CFRelease(map);
    self->_map = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXIndexMap;
  -[AXIndexMap dealloc](&v4, sel_dealloc);
}

- (void)setObject:(id)a3 forIndex:(unint64_t)a4
{
  if (a3)
    CFDictionarySetValue(self->_map, (const void *)a4, a3);
}

- (void)removeObjectForIndex:(unint64_t)a3
{
  CFDictionaryRemoveValue(self->_map, (const void *)a3);
}

- (void)removeAllObjects
{
  CFDictionaryRemoveAllValues(self->_map);
}

- (id)objectForIndex:(unint64_t)a3
{
  return (id)CFDictionaryGetValue(self->_map, (const void *)a3);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_map);
}

- (unint64_t)_createIndexesWithSize:(unint64_t *)a3
{
  CFIndex Count;
  size_t v6;
  const void **v7;
  const void **v8;

  Count = CFDictionaryGetCount(self->_map);
  if (a3)
    *a3 = Count;
  v6 = 8 * Count;
  v7 = (const void **)malloc_type_malloc(8 * Count, 0x4FB2C935uLL);
  v8 = v7;
  if (v7)
  {
    bzero(v7, v6);
    CFDictionaryGetKeysAndValues(self->_map, v8, 0);
  }
  return (unint64_t *)v8;
}

- (id)indexes
{
  unint64_t *v2;
  void *v3;
  unint64_t i;
  unint64_t v6;

  v6 = 0;
  v2 = -[AXIndexMap _createIndexesWithSize:](self, "_createIndexesWithSize:", &v6);
  v3 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3788]), "init");
  if (v6)
  {
    for (i = 0; i < v6; ++i)
      objc_msgSend(v3, "addIndex:", v2[i]);
  }
  free(v2);
  return v3;
}

- (void)addObjectsFromIndexMap:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t i;
  void *v8;
  unint64_t v9;

  v4 = a3;
  v9 = 0;
  v5 = objc_msgSend(v4, "_createIndexesWithSize:", &v9);
  if (v5)
  {
    v6 = (_QWORD *)v5;
    if (v9)
    {
      for (i = 0; i < v9; ++i)
      {
        objc_msgSend(v4, "objectForIndex:", v6[i]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXIndexMap setObject:forIndex:](self, "setObject:forIndex:", v8, v6[i]);

      }
    }
    free(v6);
  }

}

- (id)description
{
  void *v3;
  unint64_t *v4;
  unint64_t *v5;
  unint64_t i;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("AXIndexMap:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v4 = -[AXIndexMap _createIndexesWithSize:](self, "_createIndexesWithSize:", &v13);
  if (v4)
  {
    v5 = v4;
    if (v13)
    {
      for (i = 0; i < v13; ++i)
      {
        v7 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
        v8 = v5[i];
        -[AXIndexMap objectForIndex:](self, "objectForIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("\t%lu (0x%lx) -> %@\n"), v8, v8, v9);

        objc_msgSend(v3, "appendString:", v10);
      }
    }
    free(v5);
    v11 = v3;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_initAndDeepCopyIndexMap:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18EBEC000, a2, OS_LOG_TYPE_ERROR, "Trying to copy an object that can't be copied! %@", (uint8_t *)&v2, 0xCu);
}

@end
