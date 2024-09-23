@implementation MPCPlaybackEngineSessionManager

void __65___MPCPlaybackEngineSessionManager_setStateRestorationSupported___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 40))
  {
    v2 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "_playbackSessionsDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "archivesAtURL:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v16 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
          objc_msgSend(v15, "identifier", (_QWORD)v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 32);
    *(_QWORD *)(v19 + 32) = v18;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

  }
}

uint64_t __50___MPCPlaybackEngineSessionManager_archivesAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v16;
  id v17;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "packageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v10 = *MEMORY[0x24BDBCBE0];
  objc_msgSend(v9, "getResourceValue:forKey:error:", &v17, *MEMORY[0x24BDBCBE0], 0);
  v11 = v17;

  objc_msgSend(v5, "packageURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  objc_msgSend(v12, "getResourceValue:forKey:error:", &v16, v10, 0);
  v13 = v16;

  v14 = objc_msgSend(v13, "compare:", v11);
  return v14;
}

void __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v15 = v8;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion - skipping artwork [failed to get artwork] error=%{public}@", buf, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_34;
    block[3] = &unk_24CABAA28;
    v11 = *(id *)(a1 + 48);
    v12 = v5;
    v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);

  }
}

void __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_36(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "containsRestorableContent"))
  {
    v2 = objc_alloc(MEMORY[0x24BE65CA0]);
    v3 = *(_QWORD *)(a1 + 40);
    v9 = *MEMORY[0x24BDDC530];
    v10[0] = &unk_24CB17010;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v2, "initWithCodingPackage:userInfo:", v3, v4);

    objc_msgSend(v5, "encodeRootObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackSessionManagerError"), 3, CFSTR("Opting not to save an archive that does not contain restorable content"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_40(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v5 = *(void **)(a1 + 40);
    v44 = 0;
    objc_msgSend(v5, "saveWithError:", &v44);
    v6 = v44;
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
      {
        v9 = objc_msgSend(v7, "code");

        if (v9 == 640)
        {
          v41 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
          if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") >= 2)
          {
            v10 = "com.apple.amp.mediaplaybackcore";
            do
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastObject");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
              objc_msgSend(v11, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeLastObject");
              v43 = 0;
              objc_msgSend(v11, "deleteWithError:", &v43);
              v14 = v43;
              v15 = os_log_create(v10, "Session");
              v16 = v15;
              if (v14)
              {
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  v17 = *(_QWORD *)(a1 + 32);
                  objc_msgSend(v11, "identifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "msv_description");
                  v19 = v10;
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218498;
                  v46 = v17;
                  v47 = 2114;
                  v48 = v18;
                  v49 = 2114;
                  v50 = v20;
                  _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion [out of disk space] deleting archive: %{public}@ error=%{public}@", buf, 0x20u);

                  v10 = v19;
                }
              }
              else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                v21 = *(_QWORD *)(a1 + 32);
                objc_msgSend(v11, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v46 = v21;
                v47 = 2114;
                v48 = v22;
                _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion [out of disk space] deleting archive: %{public}@", buf, 0x16u);

              }
            }
            while ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") > 1);
          }
          if (v41 >= 2)
          {
            v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 134217984;
              v46 = v24;
              _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion: [out of disk space] deleted old archives attempting to save again", buf, 0xCu);
            }

            v25 = *(void **)(a1 + 40);
            v42 = 0;
            objc_msgSend(v25, "saveWithError:", &v42);
            v7 = v42;
          }
          if (!v7)
            goto LABEL_21;
        }
      }
      else
      {

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_30:

      return;
    }
LABEL_21:
    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v27);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectIdenticalTo:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
    v28 = *(void **)(a1 + 40);
    v29 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(v28, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);

    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") >= 0xB)
    {
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        objc_msgSend(v31, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, v33);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeLastObject");
        objc_msgSend(v31, "deleteWithError:", 0);

      }
      while ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") > 0xA);
    }
    v34 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setStateRestorationSessionIdentifier:", v35);

    v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v46 = v37;
      v47 = 2114;
      v48 = v38;
      _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion: created archive identifier=%{public}@", buf, 0x16u);

    }
    v39 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v39 + 16))(v39, v40, 0);

    goto LABEL_30;
  }
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    v46 = v3;
    v47 = 2114;
    v48 = v4;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_ERROR, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion - failed to encode with error=%{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_34(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "imageByPreparingForDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArtworkImage:", v2);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end
