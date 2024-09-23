@implementation LSClaimRecord(IconServicesAdditions)

- (id)_IS_iconProvideingRecord
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "typeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "claimingBundleRecord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "exportedTypeRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    v8 = MEMORY[0x1E0C809B0];
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v19[0] = v8;
        v19[1] = 3221225472;
        v19[2] = __64__LSClaimRecord_IconServicesAdditions___IS_iconProvideingRecord__block_invoke;
        v19[3] = &unk_1E5800700;
        v19[4] = v10;
        objc_msgSend(v3, "objectsPassingTest:", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "anyObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {

          v14 = v12;
          v15 = v14;
          v13 = v18;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
        continue;
      break;
    }
  }

  v13 = v18;
  v14 = v18;
  v15 = 0;
LABEL_11:
  v16 = v14;

  return v16;
}

@end
