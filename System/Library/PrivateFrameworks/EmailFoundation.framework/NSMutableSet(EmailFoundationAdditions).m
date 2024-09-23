@implementation NSMutableSet(EmailFoundationAdditions)

- (void)ef_removeObjectsInArray:()EmailFoundationAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "removeObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)ef_uniquedObject:()EmailFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
    objc_msgSend(a1, "addObject:", v5);
  }

  return v5;
}

- (void)ef_addOptionalObject:()EmailFoundationAdditions
{
  id v4;

  v4 = a3;
  if (v4)
    objc_msgSend(a1, "addObject:", v4);

}

@end
