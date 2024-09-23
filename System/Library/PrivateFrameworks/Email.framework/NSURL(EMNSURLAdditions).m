@implementation NSURL(EMNSURLAdditions)

+ (id)em_mailToFromQueryItemKey
{
  if (em_mailToFromQueryItemKey_onceToken != -1)
    dispatch_once(&em_mailToFromQueryItemKey_onceToken, &__block_literal_global_37);
  return (id)em_mailToFromQueryItemKey_mailToFromQueryItem;
}

- (BOOL)em_isMessageURL
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "em_messageIDHeader");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)em_messageIDHeader
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(a1, "ef_hasScheme:", CFSTR("message")))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setQuery:", 0);
    objc_msgSend(v2, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("message"), "length") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("//")))
    {
      objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("//"), "length"));
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    objc_msgSend(v5, "stringByRemovingPercentEncoding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSURL _isValidMessageID:]((_BOOL8)a1, v7))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)em_isInternalMessageURL
{
  void *v1;
  _BOOL8 v2;

  -[NSURL _databaseID](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (EMInternalMessageID)em_internalMessageID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  EMInternalMessageID *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSURL _databaseID](a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v3, "queryItems", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v8, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("uuid")))
          {

          }
          else
          {
            objc_msgSend(v8, "value");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10 == 0;

            if (!v11)
            {
              objc_msgSend(v8, "value");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_15;
            }
          }
        }
        v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_15:

    v12 = -[EMInternalMessageID initWithDatabaseID:externalID:]([EMInternalMessageID alloc], "initWithDatabaseID:externalID:", objc_msgSend(v2, "longLongValue"), v5);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)em_isAccountURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  if (!-[NSURL _hasAccountScheme]((uint64_t)a1))
    return 0;
  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3)
    return 0;
  objc_msgSend(a1, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") < 2;

  return v5;
}

- (BOOL)em_isMailboxURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  if (!-[NSURL _hasAccountScheme]((uint64_t)a1))
    return 0;
  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3)
    return 0;
  objc_msgSend(a1, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v5;
}

@end
