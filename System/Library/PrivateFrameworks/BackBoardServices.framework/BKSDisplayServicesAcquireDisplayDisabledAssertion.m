@implementation BKSDisplayServicesAcquireDisplayDisabledAssertion

void __BKSDisplayServicesAcquireDisplayDisabledAssertion_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[5];
  id v4;

  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy_;
  v3[4] = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __BKSDisplayServicesAcquireDisplayDisabledAssertion_block_invoke_45;
  v2[3] = &unk_1E1EA0528;
  v2[4] = v3;
  objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("com.apple.backboard.display-disabled"), v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BKSDisplayServicesAcquireDisplayDisabledAssertion_assertion;
  BKSDisplayServicesAcquireDisplayDisabledAssertion_assertion = v0;

  _Block_object_dispose(v3, 8);
}

void __BKSDisplayServicesAcquireDisplayDisabledAssertion_block_invoke_45(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
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
  objc_msgSend(a2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "mutableCopy");
  objc_msgSend(v4, "minusSet:", v3);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v5, "minusSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        _BKSSetDisplayDisabled(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v10++), 1);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        _BKSSetDisplayDisabled(*(void **)(*((_QWORD *)&v16 + 1) + 8 * v15++), 0);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

@end
