@implementation NSString(DSAdditions)

+ (id)ds_commonParentPathForItemURLs:()DSAdditions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, unint64_t, _BYTE *);
  void *v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void (*v17)(uint64_t, void *, unint64_t, _BYTE *);
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  if (objc_msgSend(v25, "count"))
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__0;
    v42 = __Block_byref_object_dispose__0;
    objc_msgSend(v25, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathComponents");
    v43 = (id)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v25, "subarrayWithRange:", 1, objc_msgSend(v25, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v35;
      v8 = MEMORY[0x1E0C809B0];
      v9 = __56__NSString_DSAdditions__ds_commonParentPathForItemURLs___block_invoke;
      v10 = &unk_1E8752818;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v35 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "pathComponents");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v31 = &v30;
          v32 = 0x2020000000;
          v33 = 0;
          v26[0] = v8;
          v26[1] = 3221225472;
          v26[2] = v9;
          v26[3] = v10;
          v28 = &v38;
          v29 = &v30;
          v13 = v12;
          v27 = v13;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);
          if (!*((_BYTE *)v31 + 24))
          {
            if (objc_msgSend(v13, "count"))
            {
              objc_msgSend(v13, "subarrayWithRange:", 0, objc_msgSend(v13, "count") - 1);
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = (void *)v39[5];
              v39[5] = v14;
            }
            else
            {
              v16 = v10;
              v17 = v9;
              v18 = v8;
              v19 = v5;
              v20 = v39;
              v21 = v13;
              v15 = (void *)v20[5];
              v20[5] = (uint64_t)v21;
              v5 = v19;
              v8 = v18;
              v9 = v17;
              v10 = v16;
            }

          }
          _Block_object_dispose(&v30, 8);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v39[5]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "hasSuffix:", CFSTR("/")) & 1) == 0)
    {
      objc_msgSend(v22, "stringByAppendingString:", CFSTR("/"));
      v23 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v23;
    }
    _Block_object_dispose(&v38, 8);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (BOOL)ds_fileNameHasClaimedFileExtension:()DSAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v3, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeWithFilenameExtension:conformingToType:", v6, *MEMORY[0x1E0CEC528]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isDeclared") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x1E0CA58A8]);
      objc_msgSend(v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithTypeIdentifier:error:", v10, 0);

      objc_msgSend(v11, "bundleRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "executableURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v13 != 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
