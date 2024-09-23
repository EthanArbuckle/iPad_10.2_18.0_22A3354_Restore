@implementation FigCaptureTrie

- (FigCaptureTrie)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureTrie;
  return -[FigCaptureTrie init](&v3, sel_init);
}

- (FigCaptureTrie)initWithPath:(id)a3
{
  FigCaptureTrie *v4;
  uint64_t v5;
  FigCaptureTrie *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FigCaptureTrie *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[FigCaptureTrie init](self, "init");
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    v6 = v4;
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v14;
      v6 = v4;
      do
      {
        v9 = 0;
        v10 = v6;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(a3);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
          v6 = objc_alloc_init(FigCaptureTrie);
          v10->_subTries = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v6, v11);

          ++v9;
          v10 = v6;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    v6->_complete = 1;
  }
  return v4;
}

- (FigCaptureTrie)initWithPathArray:(id)a3
{
  FigCaptureTrie *v4;
  uint64_t v5;
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
  v4 = -[FigCaptureTrie init](self, "init");
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(a3);
          -[FigCaptureTrie addPath:](v4, "addPath:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureTrie;
  -[FigCaptureTrie dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  _QWORD v5[6];
  _QWORD v6[3];
  int v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("FigCaptureTrie: {\n"));
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__FigCaptureTrie_description__block_invoke;
  v5[3] = &unk_1E491E5C0;
  v5[4] = v3;
  v5[5] = v6;
  -[FigCaptureTrie enumeratePaths:](self, "enumeratePaths:", v5);
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  _Block_object_dispose(v6, 8);
  return v3;
}

uint64_t __29__FigCaptureTrie_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("  %d: { %@ }\n"), (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++, objc_msgSend(a2, "componentsJoinedByString:", CFSTR(", ")));
}

- (id)copyWithZone:(_NSZone *)a3
{
  FigCaptureTrie *v5;
  NSMutableDictionary *subTries;
  _QWORD v8[6];

  v5 = -[FigCaptureTrie init](+[FigCaptureTrie allocWithZone:](FigCaptureTrie, "allocWithZone:"), "init");
  v5->_complete = self->_complete;
  if (self->_subTries)
  {
    v5->_subTries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    subTries = self->_subTries;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__FigCaptureTrie_copyWithZone___block_invoke;
    v8[3] = &unk_1E491E5E8;
    v8[4] = v5;
    v8[5] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subTries, "enumerateKeysAndObjectsUsingBlock:", v8);
  }
  return v5;
}

void __31__FigCaptureTrie_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = (id)objc_msgSend(a3, "copyWithZone:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v5, a2);

}

- (BOOL)isEqual:(id)a3
{
  NSMutableDictionary *subTries;
  int v6;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_complete == *((unsigned __int8 *)a3 + 8)
      && (subTries = self->_subTries, (subTries != 0) != (*((_QWORD *)a3 + 2) == 0)))
    {
      if (!subTries || (v6 = -[NSMutableDictionary isEqual:](subTries, "isEqual:")) != 0)
        LOBYTE(v6) = 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (NSDictionary)children
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_subTries, "copy");
}

- (void)addPath:(id)a3
{
  -[FigCaptureTrie _addPath:index:](self, "_addPath:index:", a3, 0);
}

- (void)_addPath:(id)a3 index:(unint64_t)a4
{
  uint64_t v7;
  NSMutableDictionary *subTries;
  FigCaptureTrie *v9;

  if (objc_msgSend(a3, "count") == a4)
  {
    self->_complete = 1;
  }
  else
  {
    v7 = objc_msgSend(a3, "objectAtIndexedSubscript:", a4);
    subTries = self->_subTries;
    if (!subTries)
    {
      subTries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_subTries = subTries;
    }
    v9 = (FigCaptureTrie *)-[NSMutableDictionary objectForKeyedSubscript:](subTries, "objectForKeyedSubscript:", v7);
    if (!v9)
    {
      v9 = objc_alloc_init(FigCaptureTrie);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subTries, "setObject:forKeyedSubscript:", v9, v7);

    }
    -[FigCaptureTrie _addPath:index:](v9, "_addPath:index:", a3, a4 + 1);
  }
}

- (BOOL)containsPath:(id)a3
{
  _BYTE *v3;

  v3 = -[FigCaptureTrie getSubTrie:](self, "getSubTrie:", a3);
  if (v3)
    LOBYTE(v3) = v3[8] != 0;
  return (char)v3;
}

- (BOOL)containsParentPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL complete;
  FigCaptureTrie *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return self->_complete;
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(a3);
    complete = self->_complete;
    if (self->_complete)
      return complete;
    v10 = (FigCaptureTrie *)-[NSMutableDictionary objectForKeyedSubscript:](self->_subTries, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
    if (!v10)
      return complete;
    self = v10;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_3;
      return self->_complete;
    }
  }
}

- (id)getSubTrie:(id)a3
{
  uint64_t v5;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(a3);
      self = (FigCaptureTrie *)-[NSMutableDictionary objectForKeyedSubscript:](self->_subTries, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
      if (!self)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          goto LABEL_3;
        return self;
      }
    }
  }
  return self;
}

- (void)enumeratePaths:(id)a3
{
  char v3;

  v3 = 0;
  -[FigCaptureTrie _enumeratePathsWithPrefix:stop:processLeaf:](self, "_enumeratePathsWithPrefix:stop:processLeaf:", MEMORY[0x1E0C9AA60], &v3, a3);
}

- (void)_enumeratePathsWithPrefix:(id)a3 stop:(BOOL *)a4 processLeaf:(id)a5
{
  NSMutableDictionary *subTries;
  _QWORD v10[7];
  unsigned __int8 v11;

  if (!self->_complete
    || (v11 = 0, (*((void (**)(id, id, unsigned __int8 *, BOOL *))a5 + 2))(a5, a3, &v11, a4), !(*a4 | v11)))
  {
    subTries = self->_subTries;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__FigCaptureTrie__enumeratePathsWithPrefix_stop_processLeaf___block_invoke;
    v10[3] = &unk_1E491E610;
    v10[5] = a5;
    v10[6] = a4;
    v10[4] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subTries, "enumerateKeysAndObjectsUsingBlock:", v10);
  }
}

uint64_t __61__FigCaptureTrie__enumeratePathsWithPrefix_stop_processLeaf___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "_enumeratePathsWithPrefix:stop:processLeaf:", objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObject:", a2), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  *a4 = **(_BYTE **)(a1 + 48);
  return result;
}

- (id)extractFrom:(id)a3
{
  id result;

  result = -[FigCaptureTrie _extractFrom:writeTarget:destinationMutability:overwrite:](self, "_extractFrom:writeTarget:destinationMutability:overwrite:", a3, 0, 2, 1);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  return result;
}

- (void)extractFrom:(id)a3 writeInto:(id)a4 assumeMutable:(BOOL)a5 overwrite:(BOOL)a6
{
  uint64_t v8;

  if (self->_complete)
  {
    if (a6)
    {
      objc_msgSend(a4, "removeAllObjects", a3, a4, a5);
      objc_msgSend(a4, "addEntriesFromDictionary:", a3);
    }
  }
  else
  {
    if (a5)
      v8 = 2;
    else
      v8 = 1;
    -[FigCaptureTrie _extractFrom:writeTarget:destinationMutability:overwrite:](self, "_extractFrom:writeTarget:destinationMutability:overwrite:", a3, a4, v8, a6);
  }
}

- (id)_extractFrom:(id)a3 writeTarget:(id)a4 destinationMutability:(int)a5 overwrite:(BOOL)a6
{
  id v9;
  id v12;
  int v13;
  NSMutableDictionary *subTries;
  _QWORD v16[8];
  int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  if (self->_complete)
  {
    if (!a4 || a6)
      return a3;
    return 0;
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3052000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    if (-[NSMutableDictionary count](self->_subTries, "count"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (a5)
          {
            v12 = a4;
            v20[5] = (uint64_t)v12;
            if (a5 == 1)
              v13 = 0;
            else
              v13 = a5;
          }
          else
          {
            v13 = 0;
          }
          subTries = self->_subTries;
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __75__FigCaptureTrie__extractFrom_writeTarget_destinationMutability_overwrite___block_invoke;
          v16[3] = &unk_1E491E638;
          v16[4] = a3;
          v16[5] = a4;
          v17 = v13;
          v18 = a6;
          v16[6] = self;
          v16[7] = &v19;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subTries, "enumerateKeysAndObjectsUsingBlock:", v16);
        }
      }
    }
    v9 = (id)v20[5];
    _Block_object_dispose(&v19, 8);
  }
  return v9;
}

uint64_t __75__FigCaptureTrie__extractFrom_writeTarget_destinationMutability_overwrite___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v7;
  void *v8;
  id v9;

  result = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  if (result)
  {
    result = objc_msgSend(a3, "_extractFrom:writeTarget:destinationMutability:overwrite:", result, objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2), *(unsigned int *)(a1 + 64), *(unsigned __int8 *)(a1 + 68));
    if (result)
    {
      v7 = result;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v8 = *(void **)(a1 + 40);
        if (v8)
          v9 = (id)objc_msgSend(v8, "mutableCopy");
        else
          v9 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "count"));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v9;
      }
      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v7, a2);
    }
  }
  return result;
}

- (id)generatePathArray
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__FigCaptureTrie_generatePathArray__block_invoke;
  v5[3] = &unk_1E491E660;
  v5[4] = v3;
  -[FigCaptureTrie enumeratePaths:](self, "enumeratePaths:", v5);
  return v3;
}

uint64_t __35__FigCaptureTrie_generatePathArray__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
