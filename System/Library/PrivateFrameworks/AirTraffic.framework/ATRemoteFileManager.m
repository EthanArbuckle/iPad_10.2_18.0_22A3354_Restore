@implementation ATRemoteFileManager

- (ATRemoteFileManager)initWithMessageLink:(id)a3
{
  id v5;
  ATRemoteFileManager *v6;
  ATRemoteFileManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATRemoteFileManager;
  v6 = -[ATRemoteFileManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageLink, a3);

  return v7;
}

- (id)_sendRequest:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1073;
  v30 = __Block_byref_object_dispose__1074;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1073;
  v24 = __Block_byref_object_dispose__1074;
  v25 = 0;
  v7 = dispatch_semaphore_create(0);
  -[ATRemoteFileManager messageLink](self, "messageLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __42__ATRemoteFileManager__sendRequest_error___block_invoke;
  v16[3] = &unk_24C4C9EB8;
  v18 = &v20;
  v19 = &v26;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v8, "sendRequest:withCompletion:", v6, v16);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)v21[5], "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend((id)v21[5], "error");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v27[5];
    v27[5] = v11;

  }
  if (a4)
  {
    v13 = (void *)v27[5];
    if (v13)
      *a4 = objc_retainAutorelease(v13);
  }
  v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (id)_readStreamData:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  _BYTE v9[1024];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "open");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v6 = objc_msgSend(v4, "read:maxLength:", v9, 1024);
  if (v6 >= 1)
  {
    for (i = v6; i > 0; i = objc_msgSend(v4, "read:maxLength:", v9, 1024))
      objc_msgSend(v5, "appendBytes:length:", v9, i);
  }

  return v5;
}

- (void)progressUpdatedWithPercentage:(double)a3 size:(unint64_t)a4
{
  ATRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  ATRequest *v11;
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v7 = [ATRequest alloc];
  v13[0] = CFSTR("percentage");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("size");
  v14[0] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATRequest initWithCommand:dataClass:parameters:](v7, "initWithCommand:dataClass:parameters:", CFSTR("progress"), CFSTR("Drive"), v10);

  v12 = -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v11, 0);
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  ATRequest *v8;
  void *v9;
  void *v10;
  ATRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = [ATRequest alloc];
  v17 = v7;
  v18 = CFSTR("paths");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ATRequest initWithCommand:dataClass:parameters:](v8, "initWithCommand:dataClass:parameters:", CFSTR("createDirectory"), CFSTR("Drive"), v10);
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  ATRequest *v8;
  void *v9;
  void *v10;
  ATRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = [ATRequest alloc];
  v16 = v7;
  v17 = CFSTR("paths");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ATRequest initWithCommand:dataClass:parameters:](v8, "initWithCommand:dataClass:parameters:", CFSTR("directoryContents"), CFSTR("Drive"), v10);
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "parameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("results"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)usageOfDirectoryAtPath:(id)a3 count:(unint64_t *)a4 size:(unint64_t *)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  ATRequest *v12;
  void *v13;
  void *v14;
  ATRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = [ATRequest alloc];
  v24 = v11;
  v25 = CFSTR("paths");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[ATRequest initWithCommand:dataClass:parameters:](v12, "initWithCommand:dataClass:parameters:", CFSTR("usage"), CFSTR("Drive"), v14);
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "parameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (a4)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend(v19, "unsignedIntegerValue");

    }
    if (a5)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("size"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = objc_msgSend(v20, "unsignedIntegerValue");

    }
  }
  if (v16)
  {
    objc_msgSend(v16, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  NSUInteger v11;
  ATRequest *v12;
  void *v13;
  void *v14;
  ATRequest *v15;
  id v16;
  id v17;
  void *v18;
  dispatch_semaphore_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v27;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  id v45;
  id v46;
  id v47;
  const __CFString *v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v10 = a4;
  v27 = a5;
  v11 = NSPageSize();
  v12 = [ATRequest alloc];
  v47 = v10;
  v48 = CFSTR("paths");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATRequest initWithCommand:dataClass:parameters:](v12, "initWithCommand:dataClass:parameters:", CFSTR("uploadFile"), CFSTR("Drive"), v14);

  v45 = 0;
  v46 = 0;
  objc_msgSend(MEMORY[0x24BDBCF30], "getBoundStreamsWithBufferSize:inputStream:outputStream:", v11, &v46, &v45);
  v16 = v46;
  v17 = v45;
  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithFileAtPath:", v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATMessage setDataStream:](v15, "setDataStream:", v18);

  v19 = dispatch_semaphore_create(0);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__1073;
  v43 = __Block_byref_object_dispose__1074;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1073;
  v37 = __Block_byref_object_dispose__1074;
  v38 = 0;
  -[ATRemoteFileManager messageLink](self, "messageLink");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __61__ATRemoteFileManager_uploadFileAtPath_toPath_options_error___block_invoke;
  v29[3] = &unk_24C4C9EB8;
  v31 = &v39;
  v32 = &v33;
  v21 = v19;
  v30 = v21;
  objc_msgSend(v20, "sendRequest:withCompletion:", v15, v29);

  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
  {
    v22 = (void *)v34[5];
    if (v22)
      *a6 = objc_retainAutorelease(v22);
  }
  v23 = (void *)v40[5];
  if (v23)
  {
    objc_msgSend(v23, "error", v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24 == 0;

  }
  else
  {
    v25 = 0;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v25;
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        -[ATRemoteFileManager uploadFileAtPath:toPath:options:error:](self, "uploadFileAtPath:toPath:options:error:", v16, v17, v23, &v24);
        v18 = v24;
        if (v18)
        {
          v19 = v18;
          objc_msgSend(v10, "setObject:forKey:", v18, v16);
          if (a5)
            *a5 = objc_retainAutorelease(v10);
          if (a6)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 22, 0);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  v20 = objc_msgSend(v10, "count") == 0;
  return v20;
}

- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  ATRequest *v11;
  void *v12;
  void *v13;
  ATRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a3;
  v11 = [ATRequest alloc];
  v22 = v10;
  v23 = CFSTR("paths");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ATRequest initWithCommand:dataClass:parameters:](v11, "initWithCommand:dataClass:parameters:", CFSTR("downloadFile"), CFSTR("Drive"), v13);
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v15, "dataStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATRemoteFileManager _readStreamData:error:](self, "_readStreamData:error:", v17, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "writeToFile:atomically:", v9, 1);
  }
  if (v15)
  {
    objc_msgSend(v15, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  BOOL v21;
  id *v23;
  id *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v26 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v23 = a5;
    v24 = a6;
    v14 = 0;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v14;
        v19 = -[ATRemoteFileManager downloadFileAtPath:toPath:options:error:](self, "downloadFileAtPath:toPath:options:error:", v17, v18, v26, &v27);
        v20 = v27;

        if (v19)
        {
          v14 = v20;
        }
        else
        {
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, v17);

          if (v23)
            *v23 = objc_retainAutorelease(v25);
          if (v24)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 22, 0);
            v14 = 0;
            *v24 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = 0;
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v21 = objc_msgSend(v25, "count") == 0;
  return v21;
}

- (BOOL)uploadData:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  ATRequest *v11;
  void *v12;
  void *v13;
  ATRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a3;
  v11 = [ATRequest alloc];
  v21 = v9;
  v22 = CFSTR("paths");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATRequest initWithCommand:dataClass:parameters:](v11, "initWithCommand:dataClass:parameters:", CFSTR("uploadFile"), CFSTR("Drive"), v13);

  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithData:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATMessage setDataStream:](v14, "setDataStream:", v15);
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v14, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)dataAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  ATRequest *v8;
  void *v9;
  void *v10;
  ATRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = [ATRequest alloc];
  v17 = v7;
  v18 = CFSTR("paths");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ATRequest initWithCommand:dataClass:parameters:](v8, "initWithCommand:dataClass:parameters:", CFSTR("downloadFile"), CFSTR("Drive"), v10);
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v12, "dataStream");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATRemoteFileManager _readStreamData:error:](self, "_readStreamData:error:", v14, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  id v18;

  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = a5;
  objc_msgSend(v10, "dictionaryWithObject:forKey:", a4, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = -[ATRemoteFileManager moveItemsAtPaths:options:results:error:](self, "moveItemsAtPaths:options:results:error:", v12, v11, &v18, a6);

  v14 = v18;
  v15 = v14;
  if (a6 && !v13)
  {
    objc_msgSend(v14, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v8;
  ATRequest *v9;
  void *v10;
  ATRequest *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  BOOL v23;
  id *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  const __CFString *v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = [ATRequest alloc];
  v32 = CFSTR("paths");
  v33[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATRequest initWithCommand:dataClass:parameters:](v9, "initWithCommand:dataClass:parameters:", CFSTR("moveItem"), CFSTR("Drive"), v10);

  v30 = 0;
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v11, &v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v30;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "parameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v25 = a5;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("results"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v19);
    }

    a5 = v25;
  }
  if (a5 && objc_msgSend(v14, "count"))
    *a5 = objc_retainAutorelease(v14);
  if (v12)
  {
    objc_msgSend(v12, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v14[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = -[ATRemoteFileManager removeItemsAtPaths:options:results:error:](self, "removeItemsAtPaths:options:results:error:", v8, 0, &v13, a5);
  v10 = v13;

  if (a5 && !v9)
  {
    objc_msgSend(v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v9;
  ATRequest *v10;
  void *v11;
  ATRequest *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  BOOL v24;
  id *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  const __CFString *v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = [ATRequest alloc];
  v34 = CFSTR("paths");
  v35[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATRequest initWithCommand:dataClass:parameters:](v10, "initWithCommand:dataClass:parameters:", CFSTR("removeItem"), CFSTR("Drive"), v11);

  v32 = 0;
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v12, &v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "parameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v26 = a6;
    v27 = v9;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("results"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v20);
    }

    a6 = v26;
    v9 = v27;
  }
  if (a5 && objc_msgSend(v15, "count"))
    *a5 = objc_retainAutorelease(v15);
  if (a6 && objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 22, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v13)
  {
    objc_msgSend(v13, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  ATRequest *v11;
  void *v12;
  void *v13;
  ATRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  _QWORD v20[2];
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a3;
  v11 = [ATRequest alloc];
  v20[1] = v9;
  v21 = CFSTR("paths");
  v20[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ATRequest initWithCommand:dataClass:parameters:](v11, "initWithCommand:dataClass:parameters:", CFSTR("moveItem"), CFSTR("Drive"), v13);
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  ATRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v7 = -[ATRequest initWithCommand:dataClass:parameters:]([ATRequest alloc], "initWithCommand:dataClass:parameters:", CFSTR("freeSpace"), CFSTR("Drive"), 0);
  -[ATRemoteFileManager _sendRequest:error:](self, "_sendRequest:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3 && v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("size"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v11, "unsignedIntegerValue");

  }
  if (v8)
  {
    objc_msgSend(v8, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (ATMessageLink)messageLink
{
  return self->_messageLink;
}

- (void)setMessageLink:(id)a3
{
  objc_storeStrong((id *)&self->_messageLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLink, 0);
}

void __61__ATRemoteFileManager_uploadFileAtPath_toPath_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__ATRemoteFileManager__sendRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
