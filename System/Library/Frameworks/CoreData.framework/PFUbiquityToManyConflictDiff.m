@implementation PFUbiquityToManyConflictDiff

- (PFUbiquityToManyConflictDiff)init
{
  PFUbiquityToManyConflictDiff *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityToManyConflictDiff;
  v2 = -[PFUbiquityToManyConflictDiff init](&v4, sel_init);
  if (v2)
  {
    v2->_insertedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_deletedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  return v2;
}

- (id)initForRelationshipAtKey:(id)a3
{
  PFUbiquityToManyConflictDiff *v4;

  v4 = -[PFUbiquityToManyConflictDiff init](self, "init");
  if (v4)
    v4->_relationshipKey = (NSString *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_insertedObjectIDs = 0;
  self->_deletedObjectIDs = 0;

  self->_relationshipKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityToManyConflictDiff;
  -[PFUbiquityToManyConflictDiff dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityToManyConflictDiff;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\ninsertedObjectIDs: %@\ndeletedObjectIDs: %@\n"), -[PFUbiquityToManyConflictDiff description](&v3, sel_description), self->_insertedObjectIDs, self->_deletedObjectIDs);
}

- (BOOL)isEqual:(id)a3
{
  NSMutableSet *insertedObjectIDs;
  uint64_t v6;
  char v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    insertedObjectIDs = self->_insertedObjectIDs;
    if (a3)
    {
      if (-[NSMutableSet isEqual:](insertedObjectIDs, "isEqual:", *((_QWORD *)a3 + 1)))
      {
        v6 = *((_QWORD *)a3 + 2);
        return -[NSMutableSet isEqual:](self->_deletedObjectIDs, "isEqual:", v6);
      }
    }
    else
    {
      v8 = -[NSMutableSet isEqual:](insertedObjectIDs, "isEqual:", 0);
      v6 = 0;
      if ((v8 & 1) != 0)
        return -[NSMutableSet isEqual:](self->_deletedObjectIDs, "isEqual:", v6);
    }
  }
  return 0;
}

- (uint64_t)diffWithLogSnapshot:(uint64_t)a3 andPreviousSnapshot:
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    objc_msgSend(*(id *)(result + 8), "removeAllObjects");
    objc_msgSend(*(id *)(v5 + 16), "removeAllObjects");
    if (a2)
      v6 = *(void **)(a2 + 8);
    else
      v6 = 0;
    v7 = (void *)objc_msgSend(v6, "objectForKey:", *(_QWORD *)(v5 + 24));
    if (a3)
    {
      v8 = (void *)objc_msgSend(*(id *)(a3 + 8), "objectForKey:", *(_QWORD *)(v5 + 24));
      v9 = *(void **)(a3 + 16);
    }
    else
    {
      v8 = (void *)objc_msgSend(0, "objectForKey:", *(_QWORD *)(v5 + 24));
      v9 = 0;
    }
    v10 = (_QWORD *)objc_msgSend(v9, "objectForKey:", *(_QWORD *)(v5 + 24));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(v7);
          v15 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
            objc_msgSend(*(id *)(v5 + 8), "addObject:", v15);
        }
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v12);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v8);
          v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
          if ((objc_msgSend(v7, "containsObject:", v20) & 1) == 0)
            objc_msgSend(*(id *)(v5 + 16), "addObject:", v20);
        }
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      }
      while (v17);
    }
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      if (v10)
        v21 = (void *)v10[1];
      else
        v21 = 0;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v36;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k);
            if ((objc_msgSend(*(id *)(v5 + 16), "containsObject:", v26) & 1) == 0)
              objc_msgSend(*(id *)(v5 + 8), "addObject:", v26);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
        }
        while (v23);
      }
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      if (v10)
        v10 = (_QWORD *)v10[2];
      result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
      if (result)
      {
        v27 = result;
        v28 = *(_QWORD *)v32;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v32 != v28)
              objc_enumerationMutation(v10);
            v30 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v29);
            if ((objc_msgSend(*(id *)(v5 + 8), "containsObject:", v30, (_QWORD)v31) & 1) == 0)
              objc_msgSend(*(id *)(v5 + 16), "addObject:", v30);
            ++v29;
          }
          while (v27 != v29);
          result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
          v27 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

@end
