@implementation NSFileManager(HealthKit)

- (uint64_t)hk_enumerateDirectoryAtURL:()HealthKit includingPropertiesForKeys:options:error:handler:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__29;
  v44 = __Block_byref_object_dispose__29;
  v45 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __104__NSFileManager_HealthKit__hk_enumerateDirectoryAtURL_includingPropertiesForKeys_options_error_handler___block_invoke;
  v39[3] = &unk_1E37F0B38;
  v39[4] = &v40;
  objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v13, a5, v39);
  v27 = v13;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __104__NSFileManager_HealthKit__hk_enumerateDirectoryAtURL_includingPropertiesForKeys_options_error_handler___block_invoke_2;
        v28[3] = &unk_1E37F0B60;
        v30 = &v35;
        v20 = v14;
        v28[4] = v19;
        v29 = v20;
        HKWithAutoreleasePool(a6, v28);
        v21 = v36[3];
        if (v21 == 2)
        {

          goto LABEL_12;
        }
        if (!v21)
        {

          v24 = v15;
          goto LABEL_18;
        }

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_12:

  v22 = (void *)v41[5];
  if (v22)
  {
    v23 = v22;
    v24 = v23;
    if (a6)
      *a6 = objc_retainAutorelease(v23);
    else
      _HKLogDroppedError(v23);
LABEL_18:

    v25 = 0;
  }
  else
  {
    v25 = 1;
  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v40, 8);
  return v25;
}

@end
