@implementation EDThreadPositionChangeSet

id __41___EDThreadPositionChangeSet_description__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == v2)
  {
    objc_msgSend(v2, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "conversationID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __41___EDThreadPositionChangeSet_description__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        if ((v8 & 1) == 0)
          objc_msgSend(v4, "appendString:", CFSTR(", "), (_QWORD)v12);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v10);

        v8 = 0;
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = 0;
    }
    while (v6);
  }

  objc_msgSend(v4, "appendString:", CFSTR("]"));
  return v4;
}

void __41___EDThreadPositionChangeSet_description__block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CB37A0]);
  (*(void (**)(void))(a1[4] + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("\t%@ -> %@"), v7, v8);

  v10 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v10 + 40);
  v12 = (id *)(v10 + 40);
  v11 = v13;
  if (v13)
    objc_msgSend(v11, "appendFormat:", CFSTR("\n%@"), v9);
  else
    objc_storeStrong(v12, v9);

}

void __41___EDThreadPositionChangeSet_description__block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CB37A0]);
  (*(void (**)(void))(a1[4] + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("\t%@ -> %@"), v7, v8);

  v10 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v10 + 40);
  v12 = (id *)(v10 + 40);
  v11 = v13;
  if (v13)
    objc_msgSend(v11, "appendFormat:", CFSTR("\n%@"), v9);
  else
    objc_storeStrong(v12, v9);

}

void __54___EDThreadPositionChangeSet_addObjectIDToAdd_before___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "containsObject:", a1[4]))
  {
    v8[0] = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ef_insertObjects:before:", v7, a1[4]);

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __55___EDThreadPositionChangeSet_addObjectIDToMove_before___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;

  v9 = a2;
  v8 = a3;
  if (objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v8, "removeObject:", *(_QWORD *)(a1 + 32));
    if (!objc_msgSend(v8, "count"))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __55___EDThreadPositionChangeSet_addObjectIDToMove_before___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "containsObject:", a1[4]))
  {
    v8[0] = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ef_insertObjects:before:", v7, a1[4]);

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __47___EDThreadPositionChangeSet_isAddingObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __48___EDThreadPositionChangeSet__isMovingObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
