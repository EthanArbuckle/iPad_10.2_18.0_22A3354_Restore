@implementation DMTWiFiAutoJoinValidator

- (BOOL)validateProfile:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  id v12;
  BOOL result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "payloadsOfType:", CFSTR("com.apple.wifi.managed"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "autoJoin");

        if (v11)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (!a4)
    return 0;
  DMTErrorWithCodeAndUserInfo(72, &unk_24E5A9BD8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v12;
  return result;
}

@end
