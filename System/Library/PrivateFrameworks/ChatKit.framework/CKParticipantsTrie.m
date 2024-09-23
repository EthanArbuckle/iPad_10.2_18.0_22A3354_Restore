@implementation CKParticipantsTrie

- (CKParticipantsTrie)init
{
  return -[CKParticipantsTrie initWithKey:](self, "initWithKey:", CFSTR("@"));
}

- (CKParticipantsTrie)initWithKey:(id)a3
{
  id v5;
  CKParticipantsTrie *v6;
  CKParticipantsTrie *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKParticipantsTrie;
  v6 = -[CKParticipantsTrie init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_key, a3);

  return v7;
}

- (void)addParticipantName:(id)a3 entity:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *children;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && v6)
  {
    if (!self->_children)
    {
      v7 = (NSMutableArray *)objc_opt_new();
      children = self->_children;
      self->_children = v7;

    }
    objc_msgSend(v11, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKParticipantsTrie _composedCharactersForString:appendRootKey:](self, "_composedCharactersForString:appendRootKey:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKParticipantsTrie _addEntity:named:forCharacters:](self, "_addEntity:named:forCharacters:", v6, v9, v10);

  }
}

- (BOOL)hasPrefix:(id)a3
{
  void *v3;
  BOOL v4;

  -[CKParticipantsTrie _lastNodeForString:](self, "_lastNodeForString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)rawHandlesForParticipantName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CKParticipantsTrie _lastNodeForString:](self, "_lastNodeForString:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "defaultIMHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "count"))
    v14 = v5;
  else
    v14 = 0;

  return v14;
}

- (id)entitiesForPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[CKParticipantsTrie hasPrefix:](self, "hasPrefix:", v4))
  {
    v5 = (void *)objc_opt_new();
    -[CKParticipantsTrie _lastNodeForString:](self, "_lastNodeForString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKParticipantsTrie loadHandleEntityFromLastNode:intoResult:](self, "loadHandleEntityFromLastNode:intoResult:", v6, v5);

    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_187);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No trie node values for valid prefix: [%@]"), v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("CKParticipantsTrie/NodeValuesIntegrityError"), v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(objc_retainAutorelease(v11));
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

uint64_t __40__CKParticipantsTrie_entitiesForPrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_composedCharactersForString:(id)a3 appendRootKey:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (v4)
  {
    -[CKParticipantsTrie key](self, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  v9 = objc_msgSend(v6, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CKParticipantsTrie__composedCharactersForString_appendRootKey___block_invoke;
  v12[3] = &unk_1E2757A70;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v12);

  return v10;
}

uint64_t __65__CKParticipantsTrie__composedCharactersForString_appendRootKey___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

- (void)_addEntity:(id)a3 named:(id)a4 forCharacters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  CKParticipantsTrie *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFirstObject");
  -[CKParticipantsTrie children](self, "children");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v10);

      if ((v18 & 1) != 0)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v13)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v19 = v16;

    if (v19)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v19 = -[CKParticipantsTrie initWithKey:]([CKParticipantsTrie alloc], "initWithKey:", v10);
  objc_msgSend(v11, "addObject:", v19);
LABEL_12:
  if (!objc_msgSend(v9, "count"))
  {
    -[CKParticipantsTrie entities](v19, "entities");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[CKParticipantsTrie entities](v19, "entities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsObject:", v26);

      if ((v24 & 1) != 0)
        goto LABEL_21;
      -[CKParticipantsTrie entities](v19, "entities");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v26);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKParticipantsTrie setEntities:](v19, "setEntities:", v25);
    }

    goto LABEL_21;
  }
  -[CKParticipantsTrie children](v19, "children");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = (void *)objc_opt_new();
    -[CKParticipantsTrie setChildren:](v19, "setChildren:", v21);

  }
  -[CKParticipantsTrie _addEntity:named:forCharacters:](v19, "_addEntity:named:forCharacters:", v26, v8, v9);
LABEL_21:

}

- (BOOL)_trieContainsEntity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CKParticipantsTrie entities](self, "entities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "defaultIMHandle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "defaultIMHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_lastNodeForString:(id)a3
{
  id v4;
  void *v5;
  CKParticipantsTrie *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  CKParticipantsTrie *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CKParticipantsTrie *v21;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v23 = v4;
    -[CKParticipantsTrie _composedCharactersForString:appendRootKey:](self, "_composedCharactersForString:appendRootKey:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self;
    -[CKParticipantsTrie children](v6, "children");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = 0;
      v10 = v6;
      v24 = v5;
      while (2)
      {
        v11 = objc_msgSend(v5, "count");

        if (v9 >= v11)
        {
          v6 = v10;
        }
        else
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          -[CKParticipantsTrie children](v10, "children");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v26;
LABEL_7:
            v17 = 0;
            while (1)
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
              objc_msgSend(v18, "key");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "compare:options:", v12, 393);

              if (!v20)
                break;
              if (v15 == ++v17)
              {
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
                if (v15)
                  goto LABEL_7;
                goto LABEL_18;
              }
            }
            v6 = v18;

            ++v9;
            -[CKParticipantsTrie children](v6, "children");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v6;
            v5 = v24;
            if (v8)
              continue;
          }
          else
          {
LABEL_18:

            v6 = v10;
            v5 = v24;
          }
        }
        break;
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 == objc_msgSend(v5, "count"))
      v21 = v6;
    else
      v21 = 0;
    v4 = v23;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)loadHandleEntityFromLastNode:(id)a3 intoResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "entities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v6, "entities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((objc_msgSend(v7, "containsObject:", v14) & 1) == 0)
            objc_msgSend(v7, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
    }

  }
  objc_msgSend(v6, "children");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "children", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          -[CKParticipantsTrie loadHandleEntityFromLastNode:intoResult:](self, "loadHandleEntityFromLastNode:intoResult:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), v7);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v19);
    }

  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSMutableArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
  objc_storeStrong((id *)&self->_entities, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
