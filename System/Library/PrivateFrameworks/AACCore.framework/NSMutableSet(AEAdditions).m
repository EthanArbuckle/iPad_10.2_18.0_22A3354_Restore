@implementation NSMutableSet(AEAdditions)

- (void)ae_removeFirstMatching:()AEAdditions
{
  uint64_t (**v4)(id, void *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      if ((v4[2](v4, v10) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_13;
    objc_msgSend(v5, "removeObject:", v11, (_QWORD)v12);
    v5 = v11;
  }
LABEL_12:

LABEL_13:
}

@end
