@implementation _DKSyncWindow

- (void)setStartDate:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (_QWORD)initWithEvent:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_DKSyncWindow;
    v5 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      objc_msgSend(v4, "startDate");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)a1[2];
      a1[2] = v6;

      objc_msgSend(v4, "endDate");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)a1[3];
      a1[3] = v8;

    }
  }

  return a1;
}

+ (id)syncWindowWithStartDate:(void *)a3 endDate:
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = (void *)objc_opt_new();
  -[_DKSyncWindow setStartDate:]((uint64_t)v6, v5);

  -[_DKSyncWindow setEndDate:]((uint64_t)v6, v4);
  return v6;
}

- (void)setEndDate:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)event
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

- (id)unionWithSyncWindow:(id *)a1
{
  void **v3;
  void **v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v23;
  void *v24;
  id *v25;
  uint64_t v26;

  v3 = a2;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_49;
  }
  v4 = a1 + 2;
  objc_msgSend(a1[2], "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(a1[3], "timeIntervalSinceReferenceDate");
  v8 = v7;
  if (v3)
    v9 = v3[2];
  else
    v9 = 0;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;
  if (v3)
    v12 = v3[3];
  else
    v12 = 0;
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;
  if (v6 <= v11 && v11 <= v8)
  {
    if (v6 <= v13 && v13 <= v8)
    {
      v25 = a1;
LABEL_48:
      v18 = v25;
      goto LABEL_49;
    }
    v18 = (void *)objc_opt_new();
    -[_DKSyncWindow setStartDate:]((uint64_t)v18, *v4);
    if (v8 <= v14)
      goto LABEL_29;
    goto LABEL_39;
  }
  if (v11 <= v6 && v6 <= v13)
  {
    if (v11 <= v8 && v8 <= v13)
    {
      v25 = v3;
      goto LABEL_48;
    }
    v23 = objc_opt_new();
    v18 = (void *)v23;
    if (v3)
      v24 = v3[2];
    else
      v24 = 0;
    -[_DKSyncWindow setStartDate:](v23, v24);
    if (v14 > v8)
    {
LABEL_29:
      if (v3)
      {
LABEL_30:
        v21 = v3[3];
LABEL_40:
        -[_DKSyncWindow setEndDate:]((uint64_t)v18, v21);
        goto LABEL_49;
      }
      goto LABEL_56;
    }
LABEL_39:
    v21 = a1[3];
    goto LABEL_40;
  }
  if (v6 <= v13 && v13 <= v8)
  {
    v17 = objc_opt_new();
    v18 = (void *)v17;
    if (v6 >= v11)
    {
      if (!v3)
      {
        v19 = 0;
        goto LABEL_22;
      }
      v4 = v3 + 2;
    }
    v19 = *v4;
LABEL_22:
    -[_DKSyncWindow setStartDate:](v17, v19);
    goto LABEL_39;
  }
  v18 = 0;
  if (v11 <= v8 && v8 <= v13)
  {
    v26 = objc_opt_new();
    v18 = (void *)v26;
    if (v11 < v6)
    {
      if (!v3)
      {
        -[_DKSyncWindow setStartDate:](v26, 0);
        goto LABEL_56;
      }
      v4 = v3 + 2;
    }
    -[_DKSyncWindow setStartDate:](v26, *v4);
    if (v3)
      goto LABEL_30;
LABEL_56:
    v21 = 0;
    goto LABEL_40;
  }
LABEL_49:

  return v18;
}

- (uint64_t)startDate
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

+ (id)sortedUnionOfSortedWindows:(void *)a3 andSortedWindows:
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObjectsFromArray:", v4);
  objc_msgSend(v6, "sortUsingSelector:", sel_compare_);
  return v6;
}

+ (id)windowsThatOverlapWithWindowMinimumDate:(void *)a3 windowMaximumDate:(void *)a4 sortedSyncWindows:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  v9 = (void *)objc_opt_new();
  v10 = (id *)objc_opt_new();
  -[_DKSyncWindow setStartDate:]((uint64_t)v10, v6);
  -[_DKSyncWindow setEndDate:]((uint64_t)v10, v7);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[_DKSyncWindow unionWithSyncWindow:](v10, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v9, "addObject:", v16, (_QWORD)v19);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  return v9;
}

+ (id)choppedWindowsFromSortedNormalizedWindows:(id)a3 betweenWindowMinimumDate:(id)a4 andWindowMaximumDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count") && objc_msgSend(v7, "count"))
  {
    v10 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        v11 = (_QWORD *)v11[3];
      v13 = objc_msgSend(v11, "compare:", v8);

      if (v13 == 1)
        break;
      if (++v10 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_25;
    }
    v14 = objc_msgSend(v7, "count");
    v15 = v14 - 1;
    while (1)
    {
      v16 = v15;
      if (--v14 < 0)
        break;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v14);
      v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        v17 = (_QWORD *)v17[2];
      v19 = objc_msgSend(v17, "compare:", v9);

      v15 = v16 - 1;
      if (v19 == -1)
      {
        if (v10)
          goto LABEL_19;
        goto LABEL_17;
      }
    }
    v14 = -1;
    if (v10)
      goto LABEL_19;
LABEL_17:
    if (v14 == objc_msgSend(v7, "count") - 1)
    {
      v20 = v7;
      goto LABEL_24;
    }
LABEL_19:
    if (v14 < 0)
      goto LABEL_25;
    if (v16 < 0)
      v21 = -1;
    else
      v21 = v16;
    objc_msgSend(v7, "subarrayWithRange:", v10, v21 - v10 + 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
    v22 = v20;
  }
  else
  {
LABEL_25:
    v22 = 0;
  }

  return v22;
}

+ (id)lastWindowMissingFromSortedNormalizedWindows:(void *)a3 windowMinimumDate:(void *)a4 windowMaximumDate:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (_QWORD *)v9;
    if (v9)
      v11 = *(void **)(v9 + 16);
    else
      v11 = 0;
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToDate:", v7) & 1) != 0)
    {
      if (v10)
        v13 = (void *)v10[3];
      else
        v13 = 0;
      v14 = objc_msgSend(v13, "isEqualToDate:", v8);

      if ((v14 & 1) != 0)
        goto LABEL_18;
    }
    else
    {

    }
    if (v10)
      v16 = (void *)v10[2];
    else
      v16 = 0;
    v17 = v16;
    if (objc_msgSend(v17, "compare:", v7) == 1)
    {

    }
    else
    {
      if (v10)
        v18 = (void *)v10[3];
      else
        v18 = 0;
      v19 = objc_msgSend(v18, "compare:", v8);

      if (v19 != -1)
      {
LABEL_18:
        v15 = 0;
        goto LABEL_38;
      }
    }
    if (v10)
      v20 = (void *)v10[3];
    else
      v20 = 0;
    if (objc_msgSend(v20, "compare:", v8) == -1)
    {
      v15 = (void *)objc_opt_new();
      if (v10)
        v23 = (void *)v10[3];
      else
        v23 = 0;
      objc_msgSend(v23, "laterDate:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKSyncWindow setStartDate:]((uint64_t)v15, v24);

      v22 = (uint64_t)v15;
      v21 = v8;
    }
    else
    {
      if (objc_msgSend(v6, "count") != 1)
      {
        objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "count") - 2);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v25)
          v27 = *(_QWORD *)(v25 + 24);
        else
          v27 = 0;
        objc_msgSend(v7, "laterDate:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v29 = (void *)v10[2];
        else
          v29 = 0;
        v30 = v29;
        objc_msgSend(v30, "timeIntervalSinceReferenceDate");
        v32 = v31;
        objc_msgSend(v28, "timeIntervalSinceReferenceDate");
        if (v32 - v33 <= 0.000001)
        {
          v15 = 0;
        }
        else
        {
          v15 = (void *)objc_opt_new();
          -[_DKSyncWindow setStartDate:]((uint64_t)v15, v28);
          -[_DKSyncWindow setEndDate:]((uint64_t)v15, v30);
        }

        goto LABEL_38;
      }
      v15 = (void *)objc_opt_new();
      -[_DKSyncWindow setStartDate:]((uint64_t)v15, v7);
      if (v10)
        v21 = (void *)v10[2];
      else
        v21 = 0;
      v22 = (uint64_t)v15;
    }
    -[_DKSyncWindow setEndDate:](v22, v21);
LABEL_38:

    goto LABEL_39;
  }
  v15 = (void *)objc_opt_new();
  -[_DKSyncWindow setStartDate:]((uint64_t)v15, v7);
  -[_DKSyncWindow setEndDate:]((uint64_t)v15, v8);
LABEL_39:

  return v15;
}

+ (id)lastWindowMissingFromSortedWindows:(void *)a3 windowMinimumDate:(void *)a4 windowMaximumDate:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  if (objc_msgSend(v6, "count"))
  {
    +[_DKSyncWindow unionOfSortedSyncWindows:]((uint64_t)_DKSyncWindow, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKSyncWindow windowsThatOverlapWithWindowMinimumDate:windowMaximumDate:sortedSyncWindows:]((uint64_t)_DKSyncWindow, v7, v8, v10);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[_DKSyncWindow lastWindowMissingFromSortedNormalizedWindows:windowMinimumDate:windowMaximumDate:](v9, v6, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)windowsMissingFromSortedWindows:(void *)a3 windowMinimumDate:(void *)a4 windowMaximumDate:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  double v16;
  double v17;
  double v18;
  id *v19;
  id v20;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    +[_DKSyncWindow unionOfSortedSyncWindows:]((uint64_t)_DKSyncWindow, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKSyncWindow windowsThatOverlapWithWindowMinimumDate:windowMaximumDate:sortedSyncWindows:]((uint64_t)_DKSyncWindow, v7, v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v12, "copy");
    v14 = v8;
    v15 = 0;
    while (1)
    {
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
      v17 = v16;
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      if (v17 <= v18)
      {
        v6 = v13;
        v19 = v15;
        goto LABEL_11;
      }
      +[_DKSyncWindow lastWindowMissingFromSortedNormalizedWindows:windowMinimumDate:windowMaximumDate:]((uint64_t)v9, v13, v7, v14);
      v19 = (id *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        break;
      objc_msgSend(v10, "insertObject:atIndex:", v19, 0);
      v20 = v19[2];

      objc_msgSend(v9, "choppedWindowsFromSortedNormalizedWindows:betweenWindowMinimumDate:andWindowMaximumDate:", v13, v7, v20);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v13 = v6;
        v15 = v19;
        v14 = v20;
        if (objc_msgSend(v6, "count"))
          continue;
      }
      goto LABEL_12;
    }
    v6 = v13;
LABEL_11:
    v20 = v14;
LABEL_12:
    if (!objc_msgSend(v10, "count"))
    {

      v10 = 0;
    }

  }
  else
  {
    v19 = (id *)objc_opt_new();
    -[_DKSyncWindow setStartDate:]((uint64_t)v19, v7);
    -[_DKSyncWindow setEndDate:]((uint64_t)v19, v8);
    objc_msgSend(v10, "addObject:", v19);
  }

  return v10;
}

+ (id)redundantWindowsFromSortedWindows:(void *)a3 olderThanDate:
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  id *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v4, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = *(void **)(v7 + 16);
    else
      v9 = 0;
    +[_DKSyncWindow lastWindowMissingFromSortedWindows:windowMinimumDate:windowMaximumDate:]((uint64_t)_DKSyncWindow, v4, v9, v5);
    v10 = (id *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v40 = v10;
      v11 = v10[3];
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v12 = v4;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v46;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v46 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v16);
            if (v17)
              v18 = *(void **)(v17 + 16);
            else
              v18 = 0;
            v19 = v18;
            objc_msgSend(v19, "timeIntervalSinceReferenceDate");
            v21 = v20;
            objc_msgSend(v11, "timeIntervalSinceReferenceDate");
            v23 = v22;

            if (v21 >= v23)
            {
              if (v17)
                v24 = *(void **)(v17 + 24);
              else
                v24 = 0;
              objc_msgSend(v24, "timeIntervalSinceReferenceDate");
              v26 = v25;
              objc_msgSend(v5, "timeIntervalSinceReferenceDate");
              if (v26 > v27)
                goto LABEL_22;
              objc_msgSend(v6, "addObject:", v17);
            }
            ++v16;
          }
          while (v14 != v16);
          v28 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          v14 = v28;
        }
        while (v28);
      }
LABEL_22:

      v10 = v40;
    }
    else
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v11 = v4;
      v29 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v42;
LABEL_26:
        v32 = 0;
        while (1)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(v11);
          v33 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v32);
          v34 = v33 ? *(void **)(v33 + 24) : 0;
          objc_msgSend(v34, "timeIntervalSinceReferenceDate");
          v36 = v35;
          objc_msgSend(v5, "timeIntervalSinceReferenceDate");
          if (v36 > v37)
            break;
          objc_msgSend(v6, "addObject:", v33);
          if (v30 == ++v32)
          {
            v38 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            v30 = v38;
            if (v38)
              goto LABEL_26;
            break;
          }
        }
        v10 = 0;
      }
    }

    if ((unint64_t)objc_msgSend(v6, "count") <= 1)
    {

      v6 = 0;
    }

  }
  return v6;
}

+ (id)unionOfSortedSyncWindows:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v3, "count", (_QWORD)v16))
        {
          objc_msgSend(v3, "addObject:", v9);
          continue;
        }
        objc_msgSend(v3, "lastObject");
        v10 = (id *)objc_claimAutoreleasedReturnValue();
        -[_DKSyncWindow unionWithSyncWindow:](v10, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (!v11)
        {
          v13 = v3;
          v14 = v9;
          goto LABEL_12;
        }
        if ((id *)v11 != v10)
        {
          objc_msgSend(v3, "removeObjectAtIndex:", objc_msgSend(v3, "count") - 1);
          v13 = v3;
          v14 = v12;
LABEL_12:
          objc_msgSend(v13, "addObject:", v14);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)completedWindowsWithSortedEvents:(void *)a3 windows:(uint64_t)a4 fetchOrder:(uint64_t)a5 fillOrder:(int)a6 hitLimit:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a2;
  v12 = objc_opt_self();
  objc_msgSend(v11, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKSyncWindow completedWindowsFromWindows:firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:](v12, v10, v13, v14, a4, a5, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)completedWindowsFromWindows:(void *)a3 firstEvent:(void *)a4 lastEvent:(uint64_t)a5 fetchOrder:(uint64_t)a6 fillOrder:(int)a7 hitLimit:
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  void *v36;
  char v37;
  double v38;
  id v39;
  _BOOL4 v40;
  uint64_t v41;
  int v42;
  void *v43;
  uint64_t v44;
  int v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  uint64_t v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  id obj;
  id obja;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  id v88;
  __int16 v89;
  const __CFString *v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  const __CFString *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  v71 = a4;
  v67 = objc_opt_self();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = CFSTR("UNKNOWN");
    v57 = CFSTR("oldest");
    if (a5 != 1)
      v57 = CFSTR("UNKNOWN");
    if (a5 == 2)
      v57 = CFSTR("newest");
    obja = (id)v55;
    v77 = v57;
    switch(a6)
    {
      case 1:
        v56 = CFSTR("always-full");
        break;
      case 2:
        v56 = CFSTR("old-to-new");
        break;
      case 3:
        v56 = CFSTR("new-to-old");
        break;
    }
    v61 = v56;
    v58 = CFSTR("was not");
    if (a7)
      v58 = CFSTR("was");
    v66 = v58;
    objc_msgSend(v13, "UUID", v61);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "UUIDString");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "creationDate");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate dk_localtimeString](v75);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "UUID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "UUIDString");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "creationDate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate dk_localtimeString](v60);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    _DKSyncLoggingWindowsDescription(v12);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    v88 = obja;
    v89 = 2114;
    v90 = v77;
    v91 = 2114;
    v92 = v62;
    v93 = 2114;
    v94 = v66;
    v95 = 2114;
    v96 = v59;
    v97 = 2114;
    v98 = v69;
    v99 = 2114;
    v100 = v63;
    v101 = 2114;
    v102 = v65;
    v103 = 2114;
    v104 = v64;
    _os_log_debug_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Computing completed windows using fetch order %{public}@, fill order %{public}@, limit %{public}@ hit, first event %{public}@ (created %{public}@), last event %{public}@ (created %{public}@) from windows %{public}@", buf, 0x5Cu);

  }
  if (a6 == 1 || (v15 = 0, v13) && v71)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a6)
    {
      case 3:
        if (a5 != 1)
          a7 = 0;
        v17 = 1;
        goto LABEL_21;
      case 2:
        if (a5 == 2)
          v17 = a7;
        else
          v17 = 0;
        a7 = 1;
        goto LABEL_21;
      case 1:
        if (a7)
        {
          v16 = a5 == 2;
          v17 = a5 == 2;
          a7 = !v16;
          goto LABEL_21;
        }
        break;
      default:
        a7 = 0;
        break;
    }
    v17 = 0;
LABEL_21:
    v70 = v13;
    objc_msgSend(v13, "creationDate");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "timeIntervalSinceReferenceDate");
    v19 = v18;
    objc_msgSend(v71, "creationDate");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "timeIntervalSinceReferenceDate");
    v21 = v20;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "timeIntervalSinceReferenceDate");
    v23 = v22;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v68 = v12;
    obj = v12;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
    if (!v24)
      goto LABEL_67;
    v25 = v24;
    v26 = *(_QWORD *)v83;
    v72 = a7;
    while (1)
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v83 != v26)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v27);
        if (v28)
        {
          v29 = *(id *)(v28 + 16);
          v30 = *(void **)(v28 + 24);
        }
        else
        {
          v29 = 0;
          v30 = 0;
        }
        v31 = v30;
        objc_msgSend(v29, "timeIntervalSinceReferenceDate");
        v33 = v32;
        objc_msgSend(v31, "timeIntervalSinceReferenceDate");
        if (v34 < v19 && v17)
        {
LABEL_32:
          v36 = 0;
          goto LABEL_63;
        }
        v36 = 0;
        if (v33 > v21)
          v37 = a7;
        else
          v37 = 0;
        if ((v37 & 1) == 0 && v33 <= v23)
        {
          v38 = v34;
          if (v34 > v23)
          {
            v39 = v74;

            v31 = v39;
            v38 = v23;
          }
          v40 = v33 < v19 && v17;
          if (v40 && v19 < v38)
          {
            +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v76, v31);
            v41 = objc_claimAutoreleasedReturnValue();
            v36 = (void *)v41;
            if (v33 < v21)
              v42 = a7;
            else
              v42 = 0;
            if (v42 == 1 && v21 < v38)
            {
              if (v41)
              {
                +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, *(void **)(v41 + 16), v78);
                v43 = v15;
                v44 = objc_claimAutoreleasedReturnValue();

                v36 = (void *)v44;
                v15 = v43;
                a7 = v72;
                goto LABEL_52;
              }
LABEL_59:
              +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v29, v78);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v36)
              {
LABEL_60:
                v46 = (id)v28;
                if (!v28)
                  goto LABEL_32;
                v36 = v46;
              }
            }
            else
            {
LABEL_52:
              if (!v36)
                goto LABEL_60;
            }
            objc_msgSend(v15, "addObject:", v36);
            goto LABEL_63;
          }
          if (v33 < v21)
            v45 = a7;
          else
            v45 = 0;
          if (v45 == 1 && v21 < v38)
            goto LABEL_59;
          goto LABEL_60;
        }
LABEL_63:

        ++v27;
      }
      while (v25 != v27);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
      v25 = v47;
      if (!v47)
      {
LABEL_67:

        v12 = v68;
        v13 = v70;
        break;
      }
    }
  }
  objc_msgSend(v15, "lastObject");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  if (v48)
    v50 = *(void **)(v48 + 24);
  else
    v50 = 0;
  v51 = v50;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "isEqualToDate:", v52))
    +[_DKSyncWindow completedWindowsFromWindows:firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:].cold.1();

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    +[_DKSyncWindow completedWindowsFromWindows:firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:].cold.2(v67, v15, v53);

  return v15;
}

+ (id)dictionaryArrayFromWindows:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v5)
  {
    v7 = v5;
    v8 = CFSTR("startDate");
    v9 = *(_QWORD *)v24;
    *(_QWORD *)&v6 = 138543874;
    v22 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
        if (v11)
        {
          v12 = *(id *)(v11 + 16);
          v13 = *(void **)(v11 + 24);
        }
        else
        {
          v12 = 0;
          v13 = 0;
        }
        v14 = v13;
        v15 = v14;
        if (v12 && v14)
        {
          v33[0] = v8;
          v33[1] = CFSTR("endDate");
          v34[0] = v12;
          v34[1] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v16);
        }
        else
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel", v22);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v17 = v8;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v28 = v18;
            v29 = 2112;
            v30 = v12;
            v31 = 2112;
            v32 = v15;
            _os_log_error_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to encode window due to missing date where startDate = %@ and endDate = %@", buf, 0x20u);

            v8 = v17;
          }
        }

        ++v10;
      }
      while (v7 != v10);
      v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      v7 = v19;
    }
    while (v19);
  }

  v20 = (void *)objc_msgSend(v3, "copy");
  return v20;
}

+ (id)windowsFromDictionaryArray:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v21;
    *(_QWORD *)&v6 = 138543874;
    v18 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("startDate"), v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endDate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (v14)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v18;
            v25 = v19;
            v26 = 2112;
            v27 = v11;
            v28 = 2112;
            v29 = v13;
            _os_log_error_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode window due to missing date where startDate = %@ and endDate = %@", buf, 0x20u);

          }
        }
        else
        {
          +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v11, v12);
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v15);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_event);
    objc_storeStrong(v5 + 2, self->_startDate);
    objc_storeStrong(v5 + 3, self->_endDate);
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = 31 * -[NSDate hash](self->_startDate, "hash");
  return -[NSDate hash](self->_endDate, "hash") ^ v3;
}

- (uint64_t)isEqualToWindow:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(*(id *)(a1 + 16), "isEqualToDate:", v4[2]))
      v5 = objc_msgSend(*(id *)(a1 + 24), "isEqualToDate:", v4[3]);
    else
      v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _DKSyncWindow *v4;
  char v5;

  v4 = (_DKSyncWindow *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[_DKSyncWindow isEqualToWindow:]((uint64_t)self, v4);
    else
      v5 = 0;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  NSComparisonResult v6;
  uint64_t v7;

  v4 = a3;
  if (v4)
    v5 = v4[2];
  else
    v5 = 0;
  v6 = -[NSDate compare:](self->_startDate, "compare:", v5);
  if (v6 == NSOrderedSame)
  {
    if (v4)
      v7 = v4[3];
    else
      v7 = 0;
    v6 = -[NSDate compare:](self->_endDate, "compare:", v7);
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSDate dk_localtimeString](self->_startDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](self->_endDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ to %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  double v3;
  double v4;
  double v5;
  double v6;
  _DKEvent *event;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
  v6 = v4 - v5;
  event = self->_event;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSyncWindow description](self, "description");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (event)
  {
    -[_DKObject UUID](self->_event, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ %p: %@ (delta=%f), event=%@>"), v10, self, v12, *(_QWORD *)&v6, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ %p: %@ (delta=%f)>"), v10, self, v11, *(_QWORD *)&v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

+ (void)completedWindowsFromWindows:firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:.cold.1()
{
  __assert_rtn("+[_DKSyncWindow completedWindowsFromWindows:firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:]", "_DKSyncWindow.m", 625, "![completedWindows.lastObject.endDate isEqualToDate:[NSDate distantFuture]]");
}

+ (void)completedWindowsFromWindows:(NSObject *)a3 firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _DKSyncLoggingWindowsDescription(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Computed completed windows %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
