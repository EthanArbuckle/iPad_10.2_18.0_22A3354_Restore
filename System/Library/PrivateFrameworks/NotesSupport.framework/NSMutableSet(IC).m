@implementation NSMutableSet(IC)

- (void)ic_addNonNilObject:()IC
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)ic_removeNonNilObject:()IC
{
  if (a3)
    return (void *)objc_msgSend(a1, "removeObject:");
  return a1;
}

- (void)ic_addObjectsFromNonNilArray:()IC
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObjectsFromArray:");
  return a1;
}

- (void)ic_removeObjectsFromNonNilArray:()IC
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "removeObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)ic_addNonEmptyString:()IC
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v7;
    if (v6)
    {
      objc_msgSend(a1, "addObject:", v7);
      v5 = v7;
    }
  }

}

@end
