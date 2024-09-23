@implementation LSCopyClaimedActivityIdentifiersAndDomains

void ___LSCopyClaimedActivityIdentifiersAndDomains_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  CFSetRef v6;
  const __CFSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFSetRef v11;
  const __CFSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = _LSBundleCopyUserActivityTypes(**(void ***)(a1 + 48), a2, a3);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v6;
  v8 = -[__CFSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        CFSetAddValue(*(CFMutableSetRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(const void **)(*((_QWORD *)&v20 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[__CFSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v11 = _LSBundleCopyUserActivityDomainNames(**(_QWORD **)(a1 + 48), a2, a3);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v11;
  v13 = -[__CFSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        CFSetAddValue(*(CFMutableSetRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(const void **)(*((_QWORD *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = -[__CFSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

void ___LSCopyClaimedActivityIdentifiersAndDomains_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _LSGetOSStatusFromNSError(v3);

}

void ___LSCopyClaimedActivityIdentifiersAndDomains_block_invoke_3(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v11 && v7)
  {
    v9 = (id)objc_msgSend(v11, "mutableCopy");
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v9;

    v10 = (id)objc_msgSend(v7, "mutableCopy");
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v10;

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = _LSGetOSStatusFromNSError(v8);
  }

}

@end
