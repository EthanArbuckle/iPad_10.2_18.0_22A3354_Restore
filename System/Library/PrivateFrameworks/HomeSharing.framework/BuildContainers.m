@implementation BuildContainers

void __BuildContainers_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    v7 = v6 - *(double *)(a1 + 64);
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_20AA9E000, v4, OS_LOG_TYPE_DEFAULT, "Playlist fetch took %g seconds", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x2020000000;
  v18 = 1;
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __BuildContainers_block_invoke_60;
  v10[3] = &unk_24C365120;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 56);
  v9 = v3;
  v13 = v9;
  p_buf = &buf;
  (*(void (**)(uint64_t, id, _QWORD *))(v8 + 16))(v8, v9, v10);

  _Block_object_dispose(&buf, 8);
}

void __BuildContainers_block_invoke_60(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  double v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v6 = v5;
  WriteDAAPDataToTemporaryFile(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ML3DatabaseImportDataForDAAPFilePaths();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BE6B1D8]);
  objc_msgSend(*(id *)(a1 + 32), "databasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithLibraryPath:trackData:playlistData:", v11, 0, v9);

  objc_msgSend(v12, "setHomeSharingBasePlaylistID:", objc_msgSend(*(id *)(a1 + 40), "basePlaylistContainerID"));
  v13 = dispatch_semaphore_create(0);
  v14 = *(void **)(a1 + 32);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __BuildContainers_block_invoke_2;
  v23 = &unk_24C3650F8;
  v28 = *(id *)(a1 + 56);
  v24 = *(id *)(a1 + 48);
  v25 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 64);
  v26 = v15;
  v29 = v16;
  v17 = v13;
  v27 = v17;
  objc_msgSend(v14, "_performImport:progressHandler:completion:", v12, 0, &v20);
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  v18 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate", v20, v21, v22, v23, v24, v25, v26);
    *(_DWORD *)buf = 134217984;
    v31 = v19 - v6;
    _os_log_impl(&dword_20AA9E000, v18, OS_LOG_TYPE_DEFAULT, "Playlist import took %g seconds", buf, 0xCu);
  }

}

void __BuildContainers_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  dispatch_semaphore_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  dispatch_time_t v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  uint64_t v28;
  id obj;
  _QWORD v30[4];
  NSObject *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  (*(void (**)(float))(*(_QWORD *)(a1 + 64) + 16))(0.1);
  objc_msgSend(*(id *)(a1 + 32), "containers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0.2 / (float)v5;
    v9 = *(_QWORD *)v34;
    v10 = CFSTR("com.apple.itunes.special-playlist");
    do
    {
      v11 = 0;
      v28 = v7;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
        objc_msgSend(v12, "objectForKey:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          (*(void (**)(float))(*(_QWORD *)(a1 + 64) + 16))(v8);
        }
        else
        {
          v14 = v10;
          v15 = dispatch_semaphore_create(0);
          objc_msgSend(v12, "objectForKey:", CFSTR("dmap.itemid"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = a1;
          v18 = *(void **)(a1 + 40);
          v19 = *(_QWORD *)(a1 + 48);
          v20 = objc_msgSend(v16, "longLongValue");
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __BuildContainers_block_invoke_3;
          v30[3] = &unk_24C3650D0;
          v21 = v15;
          v31 = v21;
          v32 = v16;
          v22 = v16;
          objc_msgSend(v18, "fillContainerForHomeSharingLibrary:containerID:completionHandler:", v19, v20, v30);
          v23 = dispatch_time(0, 300000000000);
          if (dispatch_semaphore_wait(v21, v23))
          {
            v24 = os_log_create("com.apple.amp.HomeSharing", "Library");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20AA9E000, v24, OS_LOG_TYPE_ERROR, "Fill container completion handler timed out.", buf, 2u);
            }

          }
          a1 = v17;
          (*(void (**)(float))(*(_QWORD *)(v17 + 64) + 16))(v8);

          v10 = v14;
          v7 = v28;
        }
        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v7);
  }

  v25 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v38 = a2;
    v39 = 2114;
    v40 = v27;
    _os_log_impl(&dword_20AA9E000, v25, OS_LOG_TYPE_DEFAULT, "HomeSharing playlist import success %d (error: %{public}@)", buf, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __BuildContainers_block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((a2 & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138412546;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_20AA9E000, v6, OS_LOG_TYPE_ERROR, "Failed to import container with ID: %@ error:%{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

@end
