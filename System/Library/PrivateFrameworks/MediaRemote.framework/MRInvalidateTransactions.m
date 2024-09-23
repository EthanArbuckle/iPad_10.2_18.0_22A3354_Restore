@implementation MRInvalidateTransactions

void __MRInvalidateTransactions_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  __transactionShutdownTriggered = 1;
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v0 = (id)__registeredTransactions;
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v6;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v6 != v3)
          objc_enumerationMutation(v0);
        objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4++), "invalidateTransaction", (_QWORD)v5);
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    }
    while (v2);
  }

}

@end
