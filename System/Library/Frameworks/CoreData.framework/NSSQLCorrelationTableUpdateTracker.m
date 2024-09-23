@implementation NSSQLCorrelationTableUpdateTracker

- (uint64_t)trackReorders:(uint64_t)a3 forObjectWithID:
{
  uint64_t v5;
  id v6;

  if (result)
  {
    v5 = result;
    result = objc_msgSend(a2, "count");
    if (result)
    {
      v6 = *(id *)(v5 + 40);
      if (!v6)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        *(_QWORD *)(v5 + 40) = v6;
      }
      objc_msgSend(v6, "addObject:", a3);
      return objc_msgSend(*(id *)(v5 + 40), "addObject:", a2);
    }
  }
  return result;
}

- (id)initForRelationship:(id)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLCorrelationTableUpdateTracker;
  result = -[NSSQLCorrelationTableUpdateTracker init](&v5, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_inserts = 0;
  self->_deletes = 0;

  self->_masterUpdates = 0;
  self->_otherUpdates = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLCorrelationTableUpdateTracker;
  -[NSSQLCorrelationTableUpdateTracker dealloc](&v3, sel_dealloc);
}

- (uint64_t)trackInserts:(void *)a3 deletes:(void *)a4 reorders:(uint64_t)a5 forObjectWithID:
{
  id *v9;
  id v10;
  id v11;
  id v12;

  if (result)
  {
    v9 = (id *)result;
    if (objc_msgSend(a2, "count"))
    {
      v10 = v9[2];
      if (!v10)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9[2] = v10;
      }
      objc_msgSend(v10, "addObject:", a5);
      objc_msgSend(v9[2], "addObject:", a2);
    }
    if (objc_msgSend(a3, "count"))
    {
      v11 = v9[3];
      if (!v11)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9[3] = v11;
      }
      objc_msgSend(v11, "addObject:", a5);
      objc_msgSend(v9[3], "addObject:", a3);
    }
    result = objc_msgSend(a4, "count");
    if (result)
    {
      v12 = v9[4];
      if (!v12)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9[4] = v12;
      }
      objc_msgSend(v12, "addObject:", a5);
      return objc_msgSend(v9[4], "addObject:", a4);
    }
  }
  return result;
}

- (void)_organizeValues:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t j;

  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_msgSend(a2, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i < v5; i += 2)
    {
      v7 = objc_msgSend(a2, "objectAtIndex:", i);
      v8 = (void *)objc_msgSend(a2, "objectAtIndex:", i | 1);
      v9 = (void *)objc_msgSend(v3, "objectForKey:", v7);
      if (!v9)
      {
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(v3, "setObject:forKey:", v9, v7);
      }
      v10 = objc_msgSend(v8, "count");
      if (v10)
      {
        v11 = v10;
        for (j = 0; j < v11; j += 2)
          objc_msgSend(v9, "setObject:forKey:", objc_msgSend(v8, "objectAtIndex:", j + 1), objc_msgSend(v8, "objectAtIndex:", j));
      }
    }
  }
  return v3;
}

- (void)enumerateInsertsUsingBlock:(uint64_t)a1
{
  void *v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    if (v4)
      v4 = (void *)objc_msgSend(v4, "propertyDescription");
    v5 = objc_msgSend(v4, "isOrdered");
    v16 = objc_msgSend(*(id *)(a1 + 16), "count");
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    if (v5 && (v6 = *(_QWORD *)(a1 + 8)) != 0 && *(_QWORD *)(v6 + 56) == v6)
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x3052000000;
      v21 = __Block_byref_object_copy__45;
      v22 = __Block_byref_object_dispose__45;
      v23 = 0;
      v23 = -[NSSQLCorrelationTableUpdateTracker _organizeValues:](a1, *(void **)(a1 + 16));
      v15 = (void *)v19[5];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __65__NSSQLCorrelationTableUpdateTracker_enumerateInsertsUsingBlock___block_invoke;
      v17[3] = &unk_1E1EE1318;
      v17[5] = &v24;
      v17[6] = &v18;
      v17[4] = a2;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v17);
      _Block_object_dispose(&v18, 8);
    }
    else if (v16)
    {
      v7 = 0;
      if (v5)
        v8 = 2;
      else
        v8 = 1;
      do
      {
        if (*((_BYTE *)v25 + 24))
          break;
        v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "objectAtIndex:", v7), "_referenceData64");
        v10 = (void *)objc_msgSend(*(id *)(a1 + 16), "objectAtIndex:", v7 | 1);
        v11 = objc_msgSend(v10, "count");
        if (v11)
        {
          for (i = 0; i < v11; i += v8)
          {
            if (*((_BYTE *)v25 + 24))
              break;
            v13 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", i), "_referenceData64");
            v14 = v5 ? objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", i + 1), "unsignedLongLongValue") : 0;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t *))(a2 + 16))(a2, v9, v13, v14, 0, v25 + 3);
          }
        }
        v7 += 2;
      }
      while (v7 < v16);
    }
    _Block_object_dispose(&v24, 8);
  }
}

void __65__NSSQLCorrelationTableUpdateTracker_enumerateInsertsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[6];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3052000000;
    v11[3] = __Block_byref_object_copy__45;
    v11[4] = __Block_byref_object_dispose__45;
    v11[5] = a2;
    v5 = objc_msgSend(a2, "_referenceData64");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__NSSQLCorrelationTableUpdateTracker_enumerateInsertsUsingBlock___block_invoke_2;
    v6[3] = &unk_1E1EE12A0;
    v8 = *(_QWORD *)(a1 + 48);
    v9 = v11;
    v7 = *(_OWORD *)(a1 + 32);
    v10 = v5;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
    _Block_object_dispose(v11, 8);
  }
}

uint64_t __65__NSSQLCorrelationTableUpdateTracker_enumerateInsertsUsingBlock___block_invoke_2(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v4 = (_QWORD *)result;
    objc_msgSend(a3, "unsignedLongLongValue");
    objc_msgSend(a2, "_referenceData64");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v4[6] + 8) + 40), "objectForKey:", a2), "objectForKey:", *(_QWORD *)(*(_QWORD *)(v4[7] + 8) + 40)), "unsignedLongLongValue");
    return (*(uint64_t (**)(void))(v4[4] + 16))();
  }
  return result;
}

- (uint64_t)enumerateInsertsOIDsUsingBlock:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  unsigned __int8 v15;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 8);
    if (v4)
      v4 = (void *)objc_msgSend(v4, "propertyDescription");
    v5 = objc_msgSend(v4, "isOrdered");
    result = objc_msgSend(*(id *)(v3 + 16), "count");
    v15 = 0;
    if (result)
    {
      v6 = result;
      v7 = 0;
      if (v5)
        v8 = 2;
      else
        v8 = 1;
      do
      {
        v9 = objc_msgSend(*(id *)(v3 + 16), "objectAtIndex:", v7);
        v10 = (void *)objc_msgSend(*(id *)(v3 + 16), "objectAtIndex:", v7 | 1);
        result = objc_msgSend(v10, "count");
        v11 = v15;
        if (result)
          v12 = v15 == 0;
        else
          v12 = 0;
        if (v12)
        {
          v13 = result;
          v14 = 0;
          do
          {
            result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v9, objc_msgSend(v10, "objectAtIndex:", v14), &v15);
            v14 += v8;
            v11 = v15;
          }
          while (v14 < v13 && !v15);
        }
        v7 += 2;
      }
      while (v7 < v6 && !v11);
    }
  }
  return result;
}

- (uint64_t)enumerateDeletesUsingBlock:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 24), "count");
    v4 = result;
    v15 = 0;
    v5 = *(_QWORD *)(v3 + 8);
    if (v5)
    {
      v6 = *(_QWORD *)(v5 + 56) == v5;
      if (!result)
        return result;
    }
    else
    {
      v6 = 0;
      if (!result)
        return result;
    }
    v7 = 0;
    do
    {
      v8 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 24), "objectAtIndex:", v7), "_referenceData64");
      v9 = (void *)objc_msgSend(*(id *)(v3 + 24), "objectAtIndex:", v7 | 1);
      result = objc_msgSend(v9, "count");
      v10 = v15;
      if (result)
        v11 = v15 == 0;
      else
        v11 = 0;
      if (v11)
      {
        v12 = result;
        v13 = 1;
        do
        {
          v14 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v13 - 1), "_referenceData64");
          result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v8, v14, &v15);
          if (v6)
            result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v14, v8, &v15);
          v10 = v15;
          if (v13 >= v12)
            break;
          ++v13;
        }
        while (!v15);
      }
      v7 += 2;
    }
    while (v7 < v4 && !v10);
  }
  return result;
}

- (uint64_t)enumerateDeletesOIDsUsingBlock:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 24), "count");
    v4 = result;
    v15 = 0;
    v5 = *(_QWORD *)(v3 + 8);
    if (v5)
    {
      v6 = *(_QWORD *)(v5 + 56) == v5;
      if (!result)
        return result;
    }
    else
    {
      v6 = 0;
      if (!result)
        return result;
    }
    v7 = 0;
    do
    {
      v8 = objc_msgSend(*(id *)(v3 + 24), "objectAtIndex:", v7);
      v9 = (void *)objc_msgSend(*(id *)(v3 + 24), "objectAtIndex:", v7 | 1);
      result = objc_msgSend(v9, "count");
      v10 = v15;
      if (result)
        v11 = v15 == 0;
      else
        v11 = 0;
      if (v11)
      {
        v12 = result;
        v13 = 1;
        do
        {
          v14 = objc_msgSend(v9, "objectAtIndex:", v13 - 1);
          result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v8, v14, &v15);
          if (v6)
            result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v14, v8, &v15);
          v10 = v15;
          if (v13 >= v12)
            break;
          ++v13;
        }
        while (!v15);
      }
      v7 += 2;
    }
    while (v7 < v4 && !v10);
  }
  return result;
}

- (void)enumerateMasterReordersUsingBlock:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  unint64_t v8;
  unint64_t i;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t j;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    if (v4)
      v4 = (void *)objc_msgSend(v4, "propertyDescription");
    if (objc_msgSend(v4, "isOrdered"))
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      v5 = *(_QWORD *)(a1 + 8);
      if (v5)
      {
        v6 = *(void **)(a1 + 32);
        if (*(_QWORD *)(v5 + 56) == v5)
        {
          v17 = -[NSSQLCorrelationTableUpdateTracker _organizeValues:](a1, v6);
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __72__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersUsingBlock___block_invoke;
          v19[3] = &unk_1E1EE12F0;
          v19[4] = a2;
          v19[5] = &v20;
          objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v19);
LABEL_18:
          _Block_object_dispose(&v20, 8);
          return;
        }
        v7 = (id *)(a1 + 32);
      }
      else
      {
        v18 = *(void **)(a1 + 32);
        v7 = (id *)(a1 + 32);
        v6 = v18;
      }
      v8 = objc_msgSend(v6, "count");
      if (v8)
      {
        for (i = 0; i < v8; i += 2)
        {
          if (*((_BYTE *)v21 + 24))
            break;
          v10 = objc_msgSend((id)objc_msgSend(*v7, "objectAtIndex:", i), "_referenceData64");
          v11 = (void *)objc_msgSend(*v7, "objectAtIndex:", i | 1);
          v12 = objc_msgSend(v11, "count");
          if (v12)
          {
            for (j = 0; j < v12; j = v15 + 1)
            {
              if (*((_BYTE *)v21 + 24))
                break;
              v14 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", j), "_referenceData64");
              v15 = j + 1;
              v16 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v15), "unsignedLongLongValue");
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, v16, v10, v14, v21 + 3);
            }
          }
        }
      }
      goto LABEL_18;
    }
  }
}

uint64_t __72__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersUsingBlock___block_invoke(uint64_t result, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v4 = result;
    v5 = objc_msgSend(a2, "_referenceData64");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersUsingBlock___block_invoke_2;
    v6[3] = &unk_1E1EE12C8;
    v7 = *(_OWORD *)(v4 + 32);
    v8 = v5;
    return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
  return result;
}

uint64_t __72__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersUsingBlock___block_invoke_2(uint64_t result, void *a2, void *a3)
{
  uint64_t v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v4 = result;
    objc_msgSend(a3, "unsignedLongLongValue");
    objc_msgSend(a2, "_referenceData64");
    return (*(uint64_t (**)(void))(*(_QWORD *)(v4 + 32) + 16))();
  }
  return result;
}

- (void)enumerateMasterReordersOIDsUsingBlock:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  unint64_t v8;
  unint64_t i;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    if (v4)
      v4 = (void *)objc_msgSend(v4, "propertyDescription");
    if (objc_msgSend(v4, "isOrdered"))
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v5 = *(_QWORD *)(a1 + 8);
      if (v5)
      {
        v6 = *(void **)(a1 + 32);
        if (*(_QWORD *)(v5 + 56) == v5)
        {
          v15 = -[NSSQLCorrelationTableUpdateTracker _organizeValues:](a1, v6);
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __76__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersOIDsUsingBlock___block_invoke;
          v17[3] = &unk_1E1EE12F0;
          v17[4] = a2;
          v17[5] = &v18;
          objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v17);
LABEL_18:
          _Block_object_dispose(&v18, 8);
          return;
        }
        v7 = (id *)(a1 + 32);
      }
      else
      {
        v16 = *(void **)(a1 + 32);
        v7 = (id *)(a1 + 32);
        v6 = v16;
      }
      v8 = objc_msgSend(v6, "count");
      if (v8)
      {
        for (i = 0; i < v8; i += 2)
        {
          if (*((_BYTE *)v19 + 24))
            break;
          v10 = objc_msgSend(*v7, "objectAtIndex:", i);
          v11 = (void *)objc_msgSend(*v7, "objectAtIndex:", i | 1);
          v12 = objc_msgSend(v11, "count");
          if (v12)
          {
            for (j = 0; j < v12; j += 2)
            {
              if (*((_BYTE *)v19 + 24))
                break;
              v14 = objc_msgSend(v11, "objectAtIndex:", j);
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, v14, v10, v19 + 3);
            }
          }
        }
      }
      goto LABEL_18;
    }
  }
}

void __76__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersOIDsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD v4[7];
  _QWORD v5[6];

  v3 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(*(_QWORD *)(v3 + 8) + 24))
  {
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3052000000;
    v5[3] = __Block_byref_object_copy__45;
    v5[4] = __Block_byref_object_dispose__45;
    v5[5] = a2;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __76__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersOIDsUsingBlock___block_invoke_2;
    v4[3] = &unk_1E1EE1318;
    v4[4] = *(_QWORD *)(a1 + 32);
    v4[5] = v3;
    v4[6] = v5;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
    _Block_object_dispose(v5, 8);
  }
}

_QWORD *__76__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersOIDsUsingBlock___block_invoke_2(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  v2 = *(_QWORD *)(result[5] + 8);
  v4 = *(unsigned __int8 *)(v2 + 24);
  v3 = v2 + 24;
  if (!v4)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(result[4] + 16))(result[4], a2, *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40), v3);
  return result;
}

- (void)enumerateMasterReordersPart2UsingBlock:(uint64_t)a1
{
  void *v3;
  _QWORD v4[6];
  _QWORD v5[3];
  char v6;

  if (a1)
  {
    v3 = -[NSSQLCorrelationTableUpdateTracker _organizeValues:](a1, *(void **)(a1 + 32));
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x2020000000;
    v6 = 0;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __77__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersPart2UsingBlock___block_invoke;
    v4[3] = &unk_1E1EE12F0;
    v4[4] = a2;
    v4[5] = v5;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
    _Block_object_dispose(v5, 8);
  }
}

uint64_t __77__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersPart2UsingBlock___block_invoke(uint64_t result, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v4 = result;
    v5 = objc_msgSend(a2, "_referenceData64");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersPart2UsingBlock___block_invoke_2;
    v6[3] = &unk_1E1EE12C8;
    v7 = *(_OWORD *)(v4 + 32);
    v8 = v5;
    return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
  return result;
}

uint64_t __77__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersPart2UsingBlock___block_invoke_2(uint64_t result, void *a2, void *a3)
{
  uint64_t v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v4 = result;
    objc_msgSend(a3, "unsignedLongLongValue");
    objc_msgSend(a2, "_referenceData64");
    return (*(uint64_t (**)(void))(*(_QWORD *)(v4 + 32) + 16))();
  }
  return result;
}

- (uint64_t)enumerateReordersUsingBlock:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 v13;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 8);
    if (v4)
      v4 = (void *)objc_msgSend(v4, "propertyDescription");
    result = objc_msgSend((id)objc_msgSend(v4, "inverseRelationship"), "isOrdered");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(v3 + 40), "count");
      v13 = 0;
      if (result)
      {
        v5 = result;
        v6 = 0;
        do
        {
          v7 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 40), "objectAtIndex:", v6), "_referenceData64");
          v8 = (void *)objc_msgSend(*(id *)(v3 + 40), "objectAtIndex:", v6 | 1);
          result = objc_msgSend(v8, "count");
          v9 = v13;
          if (result)
            v10 = v13 == 0;
          else
            v10 = 0;
          if (v10)
          {
            v11 = result;
            v12 = 0;
            do
            {
              result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v12), "_referenceData64"), v7, objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v12 + 1), "unsignedLongLongValue"), &v13);
              v12 += 2;
              v9 = v13;
            }
            while (v12 < v11 && !v13);
          }
          v6 += 2;
        }
        while (v6 < v5 && !v9);
      }
    }
  }
  return result;
}

- (uint64_t)enumerateReordersOIDsUsingBlock:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 v13;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 8);
    if (v4)
      v4 = (void *)objc_msgSend(v4, "propertyDescription");
    result = objc_msgSend((id)objc_msgSend(v4, "inverseRelationship"), "isOrdered");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(v3 + 40), "count");
      v13 = 0;
      if (result)
      {
        v5 = result;
        v6 = 0;
        do
        {
          v7 = objc_msgSend(*(id *)(v3 + 40), "objectAtIndex:", v6);
          v8 = (void *)objc_msgSend(*(id *)(v3 + 40), "objectAtIndex:", v6 | 1);
          result = objc_msgSend(v8, "count");
          v9 = v13;
          if (result)
            v10 = v13 == 0;
          else
            v10 = 0;
          if (v10)
          {
            v11 = result;
            v12 = 2;
            do
            {
              result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, objc_msgSend(v8, "objectAtIndex:", v12 - 2), v7, &v13);
              v9 = v13;
              if (v12 >= v11)
                break;
              v12 += 2;
            }
            while (!v13);
          }
          v6 += 2;
        }
        while (v6 < v5 && !v9);
      }
    }
  }
  return result;
}

@end
