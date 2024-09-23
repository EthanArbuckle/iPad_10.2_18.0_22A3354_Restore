@implementation LACAccessControl

+ (id)allowAllACL
{
  SecAccessControlRef v2;
  void *v3;

  v2 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFTypeRef)*MEMORY[0x24BDE8FA0], 0, 0);
  v3 = (void *)SecAccessControlCopyData();
  CFRelease(v2);
  return v3;
}

+ (BOOL)checkACLAllowsAll:(id)a3
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)SecAccessControlCreateFromData();
  if (v3 && (SecAccessControlGetRequirePassword() & 1) == 0)
  {
    SecAccessControlGetConstraints();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "allValues", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      v10 = (const void *)*MEMORY[0x24BDBD270];
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if (!CFEqual(*(CFTypeRef *)(*((_QWORD *)&v13 + 1) + 8 * i), v10))
          {
            v4 = 0;
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v4 = 1;
LABEL_14:

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
