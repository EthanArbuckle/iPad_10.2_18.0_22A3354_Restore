@implementation AXNotificationObserverClientDied

void ___AXNotificationObserverClientDied_block_invoke(uint64_t a1)
{
  __CFString **v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  CFIndex Count;
  const void **v17;
  const void **v18;
  uint64_t i;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t j;
  void *v24;
  void *v25;
  int v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
  CFDictionaryGetValue((CFDictionaryRef)ObserverDictionary, (const void *)0x270F);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v29;
LABEL_3:
    v9 = 0;
    v10 = v7 + v6;
    while (1)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
      objc_msgSend(v11, "observer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 40));

      if (v13)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        v7 = v10;
        if (v6)
          goto LABEL_3;
        v5 = v3;
        v2 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
        goto LABEL_14;
      }
    }
    AXRuntimeLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v11;
      _os_log_impl(&dword_1B54A6000, v14, OS_LOG_TYPE_INFO, "Removing client observer: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7 + v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    if (v5)
    {
      objc_msgSend(v3, "removeObjectsAtIndexes:", v5);
      goto LABEL_14;
    }
  }
  else
  {
LABEL_14:

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "count") == 0;
  v15 = *(id *)(a1 + 40);
  Count = CFDictionaryGetCount((CFDictionaryRef)v2[222]);
  v17 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  if (v17)
  {
    v18 = v17;
    v27 = v3;
    CFDictionaryGetKeysAndValues((CFDictionaryRef)v2[222], 0, v17);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        v20 = (id)v18[i];
        v21 = objc_msgSend(v20, "count");
        if (v21)
        {
          v22 = v21;
          for (j = 0; j < v22; ++j)
          {
            objc_msgSend(v20, "objectAtIndex:", j);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "observer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqual:", v15);

            if (v26)
            {
              objc_msgSend(v20, "removeObjectAtIndex:", j);
              --v22;
            }

          }
        }

      }
    }
    free(v18);
    v3 = v27;
  }

}

@end
