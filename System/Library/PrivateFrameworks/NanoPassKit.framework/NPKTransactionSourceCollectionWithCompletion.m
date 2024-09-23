@implementation NPKTransactionSourceCollectionWithCompletion

void __NPKTransactionSourceCollectionWithCompletion_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EF28]), "initWithAccountUser:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7));
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v9 = objc_alloc(MEMORY[0x24BE6EF30]);
  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v11 = objc_msgSend(v9, "initWithTransactionSources:", v10);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
