@implementation NSArray(StoreEnumeration)

- (uint64_t)mf_enumerateByStoreUsingBlock:()StoreEnumeration
{
  void *v5;
  void *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MailMessageStore.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));
  v5 = (void *)objc_msgSend(a1, "mf_dictionaryWithMessagesSortedByStore");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_msgSend(v5, "allKeys");
  result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10)));
        ++v10;
      }
      while (v8 != v10);
      result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 = result;
    }
    while (result);
  }
  return result;
}

@end
