@implementation NSIndexSet(CKUtilities)

- (id)__ck_indexPathRowsInSection:()CKUtilities
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NSIndexSet_CKUtilities____ck_indexPathRowsInSection___block_invoke;
  v8[3] = &unk_1E274E458;
  v6 = v5;
  v9 = v6;
  v10 = a3;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v8);

  return v6;
}

- (id)__ck_indexPathItemsInSection:()CKUtilities
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSIndexSet_CKUtilities____ck_indexPathItemsInSection___block_invoke;
  v8[3] = &unk_1E274E458;
  v6 = v5;
  v9 = v6;
  v10 = a3;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v8);

  return v6;
}

- (void)__ck_enumerateIndexesByProximityToIndex:()CKUtilities usingBlock:
{
  void (**v6)(id, _QWORD, char *);
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(a1, "count");
  v8 = (char *)&v16 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, 8 * v7);
  objc_msgSend(a1, "getIndexes:maxCount:inIndexRange:", v8, v7, 0);
  v9 = 0;
  if (!v7)
  {
LABEL_6:
    v11 = v9 - 1;
    HIBYTE(v16) = 0;
    while (1)
    {
LABEL_7:
      if (v9 >= v7 && v11 < 0)
        goto LABEL_24;
      if (v9 >= v7 || v11 < 0)
      {
        if (v9 >= v7)
        {
          v14 = *(_QWORD *)&v8[8 * v11];
LABEL_22:
          v6[2](v6, v14, (char *)&v16 + 7);
          --v11;
          goto LABEL_23;
        }
        v12 = *(_QWORD *)&v8[8 * v9];
      }
      else
      {
        v12 = *(_QWORD *)&v8[8 * v9];
        if ((uint64_t)(v12 - a3) >= 0)
          v13 = v12 - a3;
        else
          v13 = a3 - v12;
        v14 = *(_QWORD *)&v8[8 * v11];
        v15 = v14 - a3;
        if ((uint64_t)(v14 - a3) < 0)
          v15 = a3 - v14;
        if (v13 > v15)
          goto LABEL_22;
      }
      v6[2](v6, v12, (char *)&v16 + 7);
      ++v9;
LABEL_23:
      if (HIBYTE(v16))
        goto LABEL_24;
    }
  }
  while (1)
  {
    v10 = *(_QWORD *)&v8[8 * v9];
    if (v10 == a3)
      break;
    if (v10 > a3)
      goto LABEL_6;
    if (v7 == ++v9)
    {
      v9 = v7;
      goto LABEL_6;
    }
  }
  HIBYTE(v16) = 0;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0x7FFFFFFFFFFFFFFELL;
    v9 = 0x8000000000000000;
    goto LABEL_7;
  }
  v6[2](v6, a3, (char *)&v16 + 7);
  if (!HIBYTE(v16))
  {
    v11 = v9++ - 1;
    goto LABEL_7;
  }
LABEL_24:

}

- (id)__ck_indexSetShiftedForInsertedIndexes:()CKUtilities removedIndexes:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(v7, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v10 = objc_msgSend(v7, "firstIndex");
    v11 = objc_msgSend(v8, "firstIndex");
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11;
      v13 = 0;
      do
      {
        for (; v10 < v12; v10 = objc_msgSend(v7, "indexGreaterThanIndex:", v10))
          ++v13;
        if (v10 != v12)
          objc_msgSend(v9, "addIndex:", v12 - v13);
        v12 = objc_msgSend(v8, "indexGreaterThanIndex:", v12);
      }
      while (v12 != 0x7FFFFFFFFFFFFFFFLL);
    }

  }
  else
  {
    v9 = v8;
  }
  if (objc_msgSend(v6, "count"))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v15 = objc_msgSend(v6, "firstIndex");
    v16 = objc_msgSend(v9, "firstIndex");
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = v16;
      v18 = 0;
      do
      {
        while (v17 + v18 >= v15)
        {
          ++v18;
          v15 = objc_msgSend(v6, "indexGreaterThanIndex:", v15);
        }
        objc_msgSend(v14, "addIndex:");
        v17 = objc_msgSend(v9, "indexGreaterThanIndex:", v17);
      }
      while (v17 != 0x7FFFFFFFFFFFFFFFLL);
      objc_msgSend(v6, "indexGreaterThanIndex:", v15);
    }

  }
  else
  {
    v14 = v9;
  }

  return v14;
}

@end
