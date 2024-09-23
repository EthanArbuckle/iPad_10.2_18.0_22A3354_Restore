@implementation CADPropertySearchPredicate(EKPredicateEvaluating)

- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "entityType");
  if (v5 != 101 && v5 != 3 && v5 != 2 || !objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  objc_msgSend(a1, "calendarIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("calendar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CADObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "calendarIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v8);

  }
  else
  {
    v10 = 1;
  }
  objc_msgSend(a1, "sourceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("calendar.source"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CADObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sourceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if ((v15 & 1) == 0)
    {
LABEL_24:
      v10 = 0;
      goto LABEL_25;
    }
  }
  else if (!(_DWORD)v10)
  {
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v4, "isMasterOrDetachedOccurrence"))
    goto LABEL_24;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "filters", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20), "ekPredicateFilterMatches:", v4))
        {
          v10 = 0;
          goto LABEL_27;
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v18)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_27:

LABEL_25:
  return v10;
}

@end
