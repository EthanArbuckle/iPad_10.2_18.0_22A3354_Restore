@implementation NSMutableSet(FCAdditions)

- (void)fc_removeObjectsFromArray:()FCAdditions
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

- (void)fc_safelyUnionSet:()FCAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "unionSet:");
  return a1;
}

- (void)fc_safelyAddObject:()FCAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)fc_safelyIntersectSet:()FCAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "intersectSet:");
  return a1;
}

- (void)fc_safelyMinusSet:()FCAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "minusSet:");
  return a1;
}

- (void)fc_safelyAddObjects:()FCAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObjectsFromArray:");
  return a1;
}

- (void)fc_safelyRemoveObject:()FCAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "removeObject:");
  return a1;
}

@end
