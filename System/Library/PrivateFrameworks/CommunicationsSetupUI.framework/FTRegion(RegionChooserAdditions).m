@implementation FTRegion(RegionChooserAdditions)

- (BOOL)isLeafNode
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "subRegions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "subRegions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") == 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (uint64_t)search:()RegionChooserAdditions withResults:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(a1, "isLeafNode"))
    {
      objc_msgSend(a1, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8
        && objc_msgSend(v8, "length")
        && (v10 = objc_msgSend(v9, "length"),
            objc_msgSend(a1, "label"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "rangeOfString:options:range:locale:", v6, 1, 0, v10, 0),
            v11,
            v12 != 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_msgSend(v7, "addObject:", a1);
        LOBYTE(v13) = 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(a1, "subRegions", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
      {
        v16 = v15;
        v13 = 0;
        v17 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            v13 |= objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "search:withResults:", v6, v7);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v16);
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13 & 1;
}

@end
