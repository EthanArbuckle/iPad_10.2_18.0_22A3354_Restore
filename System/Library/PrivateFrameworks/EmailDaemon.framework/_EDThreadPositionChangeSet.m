@implementation _EDThreadPositionChangeSet

- (_EDThreadPositionChangeSet)init
{
  _EDThreadPositionChangeSet *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *objectIDsToAddByBeforeObjectID;
  NSMutableDictionary *v5;
  NSMutableDictionary *objectIDsToMoveByBeforeObjectID;
  NSMutableSet *v7;
  NSMutableSet *objectIDsToDelete;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_EDThreadPositionChangeSet;
  v2 = -[_EDThreadPositionChangeSet init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objectIDsToAddByBeforeObjectID = v2->_objectIDsToAddByBeforeObjectID;
    v2->_objectIDsToAddByBeforeObjectID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objectIDsToMoveByBeforeObjectID = v2->_objectIDsToMoveByBeforeObjectID;
    v2->_objectIDsToMoveByBeforeObjectID = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    objectIDsToDelete = v2->_objectIDsToDelete;
    v2->_objectIDsToDelete = v7;

  }
  return v2;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD aBlock[4];
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41___EDThreadPositionChangeSet_description__block_invoke_2;
  aBlock[3] = &unk_1E949FF50;
  v48 = &__block_literal_global_318;
  v22 = _Block_copy(aBlock);
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__24;
  v45 = __Block_byref_object_dispose__24;
  v46 = 0;
  -[_EDThreadPositionChangeSet objectIDsToAddByBeforeObjectID](self, "objectIDsToAddByBeforeObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v3;
  v37[1] = 3221225472;
  v37[2] = __41___EDThreadPositionChangeSet_description__block_invoke_3;
  v37[3] = &unk_1E949FF78;
  v5 = v22;
  v38 = v5;
  v39 = &__block_literal_global_318;
  v40 = &v41;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v37);

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__24;
  v35 = __Block_byref_object_dispose__24;
  v36 = 0;
  -[_EDThreadPositionChangeSet objectIDsToMoveByBeforeObjectID](self, "objectIDsToMoveByBeforeObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v3;
  v27[1] = 3221225472;
  v27[2] = __41___EDThreadPositionChangeSet_description__block_invoke_4;
  v27[3] = &unk_1E949FF78;
  v7 = v5;
  v28 = v7;
  v29 = &__block_literal_global_318;
  v30 = &v31;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v27);

  -[_EDThreadPositionChangeSet objectIDsToDelete](self, "objectIDsToDelete");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[_EDThreadPositionChangeSet objectIDsToDelete](self, "objectIDsToDelete");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v49, 16);
    v13 = v12;
    if (v12)
    {
      v14 = *(_QWORD *)v24;
      v15 = 1;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
          if ((v15 & 1) == 0)
            v12 = objc_msgSend(v10, "appendString:", CFSTR(", "));
          __41___EDThreadPositionChangeSet_description__block_invoke(v12, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appendString:", v18);

          v15 = 0;
          ++v16;
        }
        while (v13 != v16);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v49, 16);
        v13 = v12;
        v15 = 0;
      }
      while (v12);
    }

    objc_msgSend(v10, "appendString:", CFSTR("]"));
  }
  else
  {
    v10 = 0;
  }
  v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v20 = v19;
  if (v42[5])
    objc_msgSend(v19, "appendFormat:", CFSTR("Add:\n%@"), v42[5]);
  if (v32[5])
  {
    if (objc_msgSend(v20, "length"))
      objc_msgSend(v20, "appendString:", CFSTR("\n"));
    objc_msgSend(v20, "appendFormat:", CFSTR("Move:\n%@"), v32[5]);
  }
  if (v10)
  {
    if (objc_msgSend(v20, "length"))
      objc_msgSend(v20, "appendString:", CFSTR("\n"));
    objc_msgSend(v20, "appendFormat:", CFSTR("Delete:\n%@"), v10);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v41, 8);

  return v20;
}

- (BOOL)addObjectIDToAdd:(id)a3 before:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD *, uint64_t, void *, _BYTE *);
  void *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v7 = a3;
  v8 = a4;
  -[_EDThreadPositionChangeSet objectIDsToDelete](self, "objectIDsToDelete");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPrecomputedThreadQueryHandler.m"), 837, CFSTR("Adding a thread based on position of a thread that was deleted"));

  }
  -[_EDThreadPositionChangeSet objectIDsToMoveByBeforeObjectID](self, "objectIDsToMoveByBeforeObjectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    || -[_EDThreadPositionChangeSet _isMovingObjectID:](self, "_isMovingObjectID:", v8)
    || -[_EDThreadPositionChangeSet isDeletingObjectID:](self, "isDeletingObjectID:", v7))
  {
    v13 = 0;
  }
  else
  {
    -[_EDThreadPositionChangeSet objectIDsToAddByBeforeObjectID](self, "objectIDsToAddByBeforeObjectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "addObject:", v7);
    }
    else
    {
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 1;
      -[_EDThreadPositionChangeSet objectIDsToAddByBeforeObjectID](self, "objectIDsToAddByBeforeObjectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __54___EDThreadPositionChangeSet_addObjectIDToAdd_before___block_invoke;
      v27 = &unk_1E949FFA0;
      v18 = v8;
      v28 = v18;
      v19 = v7;
      v29 = v19;
      v30 = &v31;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", &v24);

      if (*((_BYTE *)v32 + 24))
      {
        v20 = objc_alloc(MEMORY[0x1E0C99E10]);
        v21 = (void *)objc_msgSend(v20, "initWithObjects:", v19, 0, v24, v25, v26, v27, v28);
        -[_EDThreadPositionChangeSet objectIDsToAddByBeforeObjectID](self, "objectIDsToAddByBeforeObjectID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v18);

      }
      _Block_object_dispose(&v31, 8);
    }

    v13 = 1;
  }

  return v13;
}

- (BOOL)addObjectIDToMove:(id)a3 before:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v7 = a3;
  v8 = a4;
  -[_EDThreadPositionChangeSet objectIDsToDelete](self, "objectIDsToDelete");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPrecomputedThreadQueryHandler.m"), 875, CFSTR("Moving a thread that was deleted"));

  }
  -[_EDThreadPositionChangeSet objectIDsToDelete](self, "objectIDsToDelete");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v8);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPrecomputedThreadQueryHandler.m"), 876, CFSTR("Moving a thread based on position of a thread that was deleted"));

  }
  -[_EDThreadPositionChangeSet objectIDsToMoveByBeforeObjectID](self, "objectIDsToMoveByBeforeObjectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__24;
    v44 = __Block_byref_object_dispose__24;
    v45 = 0;
    -[_EDThreadPositionChangeSet objectIDsToMoveByBeforeObjectID](self, "objectIDsToMoveByBeforeObjectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __55___EDThreadPositionChangeSet_addObjectIDToMove_before___block_invoke;
    v37[3] = &unk_1E949FFC8;
    v17 = v7;
    v38 = v17;
    v39 = &v40;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v37);

    if (v41[5])
    {
      -[_EDThreadPositionChangeSet objectIDsToMoveByBeforeObjectID](self, "objectIDsToMoveByBeforeObjectID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, v41[5]);

    }
    -[_EDThreadPositionChangeSet objectIDsToMoveByBeforeObjectID](self, "objectIDsToMoveByBeforeObjectID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "addObject:", v17);
    }
    else
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 1;
      -[_EDThreadPositionChangeSet objectIDsToMoveByBeforeObjectID](self, "objectIDsToMoveByBeforeObjectID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      v29[1] = 3221225472;
      v29[2] = __55___EDThreadPositionChangeSet_addObjectIDToMove_before___block_invoke_2;
      v29[3] = &unk_1E949FFA0;
      v22 = v8;
      v30 = v22;
      v23 = v17;
      v31 = v23;
      v32 = &v33;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v29);

      if (*((_BYTE *)v34 + 24))
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:", v23, 0);
        -[_EDThreadPositionChangeSet objectIDsToMoveByBeforeObjectID](self, "objectIDsToMoveByBeforeObjectID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v22);

      }
      _Block_object_dispose(&v33, 8);
    }

    _Block_object_dispose(&v40, 8);
  }

  return v14 == 0;
}

- (void)addObjectIDToDelete:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_EDThreadPositionChangeSet objectIDsToDelete](self, "objectIDsToDelete");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (BOOL)isAddingObjectID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[_EDThreadPositionChangeSet objectIDsToAddByBeforeObjectID](self, "objectIDsToAddByBeforeObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___EDThreadPositionChangeSet_isAddingObjectID___block_invoke;
  v8[3] = &unk_1E949FFC8;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

- (BOOL)_isMovingObjectID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[_EDThreadPositionChangeSet objectIDsToMoveByBeforeObjectID](self, "objectIDsToMoveByBeforeObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48___EDThreadPositionChangeSet__isMovingObjectID___block_invoke;
  v8[3] = &unk_1E949FFC8;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

- (BOOL)isDeletingObjectID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_EDThreadPositionChangeSet objectIDsToDelete](self, "objectIDsToDelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSMutableDictionary)objectIDsToAddByBeforeObjectID
{
  return self->_objectIDsToAddByBeforeObjectID;
}

- (void)setObjectIDsToAddByBeforeObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToAddByBeforeObjectID, a3);
}

- (NSMutableDictionary)objectIDsToMoveByBeforeObjectID
{
  return self->_objectIDsToMoveByBeforeObjectID;
}

- (void)setObjectIDsToMoveByBeforeObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToMoveByBeforeObjectID, a3);
}

- (NSMutableSet)objectIDsToDelete
{
  return self->_objectIDsToDelete;
}

- (void)setObjectIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToDelete, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDsToDelete, 0);
  objc_storeStrong((id *)&self->_objectIDsToMoveByBeforeObjectID, 0);
  objc_storeStrong((id *)&self->_objectIDsToAddByBeforeObjectID, 0);
}

@end
