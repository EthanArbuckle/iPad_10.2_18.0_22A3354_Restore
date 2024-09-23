@implementation HTHangSymbolicator

- (HTHangSymbolicator)init
{
  HTHangSymbolicator *v2;
  HTDeveloperSettings *v3;
  HTDeveloperSettings *settings;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  HTHangSymbolicator *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HTHangSymbolicator;
  v2 = -[HTHangSymbolicator init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HTDeveloperSettings);
    settings = v2->_settings;
    v2->_settings = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.DeveloperSettings.HangSymbolicator", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v2->_allowListingOnDemandVPNs = 0;
    v8 = v2;
  }

  return v2;
}

+ (HTHangSymbolicator)sharedSymbolicator
{
  if (sharedSymbolicator_onceToken != -1)
    dispatch_once(&sharedSymbolicator_onceToken, &__block_literal_global_1);
  return (HTHangSymbolicator *)(id)sharedSymbolicator_instance;
}

void __40__HTHangSymbolicator_sharedSymbolicator__block_invoke()
{
  HTHangSymbolicator *v0;
  void *v1;

  v0 = objc_alloc_init(HTHangSymbolicator);
  v1 = (void *)sharedSymbolicator_instance;
  sharedSymbolicator_instance = (uint64_t)v0;

}

- (BOOL)canSymbolicateLogFile:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  if (!-[HTDeveloperSettings isInternalBuild](self->_settings, "isInternalBuild")
    || +[HTHangSymbolicator isLogFileSymbolicated:](HTHangSymbolicator, "isLogFileSymbolicated:", v4)
    || (+[HTHangSymbolicator symbolicatedLogURLForFile:](HTHangSymbolicator, "symbolicatedLogURLForFile:", v4), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0), v5, (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("synced")))
    {
      objc_msgSend(v4, "URLByDeletingPathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathExtension");
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
    v7 = objc_msgSend(v9, "isEqualToString:", CFSTR("ips"));

  }
  return v7;
}

- (void)symbolicateLogFile:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HTHangSymbolicator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke;
  block[3] = &unk_250E63000;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  int8x16_t v22;
  _QWORD v23[4];
  int8x16_t v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v2 = *(_QWORD *)(a1 + 32);
  v26 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v2, 0, &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDD16B0];
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://speedtracer.apple.com/api/v2/trace"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestWithURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("developer-settings-dev"), CFSTR("X-ST-GroupName"));
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("multipart/form-data; boundary=%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forHTTPHeaderField:", v10, CFSTR("Content-Type"));

    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __requestWithLogFile_block_invoke;
    v27[3] = &unk_250E63168;
    v28 = v11;
    v12 = v11;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x2426392F0](v27);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\n--%@\r\n"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v14);

    ((void (**)(_QWORD, const __CFString *))v13)[2](v13, CFSTR("Content-Disposition: form-data; name=\"log_content\"; filename=\"CrashLog\"\r\n"));
    ((void (**)(_QWORD, const __CFString *))v13)[2](v13, CFSTR("Content-Type: text/plain\r\n\r\n"));
    objc_msgSend(v12, "appendData:", v3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\n--%@--\r\n"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v15);

    v16 = objc_retainAutorelease(v12);
  }
  else
  {
    v16 = 0;
    v7 = 0;
  }

  v17 = v16;
  v18 = v26;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2;
    v23[3] = &unk_250E63028;
    v25 = *(id *)(a1 + 48);
    v22 = *(int8x16_t *)(a1 + 32);
    v20 = (id)v22.i64[0];
    v24 = vextq_s8(v22, v22, 8uLL);
    objc_msgSend(v19, "uploadTaskWithRequest:fromData:completionHandler:", v7, v17, v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resume");

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v10, "statusCode");
      objc_msgSend(v10, "allHeaderFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_23DA3F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Symbolication task returned with status code %ld: %@", buf, 0x16u);

    }
  }
  if (v7)
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10;
    block[3] = &unk_250E63000;
    v22 = v7;
    v24 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 40);
    dispatch_async(v13, block);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2_cold_1((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;
  ssize_t v24;
  size_t v25;
  void *v26;
  const char *v27;
  id v28;
  const char *v29;
  id v30;
  const char *v31;
  const char *v32;
  id v33;
  void *v34;
  int v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  id v62;
  _QWORD v63[5];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v62 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v2, 0, &v62);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v62;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("symbolicated_log")),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    +[HTHangSymbolicator symbolicatedLogURLForFile:](HTHangSymbolicator, "symbolicatedLogURLForFile:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "temporaryDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v4;
    v55 = (id)v11;
    LODWORD(v10) = objc_msgSend(v12, "writeToURL:options:error:", v11, 1, &v61);
    v13 = v61;

    if ((_DWORD)v10)
    {
      v51 = v13;
      v52 = v7;
      v53 = v6;
      v54 = v3;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v14 = *MEMORY[0x24BE3F340];
      v63[0] = *MEMORY[0x24BE3F338];
      v63[1] = v14;
      v15 = *MEMORY[0x24BE3F358];
      v63[2] = *MEMORY[0x24BE3F350];
      v63[3] = v15;
      v63[4] = *MEMORY[0x24BE3F348];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v58;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v58 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v20);
            v22 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation");
            v23 = objc_retainAutorelease(v21);
            v24 = getxattr(v22, (const char *)objc_msgSend(v23, "UTF8String"), 0, 0x2710uLL, 0, 0);
            if ((v24 & 0x8000000000000000) == 0)
            {
              v25 = v24;
              objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation");
              v28 = objc_retainAutorelease(v23);
              v29 = (const char *)objc_msgSend(v28, "UTF8String");
              v30 = objc_retainAutorelease(v26);
              getxattr(v27, v29, (void *)objc_msgSend(v30, "mutableBytes"), v25, 0, 0);
              v31 = (const char *)objc_msgSend(objc_retainAutorelease(v55), "fileSystemRepresentation");
              v32 = (const char *)objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
              v33 = objc_retainAutorelease(v30);
              setxattr(v31, v32, (const void *)objc_msgSend(v33, "bytes"), v25, 0, 0);

            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
        }
        while (v18);
      }

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v52;
      v56 = v51;
      v35 = objc_msgSend(v34, "moveItemAtURL:toURL:error:", v55, v52, &v56);
      v4 = v56;

      if (v35)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        v6 = v53;
        v3 = v54;
      }
      else
      {
        v6 = v53;
        v3 = v54;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10_cold_3((uint64_t)v4, v44, v45, v46, v47, v48, v49, v50);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10_cold_4((uint64_t)v13, v37, v38, v39, v40, v41, v42, v43);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v4 = v13;
    }

  }
  else
  {
    v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
    {
      if (v36)
        __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10_cold_2();
    }
    else if (v36)
    {
      __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10_cold_1();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)symbolicateLogFiles:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *group;
  id obj;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id location;
  _QWORD v41[3];
  char v42;
  _QWORD v43[5];
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v18 = a4;
  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy_;
  v43[4] = __Block_byref_object_dispose_;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  objc_initWeak(&location, self);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        +[HTHangSymbolicator symbolicatedLogURLForFile:](HTHangSymbolicator, "symbolicatedLogURLForFile:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", 0))
        {
          objc_msgSend(v6, "addObject:", v11);
        }
        else
        {
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke;
          v31[3] = &unk_250E630C8;
          v33 = v41;
          v12 = group;
          v32 = v12;
          objc_copyWeak(&v35, &location);
          v34 = v43;
          v13 = (void *)MEMORY[0x2426392F0](v31);
          dispatch_group_enter(v12);
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_5;
          v27[3] = &unk_250E63118;
          v28 = v6;
          v14 = v13;
          v30 = v14;
          v29 = v12;
          -[HTHangSymbolicator symbolicateLogFile:completion:](self, "symbolicateLogFile:completion:", v10, v27);

          objc_destroyWeak(&v35);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v7);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_7;
  block[3] = &unk_250E63140;
  v23 = v6;
  v24 = obj;
  v25 = v18;
  v26 = v43;
  v15 = obj;
  v16 = v6;
  v17 = v18;
  dispatch_group_notify(group, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&location);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDD1308]))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == -1003)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        v17 = 0;
        v18 = &v17;
        v19 = 0x2050000000;
        v7 = (void *)getNEVPNManagerClass_softClass;
        v20 = getNEVPNManagerClass_softClass;
        v8 = MEMORY[0x24BDAC760];
        if (!getNEVPNManagerClass_softClass)
        {
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __getNEVPNManagerClass_block_invoke;
          v16[3] = &unk_250E62FB8;
          v16[4] = &v17;
          __getNEVPNManagerClass_block_invoke((uint64_t)v16);
          v7 = (void *)v18[3];
        }
        v9 = objc_retainAutorelease(v7);
        _Block_object_dispose(&v17, 8);
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_2;
        v12[3] = &unk_250E630A0;
        objc_copyWeak(&v15, (id *)(a1 + 56));
        v10 = *(id *)(a1 + 32);
        v11 = *(_QWORD *)(a1 + 48);
        v13 = v10;
        v14 = v11;
        objc_msgSend(v9, "loadAllFromPreferencesWithCompletionHandler:", v12);

        objc_destroyWeak(&v15);
      }
    }
    else
    {

    }
  }

}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_3;
  v15[3] = &unk_250E63050;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v5, "objectsAtIndexes:", v8);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_4;
    block[3] = &unk_250E63078;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)(a1 + 32);
    v9 = (id)v11;
    v14 = v11;
    v10 = v13;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  objc_destroyWeak(&v16);
}

uint64_t __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v7 = 0;
  }
  else if (objc_msgSend(v3, "isOnDemandEnabled"))
  {
    v7 = objc_msgSend(WeakRetained, "allowListingOnDemandVPNs");
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_5(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_6;
  block[3] = &unk_250E630F0;
  v10 = v5;
  v11 = a1[4];
  v12 = v6;
  v14 = a1[6];
  v13 = a1[5];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_6(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  if (*(_QWORD *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "count");
  if (v4 == objc_msgSend(*(id *)(a1 + 40), "count"))
    v5 = 0;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  return (*(uint64_t (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v3, v5);
}

+ (id)symbolicatedLogURLForFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("synced"));

  if (v6)
  {
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(v4, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingString:", CFSTR("_symbolicated"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathExtension:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URLByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)isLogFileSymbolicated:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("synced"));

  v6 = v3;
  if (v5)
  {
    objc_msgSend(v3, "URLByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSuffix:", CFSTR("_symbolicated"));

  return v9;
}

- (BOOL)allowListingOnDemandVPNs
{
  return self->_allowListingOnDemandVPNs;
}

- (void)setAllowListingOnDemandVPNs:(BOOL)a3
{
  self->_allowListingOnDemandVPNs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23DA3F000, MEMORY[0x24BDACB70], a3, "Error in symbolicated log response: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10_cold_1()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_3(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_23DA3F000, MEMORY[0x24BDACB70], v3, "Error decoding response for symbolicated log: %@\n%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10_cold_2()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_3(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_23DA3F000, MEMORY[0x24BDACB70], v3, "Unexpected response format for symbolicated log: %@\n%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23DA3F000, MEMORY[0x24BDACB70], a3, "Error moving symbolicated log: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_10_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23DA3F000, MEMORY[0x24BDACB70], a3, "Error writing symbolicated log: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
