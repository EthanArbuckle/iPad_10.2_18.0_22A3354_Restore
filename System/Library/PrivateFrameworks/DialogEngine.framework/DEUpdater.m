@implementation DEUpdater

+ (id)summarize:(id)a3 filter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__2482;
    v37 = __Block_byref_object_dispose__2483;
    v38 = (id)objc_opt_new();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __30__DEUpdater_summarize_filter___block_invoke;
    v32[3] = &unk_1E792ECC0;
    v32[4] = &v33;
    v23 = (void *)MEMORY[0x1C3B8DDB8](v32);
    if ((objc_msgSend(v7, "apply:to:", v23, v5) & 1) != 0)
    {
      v9 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = (id)v34[5];
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v29;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v10);
            objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13++));
          }
          while (v11 != v13);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v11);
      }

      objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_opt_new();
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v22;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v25;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend((id)v34[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "version");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "writeData:", v20);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
        }
        while (v16);
      }

      objc_msgSend(v14, "close");
      objc_msgSend(v14, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to summarize \"%@\"), v5);
      v8 = 0;
    }

    _Block_object_dispose(&v33, 8);
  }

  return v8;
}

+ (BOOL)putManifest:(id)a3 src:(id)a4 contents:(id)a5 summary:(id)a6 overrides:(id)a7 dirDownloadType:(unint64_t)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  DEManifest *v22;
  DEManifest *v23;
  BOOL v24;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v12 = a4;
  v13 = a5;
  v29 = a6;
  v14 = a7;
  if (v12)
  {
    if (!v13)
      v13 = (id)objc_opt_new();
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__2482;
    v39 = __Block_byref_object_dispose__2483;
    v40 = (id)objc_opt_new();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __72__DEUpdater_putManifest_src_contents_summary_overrides_dirDownloadType___block_invoke;
    v34[3] = &unk_1E792ECC0;
    v34[4] = &v35;
    v27 = (void *)MEMORY[0x1C3B8DDB8](v34);
    if ((objc_msgSend(v13, "apply:to:", v27, v12) & 1) != 0)
    {
      if (v14)
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v31 != v17)
                objc_enumerationMutation(v15);
              v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v15, "objectForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v36[5], "objectForKey:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v21)
              {
                +[DELogging error:](DELogging, "error:", CFSTR("Failed to find \"%@\" in src dir \"%@\" in order to apply override"), v19, v12);
                v24 = 0;
                goto LABEL_19;
              }
              objc_msgSend(v21, "setDownloadType:", objc_msgSend(v20, "downloadType"));
              objc_msgSend((id)v36[5], "setObject:forKey:", v21, v19);

            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
            if (v16)
              continue;
            break;
          }
        }

      }
      +[DEUpdater summarize:filter:](DEUpdater, "summarize:filter:", v12, v29);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("manifest.pb"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = [DEManifest alloc];
      v23 = -[DEManifest initWithName:contents:summary:dirDownloadType:](v22, "initWithName:contents:summary:dirDownloadType:", v28, v36[5], v15, a8);
      v24 = -[DEManifest writeToURL:](v23, "writeToURL:", v20);

LABEL_19:
    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to putManifest to \"%@\"), v12);
      v24 = 0;
    }

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (BOOL)putManifest:(id)a3 src:(id)a4 contents:(id)a5 summary:(id)a6 overrides:(id)a7
{
  return +[DEUpdater putManifest:src:contents:summary:overrides:dirDownloadType:](DEUpdater, "putManifest:src:contents:summary:overrides:dirDownloadType:", a3, a4, a5, a6, a7, 3);
}

BOOL __72__DEUpdater_putManifest_src_contents_summary_overrides_dirDownloadType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  +[DEVersionWriter versionFile:](DEVersionWriter, "versionFile:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setVersion:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v7, v5);

  }
  return v6 != 0;
}

BOOL __30__DEUpdater_summarize_filter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  +[DEVersionWriter versionFile:](DEVersionWriter, "versionFile:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setVersion:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v7, v5);

  }
  return v6 != 0;
}

@end
