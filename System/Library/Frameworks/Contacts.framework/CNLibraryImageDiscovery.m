@implementation CNLibraryImageDiscovery

+ (id)imageDataForEmailAddresses:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CNLibraryFolderDiscovery discoverFoldersWithPathComponents:](CNLibraryFolderDiscovery, "discoverFoldersWithPathComponents:", &unk_1E2A40758);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v46;
    v34 = v5;
    v35 = v4;
    v28 = *(_QWORD *)v46;
    v29 = a1;
    do
    {
      v8 = 0;
      v27 = v6;
      do
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(v5);
        v31 = v8;
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v8);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v10 = v4;
        v32 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v32)
        {
          v11 = *(_QWORD *)v42;
          v36 = v10;
          v30 = *(_QWORD *)v42;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v42 != v11)
                objc_enumerationMutation(v10);
              v33 = v12;
              v13 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v12);
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              objc_msgSend(a1, "extensions", v27);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v38;
                while (2)
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v38 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v18);
                    objc_msgSend(v9, "URLByAppendingPathComponent:", v13);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "URLByAppendingPathExtension:", v19);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v21)
                    {
                      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "fileManager");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v23, "dataWithContentsOfURL:", v21);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();

                      if ((objc_msgSend(v24, "isSuccess") & 1) != 0)
                      {
                        objc_msgSend(v24, "value");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();

                        v5 = v34;
                        v4 = v35;
                        goto LABEL_28;
                      }

                    }
                    ++v18;
                  }
                  while (v16 != v18);
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
                  if (v16)
                    continue;
                  break;
                }
              }

              v12 = v33 + 1;
              v5 = v34;
              v4 = v35;
              a1 = v29;
              v11 = v30;
              v10 = v36;
            }
            while (v33 + 1 != v32);
            v32 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v32);
        }

        v8 = v31 + 1;
        v7 = v28;
      }
      while (v31 + 1 != v27);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      v7 = v28;
      v25 = 0;
    }
    while (v6);
  }
  else
  {
    v25 = 0;
  }
LABEL_28:

  return v25;
}

+ (id)extensions
{
  if (extensions_cn_once_token_0 != -1)
    dispatch_once(&extensions_cn_once_token_0, &__block_literal_global_146);
  return (id)extensions_cn_once_object_0;
}

void __37__CNLibraryImageDiscovery_extensions__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A40770, "copy");
  v1 = (void *)extensions_cn_once_object_0;
  extensions_cn_once_object_0 = v0;

}

@end
