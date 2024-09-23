@implementation IKDeserializer

+ (BOOL)token:(id *)a3 andTokenSecret:(id *)a4 fromQlineString:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  id *v16;
  int v17;
  BOOL result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(a5, "componentsSeparatedByString:", CFSTR("&"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "componentsSeparatedByString:", CFSTR("="));
        if (objc_msgSend(v12, "count") == 2)
        {
          v13 = (void *)objc_msgSend(v12, "objectAtIndex:", 0);
          v14 = objc_msgSend(v12, "objectAtIndex:", 1);
          v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("oauth_token"));
          v16 = a3;
          if ((v15 & 1) != 0
            || (v17 = objc_msgSend(v13, "isEqualToString:", CFSTR("oauth_token_secret")), v16 = a4, v17))
          {
            *v16 = (id)v14;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  if (*a3 && *a4)
    return 1;
  result = 0;
  *a3 = 0;
  *a4 = 0;
  return result;
}

+ (id)objectFromJSONString:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  IKUser *v10;
  float v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSClassFromString(CFSTR("JKArray"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (!objc_msgSend(v5, "count"))
    return v6;
  v7 = 0;
  while (1)
  {
    v8 = (void *)objc_msgSend(v5, "objectAtIndex:", v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSClassFromString(CFSTR("JKDictionary"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_16;
    }
    v9 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("type"));
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("error")) & 1) != 0)
      break;
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("user")))
    {
      v10 = objc_alloc_init(IKUser);
      -[IKUser setUserID:](v10, "setUserID:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("user_id"), v8), "unsignedIntegerValue"));
      -[IKUser setUsername:](v10, "setUsername:", objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("username"), v8));
      -[IKUser setSubscribed:](v10, "setSubscribed:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("subscription_is_active"), v8), "BOOLValue"));
LABEL_15:
      objc_msgSend(v6, "addObject:", v10);

      goto LABEL_16;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("bookmark")))
    {
      v10 = objc_alloc_init(IKBookmark);
      -[IKUser setBookmarkID:](v10, "setBookmarkID:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("bookmark_id"), v8), "integerValue"));
      -[IKUser setURL:](v10, "setURL:", objc_msgSend(a1, "_URLForKey:inDictionary:", CFSTR("url"), v8));
      -[IKUser setTitle:](v10, "setTitle:", objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("title"), v8));
      -[IKUser setDescr:](v10, "setDescr:", objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("description"), v8));
      -[IKUser setDate:](v10, "setDate:", objc_msgSend(a1, "_dateForKey:inDictionary:", CFSTR("time"), v8));
      -[IKUser setStarred:](v10, "setStarred:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("starred"), v8), "BOOLValue"));
      -[IKUser setPrivateSource:](v10, "setPrivateSource:", objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("private_source"), v8));
      -[IKUser setHashString:](v10, "setHashString:", objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("hash"), v8));
      objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("progress"), v8), "floatValue");
      -[IKUser setProgress:](v10, "setProgress:", v11);
      -[IKUser setProgressDate:](v10, "setProgressDate:", objc_msgSend(a1, "_dateForKey:inDictionary:", CFSTR("progress_timestamp"), v8));
      goto LABEL_15;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("folder")))
    {
      v10 = objc_alloc_init(IKFolder);
      -[IKUser setFolderID:](v10, "setFolderID:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("folder_id"), v8), "integerValue"));
      -[IKUser setTitle:](v10, "setTitle:", objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("title"), v8));
      -[IKUser setSyncToMobile:](v10, "setSyncToMobile:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("sync_to_mobile"), v8), "BOOLValue"));
      -[IKUser setPosition:](v10, "setPosition:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", CFSTR("position"), v8), "unsignedIntegerValue"));
      goto LABEL_15;
    }
LABEL_16:
    if (++v7 >= (unint64_t)objc_msgSend(v5, "count"))
      return v6;
  }
  v13 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("error_code")), "integerValue");
  v14 = objc_msgSend(v8, "objectForKey:", CFSTR("message"));
  v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v14, CFSTR("message"));
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.matthiasplappert.InstapaperKit"), v13, v15);
}

+ (id)_normalizedObjectForKey:(id)a3 inDictionary:(id)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(a4, "objectForKey:", a3);
  if (v4 == (void *)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    return 0;
  else
    return v4;
}

+ (id)_URLForKey:(id)a3 inDictionary:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", a3, a4);
  if (v4 && (v5 = v4, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  else
    return 0;
}

+ (id)_dateForKey:(id)a3 inDictionary:(id)a4
{
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v4 = objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", a3, a4);
  if (!v4)
    return 0;
  v5 = (void *)v4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v6);
}

@end
