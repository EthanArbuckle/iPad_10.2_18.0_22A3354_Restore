@implementation NSPredicate(BRQueryItemAdditions_Private)

- (uint64_t)br_watchedURL
{
  return 0;
}

- (uint64_t)br_urlWithWatchedChildren
{
  return 0;
}

- (uint64_t)br_fileObjectIDWithWatchedChildren
{
  return 0;
}

- (uint64_t)br_watchedFileObjectID
{
  return 0;
}

- (uint64_t)_isContentTypeFolderComparisonPredicate
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    if (objc_msgSend(v2, "predicateOperatorType") == 1100 || objc_msgSend(v2, "predicateOperatorType") == 1101)
    {
      objc_msgSend(v2, "leftExpression");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "br_isKeyPathExpression:", *MEMORY[0x1E0CB2DE0]))
      {
        objc_msgSend(v2, "rightExpression");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "br_isConstantValueExpression:", *MEMORY[0x1E0CA5B58]);

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)isFolderOnlyPredicate
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((objc_msgSend(v1, "_isContentTypeFolderComparisonPredicate") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v1;
      if (objc_msgSend(v3, "compoundPredicateType") == 1)
      {
        v10 = 0u;
        v11 = 0u;
        v8 = 0u;
        v9 = 0u;
        objc_msgSend(v3, "subpredicates", 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v2)
        {
          v5 = *(_QWORD *)v9;
          while (2)
          {
            for (i = 0; i != v2; ++i)
            {
              if (*(_QWORD *)v9 != v5)
                objc_enumerationMutation(v4);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isFolderOnlyPredicate") & 1) != 0)
              {
                v2 = 1;
                goto LABEL_17;
              }
            }
            v2 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
            if (v2)
              continue;
            break;
          }
        }
LABEL_17:

      }
      else
      {
        v2 = 0;
      }

    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

- (id)extractSearchTermFromPredicate
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    if (objc_msgSend(v2, "compoundPredicateType") == 2)
    {
      objc_msgSend(v2, "subpredicates");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "count") == 2)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v6 = 0;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = 0;
          if (objc_msgSend(v7, "predicateOperatorType") == 8)
          {
            objc_msgSend(v7, "leftExpression");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = *MEMORY[0x1E0CB2E08];
            if (objc_msgSend(v8, "br_isKeyPathExpression:", *MEMORY[0x1E0CB2E08]))
            {
              objc_msgSend(v7, "rightExpression");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v10, "expressionType"))
              {
                v6 = 0;
              }
              else
              {
                objc_msgSend(v10, "constantValue");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v13 = objc_opt_isKindOfClass();

                if ((v13 & 1) != 0)
                {
                  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v14, "predicateOperatorType") == 7)
                  {
                    objc_msgSend(v14, "leftExpression");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v15, "br_isKeyPathExpression:", v9))
                    {
                      objc_msgSend(v14, "rightExpression");
                      v16 = (void *)objc_claimAutoreleasedReturnValue();

                      v17 = (void *)MEMORY[0x1E0CB3940];
                      objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", v11);
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v17, "stringWithFormat:", CFSTR("* %@*"), v18);
                      v19 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v16, "br_isConstantValueExpression:", v19))
                        v6 = v11;
                      else
                        v6 = 0;

                      v10 = v16;
                    }
                    else
                    {
                      v6 = 0;
                    }
                  }
                  else
                  {
                    v6 = 0;
                    v15 = v8;
                  }

                  v8 = v15;
                }
                else
                {
                  v6 = 0;
                }

              }
            }
            else
            {
              v6 = 0;
            }

          }
        }
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
