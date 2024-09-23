@implementation GEOTileKeyList

- (void)dealloc
{
  _QWORD *head;
  void **p_head;
  _QWORD *v5;
  objc_super v6;

  p_head = &self->_head;
  head = self->_head;
  if (head)
  {
    do
    {
      v5 = (_QWORD *)head[2];
      free(head);
      head = v5;
    }
    while (v5);
  }
  *p_head = 0;
  p_head[1] = 0;
  v6.receiver = self;
  v6.super_class = (Class)GEOTileKeyList;
  -[GEOTileKeyList dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

+ (id)listFromXPCData:(id)a3
{
  id v3;
  void *v4;
  size_t length;
  unint64_t v6;
  GEOTileKeyList *v7;
  char *bytes_ptr;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  __int16 v13;
  __int16 v14;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_11:
      v7 = objc_alloc_init(GEOTileKeyList);
      goto LABEL_7;
    }
    v14 = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "Assertion failed: xpcData != ((void *)0)";
    v12 = (uint8_t *)&v14;
LABEL_13:
    _os_log_fault_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, v11, v12, 2u);
    goto LABEL_11;
  }
  if (MEMORY[0x18D765A14](v3) != MEMORY[0x1E0C812E8])
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v13 = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "Assertion failed: xpc_get_type(xpcData) == (&_xpc_type_data)";
    v12 = (uint8_t *)&v13;
    goto LABEL_13;
  }
  length = xpc_data_get_length(v4);
  v6 = length >> 4;
  v7 = -[GEOTileKeyList initWithCapacity:]([GEOTileKeyList alloc], "initWithCapacity:", length >> 4);
  if (length >= 0x10)
  {
    bytes_ptr = (char *)xpc_data_get_bytes_ptr(v4);
    if (v6 <= 1)
      v6 = 1;
    do
    {
      -[GEOTileKeyList _addKeyToBack:](v7, "_addKeyToBack:", bytes_ptr);
      bytes_ptr += 16;
      --v6;
    }
    while (v6);
  }
LABEL_7:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GEOTileKeyList *v4;
  GEOTileKeyList *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = -[GEOTileKeyList initWithCapacity:maxCapacity:](+[GEOTileKeyList allocWithZone:](GEOTileKeyList, "allocWithZone:", a3), "initWithCapacity:maxCapacity:", -[GEOTileKeyList count](self, "count"), self->_maxCount);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self;
  v6 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        -[GEOTileKeyList _addKeyToBack:](v4, "_addKeyToBack:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v4;
}

- (uint64_t)_addKeyToBack:(uint64_t *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)a1[3];
  ++a1[4];
  v5 = *a3;
  v6 = a3[1];
  v7 = a1;
  v8 = malloc_type_malloc(0x20uLL, 0x1020040AB73632BuLL);
  v9 = v8;
  *v8 = v5;
  v8[1] = v6;
  v10 = v7[2];
  v8[2] = 0;
  v8[3] = v10;
  v11 = v7[2];
  if (v11)
    *(_QWORD *)(v11 + 16) = v8;
  v7[2] = v8;
  if (!v7[1])
    v7[1] = v8;
  ++v7[6];

  return objc_msgSend(v4, "setObject:forKey:", v9, a3);
}

- (GEOTileKeyList)initWithCapacity:(unint64_t)a3
{
  return -[GEOTileKeyList initWithCapacity:maxCapacity:](self, "initWithCapacity:maxCapacity:", a3, -1);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;
  _QWORD *var0;
  BOOL v7;
  BOOL v8;

  if (!self->_count || a3->var3[0] == 1)
    return 0;
  var0 = (_QWORD *)a3->var0;
  if (!a3->var0)
  {
    a3->var1 = a4;
    a3->var2 = &self->_mutationsCount;
    var0 = self->_head;
  }
  result = 0;
  v7 = var0 != 0;
  if (a5 && var0)
  {
    result = 0;
    do
    {
      a4[result++] = var0;
      var0 = (_QWORD *)var0[2];
      v7 = var0 != 0;
      if (var0)
        v8 = result >= a5;
      else
        v8 = 1;
    }
    while (!v8);
  }
  if (!v7)
    a3->var3[0] = 1;
  a3->var0 = (unint64_t)var0;
  return result;
}

- (GEOTileKeyList)initWithCapacity:(unint64_t)a3 maxCapacity:(unint64_t)a4
{
  GEOTileKeyList *v6;
  GEOTileKeyList *v7;
  unint64_t v8;
  GEOTileKeyMap *v9;
  GEOTileKeyMap *map;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GEOTileKeyList;
  v6 = -[GEOTileKeyList init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a4)
      v8 = a4;
    else
      v8 = -1;
    v6->_count = 0;
    v6->_maxCount = v8;
    v9 = -[GEOTileKeyMap initWithMapType:]([GEOTileKeyMap alloc], "initWithMapType:", 1);
    map = v7->_map;
    v7->_map = v9;

    if (a3)
      -[GEOTileKeyMap reserveCapacity:](v7->_map, "reserveCapacity:", a3);
  }
  return v7;
}

- (GEOTileKeyList)init
{
  return -[GEOTileKeyList initWithCapacity:maxCapacity:](self, "initWithCapacity:maxCapacity:", 0, -1);
}

- (unint64_t)count
{
  return self->_count;
}

- (id)newXPCData
{
  size_t v3;
  char *v4;
  GEOTileKeyList *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  xpc_object_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[GEOTileKeyList count](self, "count"))
    return xpc_data_create(0, 0);
  v3 = 16 * -[GEOTileKeyList count](self, "count");
  v4 = (char *)malloc_type_malloc(v3, 0xA1DF487AuLL);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self;
  v6 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      v11 = &v4[16 * v8];
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        *(_OWORD *)v11 = *(_OWORD *)*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v11 += 16;
        ++v10;
      }
      while (v7 != v10);
      v7 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 += v10;
    }
    while (v7);
  }

  v12 = xpc_data_create(v4, v3);
  free(v4);
  return v12;
}

- (uint64_t)firstKey
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)keyAtIndex:(unint64_t)a3
{
  uint64_t result;
  unint64_t v4;
  BOOL v5;
  id v6;

  if (*(_QWORD *)(a1 + 32) <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** -[%@ keyAtIndex:]: index %llu beyond bounds [0 .. %llu]"), objc_opt_class(), a3, *(_QWORD *)(a1 + 32) - 1);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], objc_claimAutoreleasedReturnValue(), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  result = *(_QWORD *)(a1 + 8);
  if (a3 && result)
  {
    v4 = 1;
    do
    {
      result = *(_QWORD *)(result + 16);
      if (result)
        v5 = v4 >= a3;
      else
        v5 = 1;
      ++v4;
    }
    while (!v5);
  }
  return result;
}

- (BOOL)removeKey:(id *)a1
{
  _QWORD *v2;

  v2 = (_QWORD *)objc_msgSend(a1[3], "objectForKey:");
  if (v2)
    _remove(a1, v2);
  return v2 != 0;
}

- (BOOL)intersectsList:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  GEOTileKeyList *v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 >= -[GEOTileKeyList count](self, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = self;
    v6 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(v4, "containsKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v6) = objc_msgSend(v4, "intersectsList:", self);
  }

  return v6;
}

- (void)removeKeysMatchingPredicate:(id)a3
{
  _QWORD *head;
  _QWORD *v5;
  unsigned int (**v6)(id, _QWORD *);

  v6 = (unsigned int (**)(id, _QWORD *))a3;
  head = self->_head;
  if (head)
  {
    do
    {
      v5 = (_QWORD *)head[2];
      if (v6[2](v6, head))
        _remove(self, head);
      head = v5;
    }
    while (v5);
  }

}

- (BOOL)containsKey:(uint64_t)a1
{
  return objc_msgSend(*(id *)(a1 + 24), "objectForKey:") != 0;
}

- (uint64_t)addKey:(uint64_t *)a3 lostKey:(_OWORD *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(*(id *)(a1 + 24), "objectForKey:");
  if (v7)
  {
    if (*(_QWORD *)(a1 + 8) != v7)
    {
      v9 = *(_QWORD *)(v7 + 16);
      v8 = *(_QWORD *)(v7 + 24);
      if (v8)
        *(_QWORD *)(v8 + 16) = v9;
      if (v9)
        *(_QWORD *)(v9 + 24) = v8;
      *(_QWORD *)(v7 + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 24) = v7;
      *(_QWORD *)(v7 + 16) = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v7;
      if (*(_QWORD *)(a1 + 16) == v7)
        *(_QWORD *)(a1 + 16) = v8;
      result = 0;
      ++*(_QWORD *)(a1 + 48);
      return result;
    }
    return 0;
  }
  v11 = *(void **)(a1 + 24);
  ++*(_QWORD *)(a1 + 32);
  v12 = *a3;
  v13 = a3[1];
  v14 = (id)a1;
  v15 = malloc_type_malloc(0x20uLL, 0x1020040AB73632BuLL);
  v16 = v15;
  *v15 = v12;
  v15[1] = v13;
  v15[3] = 0;
  v15[2] = v14[1];
  v17 = v14[1];
  if (v17)
    *(_QWORD *)(v17 + 24) = v15;
  v14[1] = v15;
  if (!v14[2])
    v14[2] = v15;
  ++v14[6];

  objc_msgSend(v11, "setObject:forKey:", v16, a3);
  if (*(_QWORD *)(a1 + 32) <= v14[5])
    return 0;
  v18 = (uint64_t *)v14[2];
  v19 = *v18;
  v20 = v18[1];
  v21 = v18[3];
  v22 = (_QWORD *)(v21 + 16);
  if (!v21)
    v22 = v14 + 1;
  *v22 = 0;
  v14[2] = v21;
  v23 = v14;
  free(v18);
  ++v14[6];

  *(_QWORD *)&v24 = v19;
  *((_QWORD *)&v24 + 1) = v20;
  if (a4)
    *a4 = v24;
  objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", &v24);
  --*(_QWORD *)(a1 + 32);
  return 1;
}

- (uint64_t)addKey:(uint64_t)a3
{
  return objc_msgSend(a1, "addKey:lostKey:", a3, 0);
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  __int16 v6;
  id v8;
  GEOTileKeyList *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  GEOTileKeyList *v19;
  int8x16_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v19 = self;
  v20 = vextq_s8(*(int8x16_t *)&self->_count, *(int8x16_t *)&self->_count, 8uLL);
  objc_msgSend(v8, "appendBytes:length:", &v19, 24);
  if ((v6 & 0x102) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self;
    v10 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v10)
    {
      v11 = a5 - 24;
      v12 = *(_QWORD *)v16;
LABEL_4:
      v13 = 0;
      v14 = v11 + 16;
      v11 -= 16 * v10;
      while (1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 -= 16;
        if (v14 < 0x11)
          break;
        objc_msgSend(v8, "appendBytes:length:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), 16, (_QWORD)v15);
        if (v10 == v13)
        {
          v10 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (GEOTileKeyList)initWithMaxCapacity:(unint64_t)a3
{
  return -[GEOTileKeyList initWithCapacity:maxCapacity:](self, "initWithCapacity:maxCapacity:", 0, a3);
}

- (id)copyWithMaxCapacity:(unint64_t)a3
{
  GEOTileKeyList *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *head;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;

  v5 = [GEOTileKeyList alloc];
  v6 = -[GEOTileKeyList count](self, "count");
  v7 = a3;
  if (v6 < a3)
    v7 = -[GEOTileKeyList count](self, "count", a3);
  v8 = -[GEOTileKeyList initWithCapacity:maxCapacity:](v5, "initWithCapacity:maxCapacity:", v7, a3);
  v9 = (void *)v8;
  head = self->_head;
  if (head)
  {
    v11 = *(_QWORD *)(v8 + 40);
    if (v11)
    {
      v12 = 1;
      do
      {
        objc_msgSend(v9, "_addKeyToBack:", head);
        head = (_QWORD *)head[2];
        if (head)
          v13 = v12 >= v11;
        else
          v13 = 1;
        ++v12;
      }
      while (!v13);
    }
  }
  return v9;
}

- (id)description
{
  void *v3;
  GEOTileKeyList *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; maxCount = %lu; count = %lu;"),
    objc_opt_class(),
    self,
    self->_maxCount,
    self->_count);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self;
  v5 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        GEOStringFromTileKey(*(char **)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n   %@"), v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)capacity
{
  return self->_maxCount;
}

- (GEOTileKeyList)listWithout:(id)a3
{
  id v4;
  GEOTileKeyList *v5;
  GEOTileKeyList *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self;
  v6 = 0;
  v7 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsKey:", v10, (_QWORD)v12) & 1) == 0)
        {
          if (!v6)
            v6 = objc_alloc_init(GEOTileKeyList);
          -[GEOTileKeyList _addKeyToBack:](v6, "_addKeyToBack:", v10);
        }
      }
      v7 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v6;
}

- (id)sublistWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  GEOTileKeyList *v6;
  _QWORD *head;
  BOOL v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  BOOL v13;

  length = a3.length;
  location = a3.location;
  v6 = -[GEOTileKeyList initWithMaxCapacity:]([GEOTileKeyList alloc], "initWithMaxCapacity:", a3.length);
  head = self->_head;
  if (head)
    v8 = location == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = 1;
    do
    {
      head = (_QWORD *)head[2];
      if (head)
        v10 = v9 >= location;
      else
        v10 = 1;
      ++v9;
    }
    while (!v10);
  }
  if (head)
    v11 = length == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = 1;
    do
    {
      -[GEOTileKeyList _addKeyToBack:](v6, "_addKeyToBack:", head);
      head = (_QWORD *)head[2];
      if (head)
        v13 = v12 >= length;
      else
        v13 = 1;
      ++v12;
    }
    while (!v13);
  }
  return v6;
}

- (void)sort:(id)a3
{
  id v4;
  unint64_t count;
  size_t v6;
  char *v7;
  void **p_head;
  size_t v9;
  size_t v10;
  _OWORD *v11;
  void **v12;
  _OWORD *v13;
  __int128 v14;
  unint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  count = self->_count;
  if (!count)
    goto LABEL_14;
  v6 = 16 * count;
  if (count <= 0x7F)
  {
    v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v7, v6);
    p_head = &self->_head;
LABEL_6:
    v10 = 0;
    v11 = v7;
    v12 = p_head;
    do
    {
      v13 = *v12;
      v14 = *v13;
      v12 = (void **)(v13 + 1);
      *v11++ = v14;
      ++v10;
      v9 = self->_count;
    }
    while (v10 < v9);
    goto LABEL_8;
  }
  v7 = (char *)malloc_type_malloc(16 * count, 0x1000040451B5BE8uLL);
  p_head = &self->_head;
  if (self->_count)
    goto LABEL_6;
  v9 = 0;
LABEL_8:
  qsort_b(v7, v9, 0x10uLL, v4);
  if (self->_count)
  {
    v15 = 0;
    v16 = v7;
    do
    {
      v17 = *p_head;
      *v17 = *v16;
      -[GEOTileKeyMap setObject:forKey:](self->_map, "setObject:forKey:", v17, v16);
      p_head = (void **)(v17 + 1);
      ++v15;
      ++v16;
    }
    while (v15 < self->_count);
  }
  if (count >= 0x80)
    free(v7);
  ++self->_mutationsCount;
LABEL_14:

}

+ (id)formatOSLogData:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  char v13[16];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0x18)
  {
    objc_msgSend(v4, "getBytes:length:", &v11, 24);
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p> maxCount = %zu; count = %zu; tiles = "),
      a1,
      v11,
      v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length") == 24)
    {
      v6 = CFSTR("<>");
    }
    else
    {
      objc_msgSend(v5, "appendString:", CFSTR("<"));
      v8 = 24;
      v6 = CFSTR("\n>");
      while (1)
      {
        v9 = v8 + 16;
        if (v8 + 16 > (unint64_t)objc_msgSend(v4, "length"))
          break;
        objc_msgSend(v4, "getBytes:range:", v13, v8, 16);
        objc_msgSend(v5, "appendString:", CFSTR("\n    "));
        GEOStringFromTileKey(v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v10);

        v8 = v9;
      }
    }
    objc_msgSend(v5, "appendString:", v6);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
