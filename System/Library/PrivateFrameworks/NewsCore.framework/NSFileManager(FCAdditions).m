@implementation NSFileManager(FCAdditions)

- (uint64_t)fc_sizeOfItemAtURL:()FCAdditions error:
{
  id v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v7 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v27, *MEMORY[0x1E0C999D0], a4);
  v8 = v27;
  v9 = v8;
  v10 = 0;
  if (v7)
  {
    if (objc_msgSend(v8, "BOOLValue"))
    {
      v11 = *MEMORY[0x1E0C99998];
      v29[0] = *MEMORY[0x1E0C99998];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v12, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v15)
      {
        v16 = v15;
        v10 = 0;
        v17 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v22 = 0;
            if (objc_msgSend(v19, "getResourceValue:forKey:error:", &v22, v11, 0))
              v10 += objc_msgSend(v22, "unsignedLongLongValue");
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v16);
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v21 = 0;
      v10 = 0;
      if (objc_msgSend(v6, "getResourceValue:forKey:error:", &v21, *MEMORY[0x1E0C99998], a4))
        v10 = objc_msgSend(v21, "unsignedLongLongValue");
    }
  }

  return v10;
}

- (uint64_t)fc_removeContentsOfDirectoryAtURL:()FCAdditions
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a3, MEMORY[0x1E0C9AA60], 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    LOBYTE(v8) = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((v8 & 1) != 0)
          v8 = objc_msgSend(a1, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), 0);
        else
          v8 = 0;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)fc_quicklyClearDirectory:()FCAdditions callbackQueue:completion:
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD block[5];
  id v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  NSTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "globallyUniqueString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  LOBYTE(v12) = objc_msgSend(a1, "moveItemAtPath:toPath:error:", v15, v14, &v29);
  v16 = v29;

  if ((v12 & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v16, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 == (void *)*MEMORY[0x1E0CB28A8])
  {
    v21 = objc_msgSend(v16, "code");

    if (v21 == 4)
    {
LABEL_2:
      dispatch_get_global_queue(-2, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_2;
      block[3] = &unk_1E46464B0;
      block[4] = a1;
      v23 = v14;
      v25 = v9;
      v24 = v8;
      dispatch_async(v17, block);

      v18 = v23;
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {

  }
  if (v9)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke;
    v26[3] = &unk_1E463B2D0;
    v28 = v9;
    v27 = v16;
    dispatch_async(v8, v26);

    v18 = v28;
    goto LABEL_8;
  }
LABEL_9:

}

- (uint64_t)fc_sizeOfItemAtPath:()FCAdditions error:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "fc_sizeOfItemAtURL:error:", v6, a4);

  return v7;
}

@end
