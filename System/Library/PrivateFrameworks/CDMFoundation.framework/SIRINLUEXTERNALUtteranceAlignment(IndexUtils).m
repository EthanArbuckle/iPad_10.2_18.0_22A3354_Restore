@implementation SIRINLUEXTERNALUtteranceAlignment(IndexUtils)

- (uint64_t)getStartIndex
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "spans");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "spans", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    LODWORD(v8) = -1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "startIndex");
        if (v8 >= v10)
          v8 = v10;
        else
          v8 = v8;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

- (uint64_t)getEndIndex
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  unsigned int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "spans", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    LODWORD(v4) = 0;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v1);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "endIndex");
        if (v4 <= v7)
          v4 = v7;
        else
          v4 = v4;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)subsumedBy:()IndexUtils
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  _BOOL8 v10;

  v4 = a3;
  objc_msgSend(v4, "spans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "spans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_6;
  v8 = objc_msgSend(v4, "getStartIndex");
  if (v8 > objc_msgSend(a1, "getStartIndex"))
    goto LABEL_6;
  v9 = objc_msgSend(v4, "getEndIndex");
  v10 = v9 >= objc_msgSend(a1, "getEndIndex");
LABEL_7:

  return v10;
}

- (BOOL)overlaps:()IndexUtils
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  _BOOL8 v10;

  v4 = a3;
  objc_msgSend(v4, "spans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "spans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_6;
  v8 = objc_msgSend(a1, "getStartIndex");
  if (v8 >= objc_msgSend(v4, "getEndIndex"))
    goto LABEL_6;
  v9 = objc_msgSend(a1, "getEndIndex");
  v10 = v9 > objc_msgSend(v4, "getStartIndex");
LABEL_7:

  return v10;
}

- (BOOL)equalIndexes:()IndexUtils
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  _BOOL8 v10;

  v4 = a3;
  objc_msgSend(v4, "spans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "spans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_6;
  v8 = objc_msgSend(v4, "getStartIndex");
  if (v8 != objc_msgSend(a1, "getStartIndex"))
    goto LABEL_6;
  v9 = objc_msgSend(v4, "getEndIndex");
  v10 = v9 == objc_msgSend(a1, "getEndIndex");
LABEL_7:

  return v10;
}

- (uint64_t)compareStartAndSize:()IndexUtils
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(a1, "spans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    objc_msgSend(v4, "spans");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      v16 = 0;
      goto LABEL_12;
    }
  }
  objc_msgSend(a1, "spans");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v4, "spans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = objc_msgSend(a1, "getStartIndex");
      v13 = objc_msgSend(a1, "getEndIndex");
      v14 = objc_msgSend(v4, "getStartIndex");
      v15 = objc_msgSend(v4, "getEndIndex");
      if (v12 >= v14)
      {
        if (v12 > v14)
          goto LABEL_8;
        if (v13 <= v15)
        {
          v16 = v13 < v15;
          goto LABEL_12;
        }
      }
    }
    v16 = -1;
    goto LABEL_12;
  }
LABEL_8:
  v16 = 1;
LABEL_12:

  return v16;
}

+ (uint64_t)subset:()IndexUtils of:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v6;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v7)
      {
        v8 = v7;
        v26 = v6;
        v9 = *(_QWORD *)v41;
        v27 = *(_QWORD *)v41;
        v28 = v5;
        while (2)
        {
          v10 = 0;
          v29 = v8;
          do
          {
            if (*(_QWORD *)v41 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
            v12 = objc_msgSend(v5, "count", v26);
            if (v12 <= objc_msgSend(v11, "count"))
            {
              v31 = v10;
              v38 = 0u;
              v39 = 0u;
              v36 = 0u;
              v37 = 0u;
              v13 = v5;
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
              if (!v14)
              {
LABEL_31:

                v24 = 1;
                v5 = v28;
                goto LABEL_32;
              }
              v15 = v14;
              v16 = *(_QWORD *)v37;
              while (1)
              {
                v17 = 0;
LABEL_12:
                if (*(_QWORD *)v37 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v17);
                v32 = 0u;
                v33 = 0u;
                v34 = 0u;
                v35 = 0u;
                v19 = v11;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                if (!v20)
                  break;
                v21 = v20;
                v22 = *(_QWORD *)v33;
LABEL_16:
                v23 = 0;
                while (1)
                {
                  if (*(_QWORD *)v33 != v22)
                    objc_enumerationMutation(v19);
                  if (*(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v23) == v18)
                    break;
                  if (v21 == ++v23)
                  {
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                    if (v21)
                      goto LABEL_16;
                    goto LABEL_26;
                  }
                }

                if (++v17 != v15)
                  goto LABEL_12;
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
                if (!v15)
                  goto LABEL_31;
              }
LABEL_26:

              v9 = v27;
              v5 = v28;
              v8 = v29;
              v10 = v31;
            }
            ++v10;
          }
          while (v10 != v8);
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
          if (v8)
            continue;
          break;
        }
        v24 = 0;
LABEL_32:
        v6 = v26;
      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 1;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end
