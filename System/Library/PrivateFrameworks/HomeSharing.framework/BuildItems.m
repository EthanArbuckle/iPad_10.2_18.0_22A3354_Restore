@implementation BuildItems

uint64_t __BuildItems_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
  else
    *(_BYTE *)(v4 + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("'dmap.itemid:%d'"), a2);
}

void __BuildItems_block_invoke_204(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  int v8;
  char v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;
  uint8_t buf[4];
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    v7 = v6 - *(double *)(a1 + 72);
    *(_DWORD *)buf = 134217984;
    v19 = v7;
    _os_log_impl(&dword_20AA9E000, v4, OS_LOG_TYPE_DEFAULT, "Build fetch took %g seconds", buf, 0xCu);

  }
  v8 = objc_msgSend(v3, "responseCode");
  v9 = *(_BYTE *)(a1 + 80);
  if (!v9 || (v10 = v8, v8 == 200))
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __BuildItems_block_invoke_205;
    v13[3] = &unk_24C3652B0;
    v17 = v9;
    v12 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    (*(void (**)(uint64_t, id, _QWORD *))(v12 + 16))(v12, v3, v13);

  }
  else
  {
    v11 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v10;
      _os_log_impl(&dword_20AA9E000, v11, OS_LOG_TYPE_ERROR, "Partial fetch failed (response code: %u), trying full fetch", buf, 8u);
    }

    BuildItems(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

void __BuildItems_block_invoke_205(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  dispatch_semaphore_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, int, void *);
  void *v32;
  NSObject *v33;
  uint8_t *v34;
  _QWORD v35[4];
  id v36;
  _QWORD *v37;
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[3];
  int v45;
  uint8_t v46[4];
  double v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_37;
  v4 = objc_msgSend(*(id *)(a1 + 32), "executeUpdateSQL:", CFSTR("DELETE FROM item;"));
  v5 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v5, OS_LOG_TYPE_DEFAULT, "Cleared existing data in table: item", buf, 2u);
  }

  if (v4)
    v4 = objc_msgSend(*(id *)(a1 + 32), "executeUpdateSQL:", CFSTR("DELETE FROM item_extra;"));
  v6 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v6, OS_LOG_TYPE_DEFAULT, "Cleared existing data in table: item_extra", buf, 2u);
  }

  if (v4)
    v4 = objc_msgSend(*(id *)(a1 + 32), "executeUpdateSQL:", CFSTR("DELETE FROM item_stats;"));
  v7 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v7, OS_LOG_TYPE_DEFAULT, "Cleared existing data in table: item_stats", buf, 2u);
  }

  if (v4)
    v4 = objc_msgSend(*(id *)(a1 + 32), "executeUpdateSQL:", CFSTR("DELETE FROM item_store;"));
  v8 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v8, OS_LOG_TYPE_DEFAULT, "Cleared existing data in table: item_store", buf, 2u);
  }

  if (v4)
    v4 = objc_msgSend(*(id *)(a1 + 32), "executeUpdateSQL:", CFSTR("DELETE FROM item_playback"));
  v9 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v9, OS_LOG_TYPE_DEFAULT, "Cleared existing data in table: item_playback", buf, 2u);
  }

  if (v4)
    v4 = objc_msgSend(*(id *)(a1 + 32), "executeUpdateSQL:", CFSTR("DELETE FROM item_video"));
  v10 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v10, OS_LOG_TYPE_DEFAULT, "Cleared existing data in table: item_video", buf, 2u);
  }

  if (v4)
    v4 = objc_msgSend(*(id *)(a1 + 32), "executeUpdateSQL:", CFSTR("DELETE FROM item_search"));
  v11 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v11, OS_LOG_TYPE_DEFAULT, "Cleared existing data in table: item_search", buf, 2u);
  }

  if (v4)
    v4 = objc_msgSend(*(id *)(a1 + 32), "executeUpdateSQL:", CFSTR("DELETE FROM genre;"));
  v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_DEFAULT, "Cleared existing data in table: genre", buf, 2u);
  }

  if (v4)
    v4 = objc_msgSend(*(id *)(a1 + 32), "executeUpdateSQL:", CFSTR("DELETE FROM chapter;"));
  v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEFAULT, "Cleared existing data in table: chapter", buf, 2u);
  }

  if (v4)
  {
LABEL_37:
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v45 = 0;
    WriteDAAPDataToTemporaryFile(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ML3DatabaseImportDataForDAAPFilePaths();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x24BE6B1B8]);
    objc_msgSend(*(id *)(a1 + 32), "databasePath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithLibraryPath:trackData:playlistData:", v18, v16, 0);

    *(_QWORD *)buf = 0;
    v39 = buf;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__1728;
    v42 = __Block_byref_object_dispose__1729;
    v43 = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v21 = v20;
    v22 = dispatch_semaphore_create(0);
    v23 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __BuildItems_block_invoke_225;
    v35[3] = &unk_24C364F28;
    v24 = *(void **)(a1 + 32);
    v36 = *(id *)(a1 + 40);
    v37 = v44;
    v29 = v23;
    v30 = 3221225472;
    v31 = __BuildItems_block_invoke_226;
    v32 = &unk_24C365288;
    v34 = buf;
    v25 = v22;
    v33 = v25;
    objc_msgSend(v24, "_performImport:progressHandler:completion:", v19, v35, &v29);
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    v26 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate", v29, v30, v31, v32);
      *(_DWORD *)v46 = 134217984;
      v47 = v27 - v21;
      _os_log_impl(&dword_20AA9E000, v26, OS_LOG_TYPE_DEFAULT, "Data insertion took %g seconds", v46, 0xCu);
    }

    v28 = *(_QWORD *)(a1 + 48);
    if (v28)
      (*(void (**)(uint64_t, _QWORD))(v28 + 16))(v28, *((_QWORD *)v39 + 5));

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v44, 8);
  }

}

void __BuildItems_block_invoke_225(uint64_t a1, float a2)
{
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  float v8;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BuildItems_block_invoke_2;
  block[3] = &unk_24C365260;
  v8 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __BuildItems_block_invoke_226(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20AA9E000, v6, OS_LOG_TYPE_DEFAULT, "Import success: %d (error = %{public}@)", (uint8_t *)v10, 0x12u);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

float __BuildItems_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  double v3;
  float result;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(float *)(a1 + 48);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_20AA9E000, v2, OS_LOG_TYPE_DEFAULT, "Import progress: %g", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))((float)(*(float *)(a1 + 48)
                                                                      - *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                 + 24)) * 0.7);
  result = *(float *)(a1 + 48);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
