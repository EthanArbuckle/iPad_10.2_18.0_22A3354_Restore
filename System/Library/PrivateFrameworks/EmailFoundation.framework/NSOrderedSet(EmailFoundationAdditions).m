@implementation NSOrderedSet(EmailFoundationAdditions)

- (id)ef_subarrayWithRange:()EmailFoundationAdditions
{
  size_t v7;
  uint64_t v8;
  char *v9;
  size_t v10;
  char *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a4 > 0xC80000)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSOrderedSet(EmailFoundationAdditions) ef_subarrayWithRange:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("EFNSOrderedSetAdditions.m"), 88, CFSTR("Temporary buffer too large or with a negative count (%zu)."), a4);

  }
  if (a4 <= 1)
    v7 = 1;
  else
    v7 = a4;
  MEMORY[0x1E0C80A78](a1);
  v9 = (char *)v16 - v8;
  bzero((char *)v16 - v8, v10);
  if (a4 > 0x100)
  {
    v9 = (char *)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
    v11 = v9;
  }
  else
  {
    bzero(v9, 8 * v7);
    v11 = 0;
  }
  objc_msgSend(a1, "getObjects:range:", v9, a3, a4);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  free(v11);
  return v12;
}

- (id)ef_compactMap:()EmailFoundationAdditions
{
  void (**v5)(id, _QWORD);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFNSOrderedSetAdditions.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transform"));

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v5[2](v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)ef_flatten
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          objc_msgSend(v8, "ef_flatten");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "unionOrderedSet:", v9);

        }
        else
        {
          objc_msgSend(v2, "addObject:", v7, (_QWORD)v11);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return v2;
}

- (id)ef_flatMap:()EmailFoundationAdditions
{
  void (**v5)(id, _QWORD);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFNSOrderedSetAdditions.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transform"));

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v5[2](v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "unionOrderedSet:", v11);
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)ef_filter:()EmailFoundationAdditions
{
  unsigned int (**v5)(id, _QWORD);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFNSOrderedSetAdditions.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("test"));

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v5[2](v5, v11))
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)ef_prefix:()EmailFoundationAdditions
{
  void *v5;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = (void *)objc_msgSend(a1, "copy");
  }
  else
  {
    objc_msgSend(a1, "ef_subsetWithRange:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)ef_suffix:()EmailFoundationAdditions
{
  void *v5;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = (void *)objc_msgSend(a1, "copy");
  }
  else
  {
    objc_msgSend(a1, "ef_subsetWithRange:", objc_msgSend(a1, "count") - a3, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)ef_subsetWithRange:()EmailFoundationAdditions
{
  size_t v7;
  uint64_t v8;
  char *v9;
  size_t v10;
  char *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a4 > 0xC80000)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSOrderedSet(EmailFoundationAdditions) ef_subsetWithRange:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("EFNSOrderedSetAdditions.m"), 82, CFSTR("Temporary buffer too large or with a negative count (%zu)."), a4);

  }
  if (a4 <= 1)
    v7 = 1;
  else
    v7 = a4;
  MEMORY[0x1E0C80A78](a1);
  v9 = (char *)v16 - v8;
  bzero((char *)v16 - v8, v10);
  if (a4 > 0x100)
  {
    v9 = (char *)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
    v11 = v9;
  }
  else
  {
    bzero(v9, 8 * v7);
    v11 = 0;
  }
  objc_msgSend(a1, "getObjects:range:", v9, a3, a4);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:count:", v9, a4);
  free(v11);
  return v12;
}

- (id)ef_anyPassingTest:()EmailFoundationAdditions
{
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)ef_any:()EmailFoundationAdditions
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "ef_anyPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)ef_all:()EmailFoundationAdditions
{
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__NSOrderedSet_EmailFoundationAdditions__ef_all___block_invoke;
  v9[3] = &unk_1E62A62C8;
  v10 = v4;
  v5 = v4;
  objc_msgSend(a1, "ef_anyPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return v7;
}

- (uint64_t)ef_countObjectsPassingTest:()EmailFoundationAdditions
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v6 += v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v6;
}

- (id)ef_partition:()EmailFoundationAdditions
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v4[2](v4, v11))
          v12 = v5;
        else
          v12 = v6;
        objc_msgSend(v12, "addObject:", v11, (_QWORD)v15);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)ef_objectBeforeObject:()EmailFoundationAdditions
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "indexOfObject:", v4);
  v6 = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "objectAtIndex:", v5 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)ef_objectAfterObject:()EmailFoundationAdditions
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 >= objc_msgSend(a1, "count") - 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", v5 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
