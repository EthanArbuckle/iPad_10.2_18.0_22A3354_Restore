@implementation _ICResultCache

- (void)clear
{
  NSArray *cachedResults;

  cachedResults = self->_cachedResults;
  self->_cachedResults = 0;

}

- (_ICResultCache)initWithTTL:(double)a3
{
  _ICResultCache *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ICResultCache;
  result = -[_ICResultCache init](&v5, sel_init);
  if (result)
    result->_ttlInSeconds = a3;
  return result;
}

- (void)addResults:(id)a3
{
  NSDate *v5;
  NSDate *start;
  id v7;

  objc_storeStrong((id *)&self->_cachedResults, a3);
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  start = self->_start;
  self->_start = v5;

}

- (id)searchWithTrigger:(id)a3
{
  id v4;
  double v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSDate timeIntervalSinceNow](self->_start, "timeIntervalSinceNow");
  if (self->_ttlInSeconds >= -v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_cachedResults;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "trigger", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToProactiveTrigger:", v4);

          if (v14)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[_ICResultCache clear](self, "clear");
    v6 = 0;
  }

  return v6;
}

- (BOOL)fuzzyMatchItem:(id)a3 withValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0));

  if (v8
    && (v19 = 0u,
        v20 = 0u,
        v17 = 0u,
        v18 = 0u,
        (v9 = objc_msgSend(&unk_24EF76210, "countByEnumeratingWithState:objects:count:", &v17, v21, 16)) != 0))
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(&unk_24EF76210);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v13, "stringByAppendingString:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v13) = objc_msgSend(v5, "hasPrefix:", v14);
        if ((v13 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(&unk_24EF76210, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = 0;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_13:

  return v15;
}

- (id)searchWithValue:(id)a3
{
  id v4;
  double v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSArray *v14;
  void *v15;
  _BOOL4 v16;
  _ICResultCache *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  -[NSDate timeIntervalSinceNow](self->_start, "timeIntervalSinceNow");
  if (self->_ttlInSeconds < -v5)
    goto LABEL_20;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_cachedResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
  {

    goto LABEL_20;
  }
  v8 = v7;
  v18 = self;
  v9 = 0;
  v10 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hasPrefix:", v4))
      {

      }
      else
      {
        objc_msgSend(v12, "value");
        v14 = v6;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[_ICResultCache fuzzyMatchItem:withValue:](v18, "fuzzyMatchItem:withValue:", v15, v4);

        v6 = v14;
        if (!v16)
          continue;
      }
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v9, "count") == 2)
        goto LABEL_17;
      objc_msgSend(v9, "addObject:", v12);
    }
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v8);
LABEL_17:

  self = v18;
  if (!v9)
  {
LABEL_20:
    -[_ICResultCache clear](self, "clear");
    goto LABEL_21;
  }
LABEL_22:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
}

@end
