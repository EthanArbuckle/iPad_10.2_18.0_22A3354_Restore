@implementation GEOConfigRemoveDelegateListenerForKey

void __GEOConfigRemoveDelegateListenerForKey_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v29 = a3;
  v32 = a4;
  v31 = a5;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    v14 = MEMORY[0x1E0C809B0];
    v30 = v10;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD **)(*((_QWORD *)&v35 + 1) + 8 * v15);
        v17 = *(_QWORD *)(a1 + 48);
        if (*(_DWORD *)(a1 + 40))
          v18 = v17 == 0;
        else
          v18 = 1;
        if (v18
          || (!v16 ? (v19 = 0, LODWORD(v20) = 0) : (v20 = v16[5], v19 = v16[6]),
              *(_DWORD *)(a1 + 40) == (_DWORD)v20 ? (v21 = v17 == v19) : (v21 = 0),
              v21))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = v14;
          v33[1] = 3221225472;
          v33[2] = __GEOConfigRemoveDelegateListenerForKey_block_invoke_2;
          v33[3] = &unk_1E1C106F8;
          v34 = *(id *)(a1 + 32);
          v23 = objc_msgSend(v22, "indexOfObjectPassingTest:", v33);
          if (v23 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v22, "removeObjectAtIndex:", v23);
            if (!objc_msgSend(v22, "count"))
            {
              -[_GEOConfigKeyHelper keyString](v16);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[_GEOConfigKeyHelper keyNumber](v16);
              v25 = v14;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v16);
              objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, v24);
              objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, v26);
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              _GEORemoveChangeListenerForKeys(v27);

              v14 = v25;
              v10 = v30;

            }
          }

        }
        ++v15;
      }
      while (v12 != v15);
      v28 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v12 = v28;
    }
    while (v28);
  }

}

BOOL __GEOConfigRemoveDelegateListenerForKey_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id *v6;
  id *v7;
  id v8;
  void *v9;
  id WeakRetained;
  _BOOL8 v11;

  v6 = a2;
  v7 = v6;
  if (v6 && (v8 = objc_loadWeakRetained(v6 + 3)) != 0)
  {
    v9 = v8;
    WeakRetained = objc_loadWeakRetained(v7 + 3);
    *a4 = WeakRetained == *(id *)(a1 + 32);

    v11 = *a4;
  }
  else
  {
    v11 = 0;
    *a4 = 0;
  }

  return v11;
}

@end
