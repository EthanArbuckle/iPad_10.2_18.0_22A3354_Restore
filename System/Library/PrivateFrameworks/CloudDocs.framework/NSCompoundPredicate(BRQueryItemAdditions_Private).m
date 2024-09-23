@implementation NSCompoundPredicate(BRQueryItemAdditions_Private)

- (id)_br_watchedURLWithORPredicate1:()BRQueryItemAdditions_Private predicate2:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  objc_msgSend(a3, "br_watchedURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_watchedFileObjectID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend(v5, "br_urlWithWatchedChildren");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v9 = 0;
    if (v6 && v10)
    {
      if (objc_msgSend(v6, "isEqual:", v10))
        v9 = v11;
      else
        v9 = 0;
    }

  }
  return v9;
}

- (id)_br_watchedParentURLWithORPredicate1:()BRQueryItemAdditions_Private predicate2:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  objc_msgSend(a3, "br_urlWithWatchedChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_fileObjectIDWithWatchedChildren");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend(v5, "br_urlWithWatchedChildren");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v9 = 0;
    if (v6 && v10)
    {
      if (objc_msgSend(v6, "isEqual:", v10))
        v9 = v11;
      else
        v9 = 0;
    }

  }
  return v9;
}

- (id)br_watchedURL
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "compoundPredicateType") == 1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "subpredicates", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "br_watchedURL");
          v7 = objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            v13 = (id)v7;
            goto LABEL_19;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v4)
          continue;
        break;
      }
    }
    goto LABEL_16;
  }
  if (objc_msgSend(a1, "compoundPredicateType") != 2)
    return 0;
  objc_msgSend(a1, "subpredicates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") != 2)
    goto LABEL_16;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_br_watchedURLWithORPredicate1:predicate2:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_br_watchedURLWithORPredicate1:predicate2:", v11, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_16:

      return 0;
    }
  }
  v13 = v10;

LABEL_19:
  return v13;
}

- (id)br_urlWithWatchedChildren
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "compoundPredicateType") == 1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "subpredicates", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "br_urlWithWatchedChildren");
          v7 = objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            v13 = (id)v7;
            goto LABEL_19;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v4)
          continue;
        break;
      }
    }
    goto LABEL_16;
  }
  if (objc_msgSend(a1, "compoundPredicateType") != 2)
    return 0;
  objc_msgSend(a1, "subpredicates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") != 2)
    goto LABEL_16;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_br_watchedParentURLWithORPredicate1:predicate2:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_br_watchedParentURLWithORPredicate1:predicate2:", v11, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_16:

      return 0;
    }
  }
  v13 = v10;

LABEL_19:
  return v13;
}

@end
