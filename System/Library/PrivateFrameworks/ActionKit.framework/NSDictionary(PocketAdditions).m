@implementation NSDictionary(PocketAdditions)

- (uint64_t)pkt_URLEncodedFormString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a1, "allKeys"), "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_msgSend(a1, "allKeys");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(a1, "objectForKey:", v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v9 = objc_msgSend(v8, "stringValue");
          else
            v9 = objc_msgSend(v8, "description");
          v8 = (void *)v9;
        }
        objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), +[PocketAPIOperation encodeForURL:](PocketAPIOperation, "encodeForURL:", v7), +[PocketAPIOperation encodeForURL:](PocketAPIOperation, "encodeForURL:", v8)));
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  return objc_msgSend(v2, "componentsJoinedByString:", CFSTR("&"));
}

+ (id)pkt_dictionaryByParsingURLEncodedFormString:()PocketAdditions
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "componentsSeparatedByString:", CFSTR("="));
        if (objc_msgSend(v10, "count") == 2)
          objc_msgSend(v4, "setObject:forKey:", +[PocketAPIOperation decodeForURL:](PocketAPIOperation, "decodeForURL:", objc_msgSend(v10, "objectAtIndex:", 1)), +[PocketAPIOperation decodeForURL:](PocketAPIOperation, "decodeForURL:", objc_msgSend(v10, "objectAtIndex:", 0)));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return (id)objc_msgSend(v4, "copy");
}

@end
