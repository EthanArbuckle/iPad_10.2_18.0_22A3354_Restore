@implementation NSArray(NSNull)

- (id)arrayDroppingNSNullValues
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "arrayDroppingNSNullValues");
            v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
            v10 = (void *)v9;
            objc_msgSend(v2, "addObject:", v9, (_QWORD)v13);

            goto LABEL_14;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "setDroppingNSNullValues");
            v9 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "dictionaryDroppingNSNullValues");
            v9 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v13);
        }
LABEL_14:
        ++v7;
      }
      while (v5 != v7);
      v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = v11;
    }
    while (v11);
  }

  return v2;
}

@end
