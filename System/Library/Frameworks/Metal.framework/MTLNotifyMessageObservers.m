@implementation MTLNotifyMessageObservers

uint64_t ___MTLNotifyMessageObservers_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)s_notifierArray;
  result = objc_msgSend((id)s_notifierArray, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        v8 = (void *)objc_msgSend(v7, "filter");
        if (!v8
          || (v9 = v8, v10 = objc_msgSend(v8, "messageType"), (objc_msgSend(*(id *)(a1 + 32), "messageType") & v10) != 0)
          && (!objc_msgSend(v9, "device")
           || !objc_msgSend(*(id *)(a1 + 32), "device")
           || (v11 = objc_msgSend(v9, "device"), v11 == objc_msgSend(*(id *)(a1 + 32), "device"))))
        {
          v12 = objc_msgSend(v7, "handler");
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v12 + 16))(v12, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

@end
