@implementation NSArray(CDPDeviceProtocol)

- (uint64_t)prevailingLocalSecretType
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a1, "count"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = a1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 1;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
      if (objc_msgSend(v8, "conformsToProtocol:", &unk_2549CF890, (_QWORD)v10))
      {
        if (objc_msgSend(v8, "localSecretType") == 1)
          break;
      }
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_4;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v6 = 2;
  }

  return v6;
}

- (uint64_t)hasMixedSecretType
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = a1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = 0;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v2);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v9, "conformsToProtocol:", &unk_2549CF890, (_QWORD)v12))
          {
            if ((v5 & v6 & 1) != 0)
            {
              LOBYTE(v5) = 1;
              LOBYTE(v6) = 1;
              goto LABEL_18;
            }
            if (objc_msgSend(v9, "localSecretType") == 1)
              v5 = 1;
            else
              v6 |= objc_msgSend(v9, "localSecretType") == 2;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          continue;
        break;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
      LOBYTE(v6) = 0;
    }
LABEL_18:

    v10 = v5 & v6;
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

@end
