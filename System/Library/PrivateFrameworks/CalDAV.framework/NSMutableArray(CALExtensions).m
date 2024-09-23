@implementation NSMutableArray(CALExtensions)

- (void)removeAllObjectsWithClass:()CALExtensions
{
  id v2;
  id v3;
  uint64_t v4;
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

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "removeObjectsInArray:", v2);
}

+ (CFMutableArrayRef)nonRetainingArray
{
  __int128 v0;
  CFArrayCallBacks v2;

  v0 = *(_OWORD *)(MEMORY[0x24BDBD690] + 16);
  *(_OWORD *)&v2.version = *MEMORY[0x24BDBD690];
  *(_OWORD *)&v2.release = v0;
  v2.equal = *(CFArrayEqualCallBack *)(MEMORY[0x24BDBD690] + 32);
  v2.retain = 0;
  v2.release = 0;
  return CFArrayCreateMutable(0, 0, &v2);
}

@end
