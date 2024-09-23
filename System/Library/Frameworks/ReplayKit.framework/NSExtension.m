@implementation NSExtension

void __125__NSExtension_RPExtensions__extensionsWithMatchingPointName_baseIdentifier_activationRule_unwantedActivationRule_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v29 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      v30 = v7;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v9);
        objc_msgSend(v10, "extensionPointIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_extensionBundle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("NSExtensionPointIdentifier %@ _extensionBundle %@"), v11, v12);

        if (!*(_QWORD *)(a1 + 32)
          || (objc_msgSend(v10, "identifier"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "hasPrefix:", *(_QWORD *)(a1 + 32)),
              v13,
              v14))
        {
          objc_msgSend(v10, "attributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationRule"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = v8;
            v18 = v16;
            v19 = v18;
            if (*(_QWORD *)(a1 + 40))
            {
              objc_msgSend(v18, "objectForKeyedSubscript:");
              v20 = objc_claimAutoreleasedReturnValue();
              if (!v20)
                goto LABEL_15;
              v21 = (void *)v20;
              objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "BOOLValue");

              if (!v23)
                goto LABEL_15;
            }
            if (*(_QWORD *)(a1 + 48))
            {
              objc_msgSend(v19, "objectForKeyedSubscript:");
              v24 = objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                v25 = (void *)v24;
                objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "BOOLValue");

                if ((v27 & 1) != 0)
                {
LABEL_15:

                  v8 = v17;
                  v7 = v30;
LABEL_20:

                  goto LABEL_21;
                }
              }
            }

            v8 = v17;
            v7 = v30;
          }
          else if (*(_QWORD *)(a1 + 40))
          {
            goto LABEL_20;
          }
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
          goto LABEL_20;
        }
LABEL_21:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }
  v28 = *(_QWORD *)(a1 + 64);
  if (v28)
    (*(void (**)(uint64_t, _QWORD, id))(v28 + 16))(v28, *(_QWORD *)(a1 + 56), v29);

}

@end
