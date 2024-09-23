@implementation MSS

void ___MSS_resolvedSpecifiers_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v5 = a3;
  objc_opt_class();
  v14 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = ___MSS_resolvedSpecifiers_block_invoke_3;
        v15[3] = &unk_24F133AF8;
        v16 = *(id *)(a1 + 32);
        v17 = *(id *)(a1 + 40);
        v18 = &v23;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v7);
  }

  v12 = (void *)v24[5];
  if (v12)
    _MSS_setValue_forSpecifier_key(*(void **)(a1 + 32), v12, *(void **)(a1 + 40), v13);
  _Block_object_dispose(&v23, 8);

}

void ___MSS_resolvedSpecifiers_block_invoke_3(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  id v10;
  int hasMusicRequiredCapabilities_specifier;
  void *v12;
  id v13;

  v13 = a2;
  v8 = (void *)a1[4];
  v9 = (void *)a1[5];
  v10 = a3;
  hasMusicRequiredCapabilities_specifier = _MSS_hasMusicRequiredCapabilities_specifier(v8, v10, v9);
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE75C30]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (!hasMusicRequiredCapabilities_specifier)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (hasMusicRequiredCapabilities_specifier && (SystemHasCapabilities() & 1) != 0)
  {
LABEL_4:
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
LABEL_5:

}

void ___MSS__hasMusicRequiredCapabilities_specifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;

  v9 = a3;
  _MSS_valueForRequirementKey_specifier(*(void **)(a1 + 32), a2, *(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = objc_msgSend(v5, "isEqual:", v9);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  else
  {
    v8 = 0;
  }
  *(_BYTE *)(v7 + 24) = v8;

}

@end
