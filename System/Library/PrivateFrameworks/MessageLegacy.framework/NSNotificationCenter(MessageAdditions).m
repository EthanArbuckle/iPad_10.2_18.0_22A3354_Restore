@implementation NSNotificationCenter(MessageAdditions)

- (uint64_t)mf_addImmediateObserver:()MessageAdditions selector:name:object:
{
  uint64_t v10;
  _QWORD v12[4];
  id v13[2];
  id location;

  objc_initWeak(&location, val);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__NSNotificationCenter_MessageAdditions__mf_addImmediateObserver_selector_name_object___block_invoke;
  v12[3] = &unk_1E81CBB08;
  objc_copyWeak(v13, &location);
  v13[1] = a4;
  v10 = objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:", a5, a6, 0, v12);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v10;
}

- (uint64_t)mf_removeObservers:()MessageAdditions
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(a1, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

@end
