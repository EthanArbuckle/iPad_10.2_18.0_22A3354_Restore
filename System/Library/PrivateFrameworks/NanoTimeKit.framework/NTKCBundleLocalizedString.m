@implementation NTKCBundleLocalizedString

__CFString *__NTKCBundleLocalizedString_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = a2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        NTKCDefaultValueLocalizedString(*(void **)(a1 + 32), *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10), v7, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (__CFString *)v11;
          objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "shouldHideForSensitivity:", a3);

          if (v14)
          {

            v12 = &stru_1E6BDC918;
          }
          goto LABEL_12;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

@end
