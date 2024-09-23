@implementation LiveFSAppleDouble

- (LiveFSAppleDouble)initWithManager:(id)a3 baseFileHandle:(id)a4 name:(id)a5 andDirectoryHandle:(id)a6 andPurpose:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  LiveFSAppleDouble *v16;
  LiveFSAppleDouble *v17;
  void *v18;
  dispatch_semaphore_t v19;
  int v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)LiveFSAppleDouble;
  v16 = -[LiveFSAppleDouble init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    -[LiveFSAppleDouble setManager:](v16, "setManager:", v12);
    objc_msgSend(v12, "AppleDoubleNameForFileNamed:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[LiveFSAppleDouble setFileName:](v17, "setFileName:", v18);

    -[LiveFSAppleDouble setParentDirHandle:](v17, "setParentDirHandle:", v15);
    -[LiveFSAppleDouble setFileHandle:](v17, "setFileHandle:", 0);
    v19 = dispatch_semaphore_create(0);
    -[LiveFSAppleDouble setSyncSem:](v17, "setSyncSem:", v19);

    -[LiveFSAppleDouble setBaseFileHandle:](v17, "setBaseFileHandle:", v13);
    v17->_purpose = a7;
    if (!-[LiveFSAppleDouble openFile](v17, "openFile"))
    {
      v20 = -[LiveFSAppleDouble loadADHeader](v17, "loadADHeader");
      v17->_ADFileErr = v20;
      if (v20)
        v17->_ADFileOK = 0;
      -[LiveFSAppleDouble closeFile](v17, "closeFile");
    }
  }

  return v17;
}

- (void)dealloc
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_9();
  objc_msgSend(v0, "fileName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_22BD61000, v2, v3, "AD: start dealoc on %s for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_14();
}

- (void)reclaimFile
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138413059;
  v7 = a1;
  v8 = 2080;
  v9 = "-[LiveFSAppleDouble reclaimFile]";
  v10 = 2114;
  v11 = v4;
  v12 = 2113;
  v13 = v5;
  _os_log_debug_impl(&dword_22BD61000, a2, OS_LOG_TYPE_DEBUG, "AD[%@]:%s:start:%{public}@[%{private}@]", (uint8_t *)&v6, 0x2Au);

}

void __32__LiveFSAppleDouble_reclaimFile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseFileHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseForBaseFile:", v3);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[LiveFSAppleDouble baseFileHandle](self, "baseFileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LiveFSAppleDouble fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LiveFSAppleDouble fileHandle](self, "fileHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<LIFSAD:%p>: [[%@]:[%@][%@]]: ok:%d, err:%d, open:%d, p:%d, ro:%d, emptyfi:%d, wcf:%d"), self, v4, v5, v6, self->_ADFileOK, self->_ADFileErr, self->_ADFileOpen, self->_purpose, self->_readonly, self->_emptyfinderinfo, self->_weCreatedFile);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containerFileExists
{
  return !self->_lookupFailed;
}

- (int)lookupFile
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[LiveFSAppleDouble fileHandle](self, "fileHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[LiveFSAppleDouble manager](self, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __31__LiveFSAppleDouble_lookupFile__block_invoke;
    v8[3] = &unk_24F64C878;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v6, v8);

    v4 = *((_DWORD *)v10 + 6);
    self->_lookupFailed = v4 != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

intptr_t __31__LiveFSAppleDouble_lookupFile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  __int128 v10;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parentDirHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "clientID");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __31__LiveFSAppleDouble_lookupFile__block_invoke_2;
  v9[3] = &unk_24F64C760;
  v10 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "lookupin:name:forClient:usingFlags:requestID:reply:", v4, v5, v7, 0, -1, v9);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __31__LiveFSAppleDouble_lookupFile__block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "setFileHandle:", a4);
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v5);

}

- (int)createFile
{
  void *v3;
  int v4;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[7];
  _QWORD block[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0xD810000000;
  v19 = &unk_22BD82ACE;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0;
  -[LiveFSAppleDouble fileHandle](self, "fileHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_3:
    v4 = 0;
    goto LABEL_4;
  }
  if (!-[LiveFSAppleDouble lookupFile](self, "lookupFile"))
    goto LABEL_3;
  -[LiveFSAppleDouble manager](self, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__LiveFSAppleDouble_createFile__block_invoke;
  block[3] = &unk_24F64C8C8;
  block[4] = self;
  block[5] = &v32;
  block[6] = &v16;
  dispatch_sync(v7, block);

  if (!*((_DWORD *)v33 + 6))
  {
    v10 = v17;
    if ((v17[5] & 0x100) != 0)
      v11 = v17[12];
    else
      v11 = 0;
    v17[5] &= 0x1AuLL;
    *((_DWORD *)v10 + 15) &= 0xFFFu;
    -[LiveFSAppleDouble manager](self, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __31__LiveFSAppleDouble_createFile__block_invoke_71;
    v14[3] = &unk_24F64C8C8;
    v14[4] = self;
    v14[5] = &v16;
    v14[6] = &v32;
    dispatch_sync(v13, v14);

    v4 = *((_DWORD *)v33 + 6);
    if (v4)
    {
      if (v4 == 17)
      {
        v4 = -[LiveFSAppleDouble lookupFile](self, "lookupFile");
        goto LABEL_4;
      }
    }
    else
    {
      self->_weCreatedFile = 1;
      self->_baseFileID = v11;
      self->_lookupFailed = 0;
    }
    self->_weCreatedFile = v4 == 0;
    goto LABEL_4;
  }
  livefs_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[LiveFSAppleDouble createFile].cold.1();

  v4 = *((_DWORD *)v33 + 6);
LABEL_4:
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v32, 8);
  return v4;
}

intptr_t __31__LiveFSAppleDouble_createFile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseFileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__LiveFSAppleDouble_createFile__block_invoke_2;
  v6[3] = &unk_24F64C8A0;
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "fileAttributes:requestID:reply:", v4, -1, v6);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __31__LiveFSAppleDouble_createFile__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  NSObject *v4;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(a3, "getBytes:length:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32, 184);
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);

}

intptr_t __31__LiveFSAppleDouble_createFile__block_invoke_71(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parentDirHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32, 184);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clientID");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __31__LiveFSAppleDouble_createFile__block_invoke_2_73;
  v11[3] = &unk_24F64C8F0;
  v9 = *(_QWORD *)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 32);
  v11[5] = v9;
  objc_msgSend(v3, "createIn:named:attributes:andClient:requestID:reply:", v4, v5, v6, v8, -1, v11);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __31__LiveFSAppleDouble_createFile__block_invoke_2_73(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v6;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "setFileHandle:", a5);
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

}

- (int)openFile
{
  int v2;
  int purpose;
  int v5;
  uint64_t *v6;
  int *v7;
  void *v8;
  uint64_t *v9;
  int v10;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v2 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (self->_ADFileOpen)
    goto LABEL_17;
  purpose = self->_purpose;
  switch(purpose)
  {
    case 2:
      goto LABEL_5;
    case 1:
      v5 = -[LiveFSAppleDouble createFile](self, "createFile");
LABEL_7:
      v6 = v26;
      *((_DWORD *)v26 + 6) = v5;
      v7 = (int *)(v6 + 3);
      if (!v5)
      {
        -[LiveFSAppleDouble fileHandle](self, "fileHandle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v26;
        if (v8)
        {
          v7 = (int *)(v26 + 3);
        }
        else
        {
          *((_DWORD *)v26 + 6) = 2;
          v7 = (int *)(v9 + 3);
          self->_ADFileErr = 2;
        }
      }
      goto LABEL_12;
    case 0:
LABEL_5:
      v5 = -[LiveFSAppleDouble lookupFile](self, "lookupFile");
      goto LABEL_7;
  }
  v7 = &v28;
  v28 = 1;
LABEL_12:
  v10 = *v7;
  if (*v7 || self->_purpose == 2)
  {
    if (v10 == 28)
      v10 = 1;
    self->_ADFileErr = v10;
    v2 = *v7;
  }
  else
  {
    -[LiveFSAppleDouble manager](self, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__LiveFSAppleDouble_openFile__block_invoke;
    block[3] = &unk_24F64C878;
    block[4] = self;
    block[5] = &v25;
    dispatch_sync(v13, block);

    if (self->_weCreatedFile)
    {
      if (self->_purpose == 1)
      {
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4096);
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = objc_msgSend(v15, "mutableBytes");
        *(_QWORD *)v16 = 0x20007160500;
        *(_WORD *)(v16 + 24) = 512;
        *(_OWORD *)(v16 + 26) = xmmword_22BD7EC40;
        *(_QWORD *)(v16 + 42) = 0x1E010000E20E0000;
        *(_OWORD *)(v16 + 8) = *(_OWORD *)"Mac OS X        ";
        *(_DWORD *)(v16 + 84) = 1381258305;
        *(_DWORD *)(v16 + 88) = bswap32(self->_baseFileID);
        *(_QWORD *)(v16 + 92) = 0x78000000E20E0000;
        *(_QWORD *)(v16 + 3810) = 0x1000000010000;
        *(_DWORD *)(v16 + 3822) = 503316480;
        *(_QWORD *)(v16 + 4066) = 0x1000000010000;
        *(_DWORD *)(v16 + 4078) = 503316480;
        *(_DWORD *)(v16 + 4090) = 503323648;
        *(_WORD *)(v16 + 4094) = -1;
        strcpy((char *)(v16 + 3826), "This resource fork intentionally left blank   ");
        -[LiveFSAppleDouble manager](self, "manager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "queue");
        v18 = objc_claimAutoreleasedReturnValue();
        v21[0] = v14;
        v21[1] = 3221225472;
        v21[2] = __29__LiveFSAppleDouble_openFile__block_invoke_3;
        v21[3] = &unk_24F64C968;
        v21[4] = self;
        v22 = v15;
        v23 = &v25;
        v19 = v15;
        dispatch_sync(v18, v21);

      }
      livefs_std_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[LiveFSAppleDouble openFile].cold.1();

      v2 = *((_DWORD *)v26 + 6);
    }
    else
    {
      v2 = *((_DWORD *)v26 + 6);
      self->_ADFileErr = v2;
      if (!v2)
        self->_ADFileOK = 1;
    }
  }
LABEL_17:
  _Block_object_dispose(&v25, 8);
  return v2;
}

intptr_t __29__LiveFSAppleDouble_openFile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__LiveFSAppleDouble_openFile__block_invoke_2;
  v7[3] = &unk_24F64C918;
  v8 = *(_OWORD *)(a1 + 32);
  if (*(_DWORD *)(v8 + 292) == 1)
    v5 = 3;
  else
    v5 = 1;
  objc_msgSend(v3, "open:withMode:requestID:reply:", v4, v5, -1, v7);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __29__LiveFSAppleDouble_openFile__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v2;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 232) = 1;
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v2);

}

intptr_t __29__LiveFSAppleDouble_openFile__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__LiveFSAppleDouble_openFile__block_invoke_4;
  v8[3] = &unk_24F64C940;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v6;
  objc_msgSend(v3, "writeTo:atOffset:fromBuffer:requestID:reply:", v4, 0, v5, -1, v8);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __29__LiveFSAppleDouble_openFile__block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (a3 != 4096 || *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_DWORD *)(v3 + 296) = 28;
  else
    *(_BYTE *)(v3 + 233) = 1;
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);

}

- (int)closeFile
{
  void *v3;
  NSObject *v4;
  int v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self->_ADFileOpen)
  {
    -[LiveFSAppleDouble manager](self, "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __30__LiveFSAppleDouble_closeFile__block_invoke;
    v7[3] = &unk_24F64C878;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v4, v7);

    self->_weCreatedFile = 0;
    v5 = *((_DWORD *)v9 + 6);
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

intptr_t __30__LiveFSAppleDouble_closeFile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__LiveFSAppleDouble_closeFile__block_invoke_2;
  v7[3] = &unk_24F64C990;
  v8 = *(_OWORD *)(a1 + 32);
  if (*(_DWORD *)(v8 + 292) == 1)
    v5 = 3;
  else
    v5 = 1;
  objc_msgSend(v3, "close:keepingMode:requestID:reply:", v4, v5, -1, v7);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __30__LiveFSAppleDouble_closeFile__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v2;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 232) = 0;
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v2);

}

- (int)writeXattrInfo
{
  void *v3;
  NSObject *v4;
  int v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[LiveFSAppleDouble swapFileHeader:](self, "swapFileHeader:", self->_filehdr);
  if (self->_attrhdr)
    -[LiveFSAppleDouble swapAttrHeader:](self, "swapAttrHeader:");
  v9[3] = self->_IOSize;
  -[LiveFSAppleDouble manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__LiveFSAppleDouble_writeXattrInfo__block_invoke;
  block[3] = &unk_24F64C8C8;
  block[4] = self;
  block[5] = &v8;
  block[6] = &v12;
  dispatch_sync(v4, block);

  -[LiveFSAppleDouble swapFileHeader:](self, "swapFileHeader:", self->_filehdr);
  if (self->_attrhdr)
    -[LiveFSAppleDouble swapAttrHeader:](self, "swapAttrHeader:");
  v5 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

intptr_t __35__LiveFSAppleDouble_writeXattrInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  int8x16_t v9;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 328);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(v4 + 240), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__LiveFSAppleDouble_writeXattrInfo__block_invoke_2;
  v8[3] = &unk_24F64C9B8;
  v9 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "writeTo:atOffset:fromBuffer:requestID:reply:", v5, 0, v6, -1, v8);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __35__LiveFSAppleDouble_writeXattrInfo__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v3;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != a3)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = 28;
  }
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v3);

}

- (void)swapFileHeader:(apple_double_header *)a3
{
  uint64_t v3;
  unsigned int v4;
  int8x8_t v5;
  unsigned int *v6;

  LODWORD(v3) = a3->var3;
  v4 = bswap32(v3) >> 16;
  v5 = vrev32_s8(*(int8x8_t *)&a3->var0);
  if (*(_QWORD *)&a3->var0 != 333319)
    LOWORD(v3) = v4;
  *(int8x8_t *)&a3->var0 = v5;
  a3->var3 = v4;
  if ((_WORD)v3)
  {
    v3 = (unsigned __int16)v3;
    v6 = (unsigned int *)((char *)&a3->var4[0].var1 + 2);
    do
    {
      *((int8x8_t *)v6 - 1) = vrev32_s8(*(int8x8_t *)(v6 - 2));
      *v6 = bswap32(*v6);
      v6 += 3;
      --v3;
    }
    while (v3);
  }
}

- (void)swapAttrHeader:(attr_header *)a3
{
  int8x16_t v3;
  int8x16_t v4;
  unsigned int v5;
  unsigned __int16 v6;
  int v7;
  int8x8_t *p_var7;
  char *v9;
  int8x8_t *v10;

  v3 = *(int8x16_t *)a3->var0.var6;
  v4 = vrev32q_s8(v3);
  v5 = bswap32(HIWORD(a3->var6[2])) >> 16;
  if (v3.i32[0] == 1096045650)
    v6 = HIWORD(a3->var6[2]);
  else
    v6 = v5;
  *(int8x16_t *)a3->var0.var6 = v4;
  a3->var4 = bswap32(a3->var4);
  LOWORD(a3->var6[2]) = bswap32(LOWORD(a3->var6[2])) >> 16;
  HIWORD(a3->var6[2]) = v5;
  if (v6)
  {
    v7 = 0;
    p_var7 = (int8x8_t *)&a3->var7;
    v9 = &self->_rawAD[self->_ADBufferHeaderBytesValid];
    do
    {
      v10 = (int8x8_t *)((char *)p_var7 + ((p_var7[1].u8[2] + 14) & 0x1FC));
      if (v10 > (int8x8_t *)v9)
        break;
      *p_var7 = vrev32_s8(*p_var7);
      p_var7[1].i16[0] = bswap32(p_var7[1].u16[0]) >> 16;
      ++v7;
      p_var7 = v10;
    }
    while ((unsigned __int16)v7 < v6);
  }
}

- (void)initEmptyResourceFork:(rsrcfork_header *)a3
{
  *(_OWORD *)&a3->var6 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)a3->var4 = 0u;
  *(_OWORD *)((char *)&a3->var9 + 2) = 0u;
  *(_QWORD *)&a3->var0 = 0x1000000010000;
  *(_QWORD *)&a3->var6 = 0x1000000010000;
  *(_OWORD *)a3->var4 = *(_OWORD *)"This resource fork intentionally left blank   ";
  *(_OWORD *)&a3->var4[16] = 0u;
  a3->var3 = 503316480;
  a3->var9 = 503316480;
  *(_DWORD *)&a3->var14 = 503323648;
  a3->var16 = -1;
  *(_OWORD *)&a3->var5[96] = 0u;
  *(_OWORD *)&a3->var5[112] = 0u;
  *(_OWORD *)&a3->var5[64] = 0u;
  *(_OWORD *)&a3->var5[80] = 0u;
  *(_OWORD *)&a3->var5[32] = 0u;
  *(_OWORD *)&a3->var5[48] = 0u;
  *(_OWORD *)a3->var5 = 0u;
  *(_OWORD *)&a3->var5[16] = 0u;
  *(_OWORD *)&a3->var4[80] = 0u;
  *(_OWORD *)&a3->var4[96] = 0u;
  *(_OWORD *)&a3->var4[48] = 0u;
  *(_OWORD *)&a3->var4[64] = 0u;
  *(_OWORD *)&a3->var4[16] = *(_OWORD *)"rk intentionally left blank   ";
  *(_OWORD *)&a3->var4[32] = 0u;
  strcpy((char *)&a3->var4[31], "y left blank   ");
}

- (void)loadAttrHeader
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "LoadAttrHeader: Loaded ATTR header[%d]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (int)loadADHeader
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  unint64_t fa_size;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned __int16 *v23;
  unsigned int v24;
  NSObject *v25;
  unsigned int v26;
  uint64_t v27;
  apple_double_entry *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int *p_var1;
  unint64_t v32;
  unsigned int var2;
  unsigned int *p_var2;
  unsigned int v35;
  unsigned int v36;
  BOOL v37;
  uint64_t v38;
  _DWORD *v39;
  unsigned int v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  BOOL *p_readonly;
  void *v45;
  BOOL v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  apple_double_entry *v50;
  apple_double_entry *finderinfo;
  int v52;
  size_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  int v57;
  int v58;
  int v59;
  unsigned int v60;
  unsigned int v61;
  size_t v62;
  void *v63;
  NSObject *v64;
  apple_double_header *filehdr;
  unsigned int v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  apple_double_entry *v71;
  _DWORD *v72;
  unint64_t v73;
  _QWORD v74[7];
  _QWORD v75[6];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  size_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[7];
  __int16 v89;
  _QWORD v90[6];
  _QWORD v91[5];
  id v92;
  uint64_t *v93;
  uint64_t *v94;
  unint64_t v95;
  _QWORD block[6];
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint8_t v105[4];
  unsigned int v106;
  __int16 v107;
  unsigned int v108;
  __int16 v109;
  unsigned int v110;
  uint8_t buf[8];
  uint8_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  if (!self->_ADFileOK)
    goto LABEL_4;
  -[LiveFSAppleDouble manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke;
  block[3] = &unk_24F64C878;
  block[4] = self;
  block[5] = &v97;
  dispatch_sync(v4, block);

  if (*((_DWORD *)v98 + 6) || (self->_ADFileAttributes.fa_validmask & 0x40) == 0)
  {
LABEL_4:
    v6 = 93;
    goto LABEL_5;
  }
  if (self->_purpose == 1)
  {
    fa_size = 0x10000;
  }
  else if (self->_ADFileAttributes.fa_size >= 0x10000)
  {
    fa_size = 0x10000;
  }
  else
  {
    fa_size = self->_ADFileAttributes.fa_size;
  }
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", fa_size);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LiveFSAppleDouble manager](self, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v91[0] = v5;
  v91[1] = 3221225472;
  v91[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_3;
  v91[3] = &unk_24F64CA30;
  v91[4] = self;
  v93 = &v97;
  v95 = fa_size;
  v94 = &v101;
  v12 = v9;
  v92 = v12;
  dispatch_sync(v11, v91);

  v6 = *((_DWORD *)v98 + 6);
  if (v6)
    goto LABEL_34;
  livefs_std_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[LiveFSAppleDouble loadADHeader].cold.7();

  if ((unint64_t)v102[3] <= 0x19)
  {
    livefs_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[LiveFSAppleDouble loadADHeader].cold.1();

    goto LABEL_33;
  }
  self->_IOSize = fa_size;
  if (!(fa_size >> 16) && !self->_purpose)
  {
    -[LiveFSAppleDouble closeFile](self, "closeFile");
    -[LiveFSAppleDouble manager](self, "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    v90[0] = v5;
    v90[1] = 3221225472;
    v90[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_81;
    v90[3] = &unk_24F64C878;
    v90[4] = self;
    v90[5] = &v97;
    dispatch_sync(v16, v90);

    -[LiveFSAppleDouble setFileHandle:](self, "setFileHandle:", 0);
  }
  v6 = *((_DWORD *)v98 + 6);
  if (v6)
    goto LABEL_34;
  v17 = objc_retainAutorelease(v12);
  v18 = objc_msgSend(v17, "mutableBytes");
  v19 = v18;
  v21 = *(_DWORD *)v18;
  v20 = *(_DWORD *)(v18 + 4);
  *(_DWORD *)v18 = bswap32(*(_DWORD *)v18);
  *(_DWORD *)(v18 + 4) = bswap32(v20);
  v23 = (unsigned __int16 *)(v18 + 24);
  v22 = *(unsigned __int16 *)(v18 + 24);
  v24 = __rev16(v22);
  *(_WORD *)(v18 + 24) = v24;
  if (v21 != 118883584 || v20 != 512 || !v22 || v24 >= 0x10)
  {
    livefs_std_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v57 = *(_DWORD *)v19;
      v58 = *(_DWORD *)(v19 + 4);
      v59 = *(unsigned __int16 *)(v19 + 24);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v57;
      LOWORD(v112) = 1024;
      *(_DWORD *)((char *)&v112 + 2) = v58;
      HIWORD(v112) = 1024;
      LODWORD(v113) = v59;
      _os_log_error_impl(&dword_22BD61000, v25, OS_LOG_TYPE_ERROR, "LFSAD: loadADHeader: magic is wrong: %d, %d, %d", buf, 0x14u);
    }
    goto LABEL_32;
  }
  v73 = 12 * v24 + 26;
  if (v102[3] < v73)
  {
    livefs_std_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[LiveFSAppleDouble loadADHeader].cold.2();
LABEL_32:

LABEL_33:
    v6 = 93;
    goto LABEL_34;
  }
  v26 = 0;
  *(_QWORD *)buf = 0;
  v112 = buf;
  v71 = 0;
  v113 = 0x2020000000;
  v114 = 0;
  v72 = (_DWORD *)(v18 + 34);
  do
  {
    v27 = v19 + 12 * v26;
    v29 = *(_DWORD *)(v27 + 26);
    v28 = (apple_double_entry *)(v27 + 26);
    v30 = bswap32(v29);
    v28->var0 = v30;
    p_var1 = &v28->var1;
    v32 = bswap32(v28->var1);
    p_var2 = &v28->var2;
    var2 = v28->var2;
    v28->var1 = v32;
    v35 = bswap32(var2);
    v28->var2 = v35;
    v36 = v35 + v32;
    v37 = __CFADD__(v35, (_DWORD)v32);
    if (v73 > v32 || v37 || self->_ADFileAttributes.fa_size < v36)
    {
      livefs_std_log();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        -[LiveFSAppleDouble loadADHeader].cold.3();
LABEL_78:

      goto LABEL_79;
    }
    if ((_WORD)v26)
    {
      v38 = 0;
      v39 = v72;
      while (1)
      {
        v40 = *(v39 - 1);
        if (v36 > v40 && *v39 + v40 > v32)
          break;
        v39 += 3;
        if (v26 == ++v38)
          goto LABEL_47;
      }
      livefs_std_log();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        -[LiveFSAppleDouble loadADHeader].cold.6();
      goto LABEL_78;
    }
LABEL_47:
    if (v30 == 2)
    {
      if (var2)
      {
        *((_QWORD *)v112 + 3) = v28;
        if (var2 == 503382016 && self->_purpose != 1)
        {
          -[LiveFSAppleDouble fileHandle](self, "fileHandle");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45 == 0;

          if (!v46)
          {
            -[LiveFSAppleDouble manager](self, "manager");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "queue");
            v48 = objc_claimAutoreleasedReturnValue();
            v88[0] = v5;
            v88[1] = 3221225472;
            v88[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_83;
            v88[3] = &unk_24F64CA58;
            v89 = v26;
            v88[4] = self;
            v88[5] = buf;
            v88[6] = v19;
            v49 = v48;
            dispatch_sync(v48, v88);

          }
        }
      }
      else
      {
        if (self->_purpose != 1)
          goto LABEL_63;
        *((_QWORD *)v112 + 3) = v28;
      }
      v24 = *v23;
      p_readonly = &self->_readonly;
      if (v24 - 1 != v26)
LABEL_62:
        *p_readonly = 1;
    }
    else if (v30 == 9 && v35 >= 0x20)
    {
      if (v32 > 0xFFFFFFDF || v102[3] < (unint64_t)(v32 + 32))
      {
        livefs_std_log();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v60 = *p_var2;
          v61 = *p_var1;
          *(_DWORD *)v105 = 67109632;
          v106 = v26;
          v107 = 1024;
          v108 = v60;
          v109 = 1024;
          v110 = v61;
          _os_log_error_impl(&dword_22BD61000, v56, OS_LOG_TYPE_ERROR, "LFSAD: loadADHeader: FinderInfo[%d] is not well formed: %u@%u", v105, 0x14u);
        }
        goto LABEL_78;
      }
      v41 = (_QWORD *)(v19 + v32);
      v42 = *v41 | v41[1];
      v43 = v41[2] | v41[3];
      p_readonly = &self->_emptyfinderinfo;
      v71 = v28;
      if (!(v42 | v43))
        goto LABEL_62;
    }
LABEL_63:
    v26 = (unsigned __int16)(v26 + 1);
  }
  while (v26 < (unsigned __int16)v24);
  objc_storeStrong((id *)&self->_ADHeaderBuffer, v17);
  self->_ADBufferHeaderBytesValid = v102[3];
  self->_rawAD = (char *)v19;
  self->_filehdr = (apple_double_header *)v19;
  self->_finderinfo = v71;
  v50 = (apple_double_entry *)*((_QWORD *)v112 + 3);
  self->_rsrcfork = v50;
  finderinfo = v71;
  if (*(_WORD *)(v19 + 24) == 2)
  {
    finderinfo = v71;
    if (v71 == (apple_double_entry *)(v19 + 26))
    {
      finderinfo = v71;
      if (v50 == (apple_double_entry *)(v19 + 38))
      {
        finderinfo = v71;
        if (v71->var1 == 50)
        {
          finderinfo = v71;
          if (self->_purpose == 1)
          {
            finderinfo = v71;
            if (v71->var2 == 32)
            {
              v52 = *(_DWORD *)(v19 + 30);
              v53 = (4064 - v52);
              if (v50)
              {
                v54 = *(unsigned int *)(v19 + 46);
                if ((_DWORD)v54)
                {
                  -[LiveFSAppleDouble shiftDataDownAtOffset:lengh:howMuch:](self, "shiftDataDownAtOffset:lengh:howMuch:", *(unsigned int *)(v19 + 42), v54, (4064 - v52));
                  v55 = 120;
                  goto LABEL_87;
                }
              }
              v62 = *(unsigned int *)(v19 + 42) + v53;
              if (v62 + 286 < self->_IOSize)
              {
                v6 = 93;
                *((_DWORD *)v98 + 6) = 93;
                goto LABEL_80;
              }
              -[LiveFSAppleDouble manager](self, "manager");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "queue");
              v64 = objc_claimAutoreleasedReturnValue();
              v75[0] = v5;
              v75[1] = 3221225472;
              v75[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_3_85;
              v75[3] = &unk_24F64CAA8;
              v76 = xmmword_22BD7EC50;
              v77 = 0u;
              v78 = 0u;
              v79 = v62;
              v80 = 0u;
              v81 = 0u;
              v82 = 0u;
              v83 = 0u;
              v84 = 0u;
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              v75[4] = self;
              v75[5] = &v97;
              dispatch_sync(v64, v75);

              v53 -= 286;
              bzero((void *)(v19 + 82), v53);
              -[LiveFSAppleDouble initEmptyResourceFork:](self, "initEmptyResourceFork:", (char *)self->_filehdr + *(unsigned int *)((char *)&self->_filehdr->var4[1].var0 + 2) + v53);
              *(unsigned int *)((char *)&self->_filehdr->var4[1].var1 + 2) = 286;
              v55 = 4096;
LABEL_87:
              filehdr = self->_filehdr;
              *(unsigned int *)((char *)&filehdr->var4[0].var1 + 2) += v53;
              v66 = *(unsigned int *)((char *)&filehdr->var4[1].var0 + 2) + v53;
              *(unsigned int *)((char *)&filehdr->var4[1].var0 + 2) = v66;
              *(_DWORD *)(v19 + 84) = 1096045650;
              *(_DWORD *)(v19 + 88) = self->_baseFileID;
              *(_DWORD *)(v19 + 92) = v66;
              *(_DWORD *)(v19 + 96) = 120;
              *(_DWORD *)(v19 + 116) = 0;
              *(_QWORD *)(v19 + 100) = 0;
              *(_QWORD *)(v19 + 108) = 0;
              -[LiveFSAppleDouble swapFileHeader:](self, "swapFileHeader:");
              -[LiveFSAppleDouble swapAttrHeader:](self, "swapAttrHeader:", v19);
              -[LiveFSAppleDouble manager](self, "manager");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "queue");
              v68 = objc_claimAutoreleasedReturnValue();
              v74[0] = v5;
              v74[1] = 3221225472;
              v74[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_5;
              v74[3] = &unk_24F64CAF8;
              v74[4] = self;
              v74[5] = &v97;
              v74[6] = v55;
              dispatch_sync(v68, v74);

              -[LiveFSAppleDouble swapFileHeader:](self, "swapFileHeader:", self->_filehdr);
              if (*((_DWORD *)v98 + 6))
              {
                livefs_std_log();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                  -[LiveFSAppleDouble loadADHeader].cold.5();

                v6 = *((_DWORD *)v98 + 6);
                goto LABEL_80;
              }
              finderinfo = self->_finderinfo;
            }
          }
        }
      }
    }
  }
  if (finderinfo && finderinfo == (apple_double_entry *)(v19 + 26) && *(_DWORD *)(v19 + 34) >= 0x24u)
  {
    if (v71->var1 == 50)
    {
      -[LiveFSAppleDouble loadAttrHeader](self, "loadAttrHeader");
      goto LABEL_97;
    }
LABEL_79:
    v6 = 93;
    goto LABEL_80;
  }
LABEL_97:
  livefs_std_log();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    -[LiveFSAppleDouble loadADHeader].cold.4();

  v6 = 0;
LABEL_80:
  _Block_object_dispose(buf, 8);
LABEL_34:

LABEL_5:
  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v101, 8);
  return v6;
}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  __int128 v7;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_2;
  v6[3] = &unk_24F64C9E0;
  v7 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "fileAttributes:requestID:reply:", v4, -1, v6);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  NSObject *v4;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(a3, "getBytes:length:", *(_QWORD *)(a1 + 32) + 24, 184);
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);

}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 64);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_4;
  v8[3] = &unk_24F64CA08;
  v11 = *(_OWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v3, "readFrom:length:atOffset:requestID:reply:", v4, v5, 0, -1, v8);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if (a3)
  {
    v4 = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "length");
    objc_msgSend(*(id *)(a1 + 32), "setData:", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "syncSem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v5);

}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke_81(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "clientID");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_2_82;
  v8[3] = &unk_24F64C9E0;
  v9 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "reclaim:forClient:requestID:reply:", v4, v6, -1, v8);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_2_82(uint64_t a1, int a2)
{
  NSObject *v2;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v2);

}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke_83(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(_DWORD *)(*(_QWORD *)(a1 + 48) + 12 * *(unsigned __int16 *)(a1 + 56) + 30) + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_2_84;
  v7[3] = &unk_24F64C9E0;
  v8 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "readFrom:length:atOffset:requestID:reply:", v4, 64, v5, -1, v7);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_2_84(uint64_t a1, int a2, id a3)
{
  NSObject *v4;

  if (!a2
    && !strcmp((const char *)objc_msgSend(objc_retainAutorelease(a3), "bytes"), "This resource fork intentionally left blank   "))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "syncSem", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);

}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_3_85(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a1 + 48, 184);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_4_86;
  v9[3] = &unk_24F64CA80;
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v2;
  v11 = v7;
  v8 = v2;
  objc_msgSend(v4, "setFileAttributesOf:to:requestID:reply:", v5, v6, -1, v9);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke_4_86(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_6;
  v7[3] = &unk_24F64CAD0;
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "writeTo:atOffset:fromBuffer:requestID:reply:", v4, 0, v5, -1, v7);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_6(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  NSObject *v5;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) || *(_QWORD *)(a1 + 48) != a3)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 0;
    if (a3 && *(_QWORD *)(a1 + 48) != a3)
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v4 = 28;
      goto LABEL_8;
    }
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_DWORD *)(v3 + 24) == 28)
    {
      v4 = 5;
LABEL_8:
      *(_DWORD *)(v3 + 24) = v4;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v5);

}

- (id)valueForXattrNamed:(id)a3 posixError:(int *)a4
{
  id v6;
  void *v7;
  apple_double_entry *finderinfo;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  int v12;
  id v13;
  int v14;
  attr_header *attrhdr;
  unsigned int v16;
  attr_entry *attr_entry;
  uint64_t var3;
  uint64_t v19;
  uint64_t var0;
  uint64_t v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;

  v6 = a3;
  v7 = v6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4;
  v33 = __Block_byref_object_dispose__4;
  v34 = 0;
  if (self->_purpose >= 2u)
  {
    v13 = 0;
    v14 = 1;
LABEL_24:
    *a4 = v14;
    goto LABEL_25;
  }
  if (!self->_ADFileOK)
    goto LABEL_23;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.FinderInfo")))
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ResourceFork")))
    {
      attrhdr = self->_attrhdr;
      if (attrhdr)
      {
        *((_DWORD *)v36 + 6) = 93;
        if (HIWORD(attrhdr->var6[2]))
        {
          v16 = 0;
          attr_entry = self->_attr_entry;
          do
          {
            var3 = attr_entry->var3;
            v19 = ((_WORD)var3 + 14) & 0x1FC;
            if ((char *)((unint64_t)attr_entry + v19) > &self->_rawAD[self->_ADBufferHeaderBytesValid])
              break;
            if (var3 <= 0x80 && !attr_entry->var4[var3 - 1])
            {
              if (!strcmp((const char *)attr_entry->var4, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String")))
              {
                var0 = attr_entry->var0;
                if (self->_ADBufferHeaderBytesValid <= (attr_entry->var1 + var0))
                {
                  v25 = -[LiveFSAppleDouble openFile](self, "openFile");
                  *((_DWORD *)v36 + 6) = v25;
                  if (!v25)
                  {
                    -[LiveFSAppleDouble manager](self, "manager");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "queue");
                    v27 = objc_claimAutoreleasedReturnValue();
                    v28[0] = MEMORY[0x24BDAC760];
                    v28[1] = 3221225472;
                    v28[2] = __51__LiveFSAppleDouble_valueForXattrNamed_posixError___block_invoke;
                    v28[3] = &unk_24F64CB20;
                    v28[4] = self;
                    v28[5] = &v35;
                    v28[6] = &v29;
                    v28[7] = attr_entry;
                    dispatch_sync(v27, v28);

                    -[LiveFSAppleDouble closeFile](self, "closeFile");
                  }
                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self->_rawAD[var0]);
                  v22 = objc_claimAutoreleasedReturnValue();
                  v23 = (void *)v30[5];
                  v30[5] = v22;

                  if (v30[5])
                    v24 = 0;
                  else
                    v24 = 12;
                  *((_DWORD *)v36 + 6) = v24;
                }
                break;
              }
              attrhdr = self->_attrhdr;
              v19 = (attr_entry->var3 + 14) & 0x1FC;
            }
            attr_entry = (attr_entry *)((char *)attr_entry + v19);
            ++v16;
          }
          while (v16 < HIWORD(attrhdr->var6[2]));
        }
        *a4 = *((_DWORD *)v36 + 6);
        v11 = v30;
        goto LABEL_22;
      }
    }
    goto LABEL_23;
  }
  finderinfo = self->_finderinfo;
  if (!finderinfo || self->_emptyfinderinfo)
  {
LABEL_23:
    v13 = 0;
    v14 = 93;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self->_rawAD[finderinfo->var1], 32);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v30[5];
  v30[5] = v9;

  v11 = v30;
  if (v30[5])
    v12 = 0;
  else
    v12 = 12;
  *a4 = v12;
LABEL_22:
  v13 = (id)v11[5];
LABEL_25:
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v13;
}

intptr_t __51__LiveFSAppleDouble_valueForXattrNamed_posixError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  __int128 v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned int **)(a1 + 56);
  v8 = *v5;
  v7 = v5[1];
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __51__LiveFSAppleDouble_valueForXattrNamed_posixError___block_invoke_2;
  v10[3] = &unk_24F64C8A0;
  v10[1] = 3221225472;
  v12 = v6;
  v11 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "readFrom:length:atOffset:requestID:reply:", v4, v7, v8, -1, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __51__LiveFSAppleDouble_valueForXattrNamed_posixError___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  id v7;

  v7 = a3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_msgSend(*(id *)(a1 + 32), "syncSem");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

}

- (int)setValue:(id)a3 forXattrNamed:(id)a4 how:(int)a5
{
  int v8;
  int v9;
  _QWORD *v10;
  int v11;
  int v12;
  attr_header *attrhdr;
  attr_entry *attr_entry;
  unsigned int var4;
  int v16;
  void *v17;
  char v18;
  uint64_t *v19;
  int v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  unint64_t v30;
  uint64_t var2;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  BOOL v37;
  unint64_t v38;
  unint64_t fa_size;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  apple_double_entry *finderinfo;
  _QWORD *v44;
  apple_double_entry *v45;
  apple_double_entry *rsrcfork;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  attr_entry *v50;
  char *v51;
  attr_entry *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  attr_header *v57;
  unsigned int v58;
  int v59;
  NSObject *v60;
  int v61;
  NSObject *v62;
  int v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  id v69;
  int v70;
  _QWORD *__src;
  size_t v72;
  unsigned int var3;
  unint64_t v74;
  unsigned int v75;
  id v76;
  id v77;
  _QWORD v78[7];
  _QWORD block[7];
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  int v89;
  _QWORD v90[5];
  id v91;
  uint64_t *v92;
  uint64_t v93;
  _QWORD v94[6];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  unint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[5];
  id v108;
  uint64_t *v109;
  _QWORD v110[5];
  id v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  int v116;
  uint8_t buf[4];
  int v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v76 = a3;
  v77 = a4;
  v113 = 0;
  v114 = &v113;
  v115 = 0x2020000000;
  v116 = 0;
  if (self->_purpose != 1)
  {
    v12 = 1;
    goto LABEL_43;
  }
  if (!self->_ADFileOK)
  {
    v116 = 1;
    goto LABEL_35;
  }
  v8 = -[LiveFSAppleDouble openFile](self, "openFile");
  *((_DWORD *)v114 + 6) = v8;
  if (!v8)
  {
    v75 = objc_msgSend(v76, "length");
    v9 = objc_msgSend(v77, "length");
    if (objc_msgSend(v77, "isEqualToString:", CFSTR("com.apple.FinderInfo")))
    {
      if (objc_msgSend(v76, "length") != 32)
      {
        v12 = 22;
        goto LABEL_43;
      }
      v10 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v76), "bytes");
      if ((a5 - 3) <= 0xFFFFFFFD && !(*v10 | v10[1] | v10[2] | v10[3]))
        goto LABEL_8;
    }
    else
    {
      v10 = 0;
    }
    __src = v10;
    v72 = v9 + 1;
    v74 = (v72 + 14) & 0xFFFFFFFFFFFFFFFCLL;
LABEL_16:
    if (!objc_msgSend(v77, "isEqualToString:", CFSTR("com.apple.FinderInfo"), __src))
    {
      if (!objc_msgSend(v77, "isEqualToString:", CFSTR("com.apple.ResourceFork")))
      {
        if ((unint64_t)v75 >> 31)
        {
          v12 = 7;
          goto LABEL_43;
        }
        attrhdr = self->_attrhdr;
        if (!attrhdr)
          goto LABEL_31;
        attr_entry = self->_attr_entry;
        var4 = attrhdr->var4;
        var3 = attrhdr->var3;
        if (HIWORD(attrhdr->var6[2]))
        {
          v16 = 0;
          while ((char *)((unint64_t)attr_entry + ((attr_entry->var3 + 14) & 0x1FC)) <= &self->_rawAD[self->_ADBufferHeaderBytesValid])
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", attr_entry->var4);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v77, "isEqualToString:", v17);

            if ((v18 & 1) != 0)
            {
              if (a5 == 1)
                goto LABEL_99;
              if (attr_entry->var1 == v75)
              {
                if (v74 + v75 + var4 + var3 > 0x10000)
                {
                  -[LiveFSAppleDouble manager](self, "manager");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "queue");
                  v65 = objc_claimAutoreleasedReturnValue();
                  v107[0] = MEMORY[0x24BDAC760];
                  v107[1] = 3221225472;
                  v107[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_3;
                  v107[3] = &unk_24F64C968;
                  v107[4] = self;
                  v108 = v76;
                  v109 = &v113;
                  dispatch_sync(v65, v107);

                  if (*((_DWORD *)v114 + 6))
                  {
                    livefs_std_log();
                    v66 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                      -[LiveFSAppleDouble setValue:forXattrNamed:how:].cold.5();

                  }
                }
                else
                {
                  memcpy((char *)attrhdr + attr_entry->var0, (const void *)objc_msgSend(objc_retainAutorelease(v76), "bytes"), v75);
                  self->_IOSize = self->_attrhdr->var4 + self->_attrhdr->var3;
                  v61 = -[LiveFSAppleDouble writeXattrInfo](self, "writeXattrInfo");
                  *((_DWORD *)v114 + 6) = v61;
                  if (v61)
                  {
                    livefs_std_log();
                    v62 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                      -[LiveFSAppleDouble setValue:forXattrNamed:how:].cold.4();

                  }
                }
                goto LABEL_35;
              }
              v12 = -[LiveFSAppleDouble removeXattrNamed:](self, "removeXattrNamed:", v77);
              *((_DWORD *)v114 + 6) = v12;
              a5 = 1;
              if (!v12)
                goto LABEL_16;
              goto LABEL_43;
            }
            attr_entry = (attr_entry *)((char *)attr_entry + ((attr_entry->var3 + 14) & 0x1FC));
            if (++v16 >= HIWORD(attrhdr->var6[2]))
              break;
          }
        }
        if (a5 == 2)
          goto LABEL_31;
        v21 = attrhdr->var3;
        if (v74 + v21 > 0x10000)
        {
          v19 = v114;
          v20 = 28;
          goto LABEL_34;
        }
        v30 = v74 + v75 + var4 + var3;
        var2 = attrhdr->var2;
        v32 = (var2 - (v21 + attrhdr->var4));
        v37 = v74 + v75 >= v32;
        v33 = v74 + v75 - v32;
        if (v33 != 0 && v37)
        {
          v34 = (v33 + 4095) & 0xFFFFFFFFFFFFF000;
          v35 = v34 + var2;
          v36 = (0x10000 - var2);
          v37 = v35 <= 0x10000 || v30 >= 0x10001;
          if (v37)
            v38 = v34;
          else
            v38 = v36;
          fa_size = self->_ADFileAttributes.fa_size;
          -[LiveFSAppleDouble manager](self, "manager");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "queue");
          v41 = objc_claimAutoreleasedReturnValue();
          v94[0] = MEMORY[0x24BDAC760];
          v94[1] = 3221225472;
          v94[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_92;
          v94[3] = &unk_24F64CAA8;
          v95 = xmmword_22BD7EC50;
          v96 = 0u;
          v97 = 0u;
          v98 = fa_size + v38;
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v102 = 0u;
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v106 = 0u;
          v94[4] = self;
          v94[5] = &v113;
          dispatch_sync(v41, v94);

          if (*((_DWORD *)v114 + 6))
          {
            livefs_std_log();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              -[LiveFSAppleDouble setValue:forXattrNamed:how:].cold.3();

            goto LABEL_35;
          }
          rsrcfork = self->_rsrcfork;
          if (rsrcfork)
          {
            v47 = rsrcfork->var2;
            if ((_DWORD)v47)
            {
              -[LiveFSAppleDouble shiftDataDownAtOffset:lengh:howMuch:](self, "shiftDataDownAtOffset:lengh:howMuch:", rsrcfork->var1, v47, v38);
              rsrcfork = self->_rsrcfork;
            }
            rsrcfork->var1 += v38;
          }
          self->_finderinfo->var2 += v38;
          attrhdr->var2 += v38;
        }
        v48 = attrhdr->var3;
        if (v30 >= 0x10001)
          -[LiveFSAppleDouble shiftDataDownAtOffset:lengh:howMuch:](self, "shiftDataDownAtOffset:lengh:howMuch:", v48, attrhdr->var4, v74);
        else
          memmove((char *)attrhdr + v48 + v74, (char *)attrhdr + v48, attrhdr->var4);
        v49 = attrhdr->var3 + v74;
        attrhdr->var3 = v49;
        v50 = self->_attr_entry;
        if (v50 != attr_entry)
        {
          v51 = &self->_rawAD[self->_ADBufferHeaderBytesValid];
          do
          {
            v52 = (attr_entry *)((char *)v50 + ((v50->var3 + 14) & 0x1FC));
            if (v52 > (attr_entry *)v51)
              break;
            v50->var0 += v74;
            v50 = v52;
          }
          while (v52 != attr_entry);
        }
        v53 = attrhdr->var4;
        if (v30 >= 0x10001)
        {
          -[LiveFSAppleDouble manager](self, "manager");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "queue");
          v55 = objc_claimAutoreleasedReturnValue();
          v90[0] = MEMORY[0x24BDAC760];
          v90[1] = 3221225472;
          v90[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_94;
          v90[3] = &unk_24F64CB98;
          v90[4] = self;
          v93 = v53 + v49;
          v91 = v76;
          v92 = &v113;
          dispatch_sync(v55, v90);

          if (*((_DWORD *)v114 + 6))
          {
            livefs_std_log();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              -[LiveFSAppleDouble setValue:forXattrNamed:how:].cold.2();

            goto LABEL_35;
          }

        }
        else
        {
          memcpy((char *)attrhdr + v49 + v53, (const void *)objc_msgSend(objc_retainAutorelease(v76), "bytes"), v75);
        }
        attr_entry->var1 = v75;
        attr_entry->var0 = attrhdr->var4 + attrhdr->var3;
        attr_entry->var3 = v72;
        attr_entry->var2 = 0;
        memcpy(attr_entry->var4, (const void *)objc_msgSend(objc_retainAutorelease(v77), "UTF8String"), v72);
        ++HIWORD(attrhdr->var6[2]);
        attrhdr->var4 += v75;
        v57 = self->_attrhdr;
        v58 = v57->var3;
        if (v30 < 0x10001)
          v58 += v57->var4;
        self->_IOSize = v58;
        v59 = -[LiveFSAppleDouble writeXattrInfo](self, "writeXattrInfo");
        *((_DWORD *)v114 + 6) = v59;
        if (v59)
        {
          livefs_std_log();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            -[LiveFSAppleDouble setValue:forXattrNamed:how:].cold.1();

        }
        goto LABEL_35;
      }
      if (self->_ADFileAttributes.fa_type != 1)
      {
        v19 = v114;
        v20 = 1;
        goto LABEL_34;
      }
      v45 = self->_rsrcfork;
      if (!v45)
        goto LABEL_31;
      if (v45->var2)
      {
        if (a5 != 1)
          goto LABEL_110;
LABEL_99:
        v19 = v114;
        v20 = 17;
        goto LABEL_34;
      }
      if (a5 != 2)
      {
LABEL_110:
        -[LiveFSAppleDouble manager](self, "manager");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "queue");
        v68 = objc_claimAutoreleasedReturnValue();
        v110[0] = MEMORY[0x24BDAC760];
        v110[1] = 3221225472;
        v110[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke;
        v110[3] = &unk_24F64C968;
        v110[4] = self;
        v69 = v76;
        v111 = v69;
        v112 = &v113;
        dispatch_sync(v68, v110);

        if (!*((_DWORD *)v114 + 6))
        {
          self->_rsrcfork->var2 = objc_msgSend(v69, "length");
          self->_IOSize = 120;
          v70 = -[LiveFSAppleDouble writeXattrInfo](self, "writeXattrInfo");
          *((_DWORD *)v114 + 6) = v70;
        }

        goto LABEL_35;
      }
LABEL_31:
      v19 = v114;
      v20 = 93;
LABEL_34:
      *((_DWORD *)v19 + 6) = v20;
      goto LABEL_35;
    }
    finderinfo = self->_finderinfo;
    if (finderinfo && !self->_emptyfinderinfo)
    {
      v44 = __src;
      if (a5 == 1)
        goto LABEL_99;
    }
    else
    {
      v44 = __src;
      if (a5 == 2)
        goto LABEL_31;
    }
    if ((a5 - 1) <= 1 && !(*v44 | v44[1] | v44[2] | v44[3]))
    {
LABEL_8:
      v11 = -[LiveFSAppleDouble removeXattrNamed:](self, "removeXattrNamed:", CFSTR("com.apple.FinderInfo"));
      if (v11 == 93)
        v12 = 0;
      else
        v12 = v11;
      *((_DWORD *)v114 + 6) = v12;
      goto LABEL_43;
    }
    if (finderinfo)
    {
      memcpy((char *)self->_filehdr + finderinfo->var1, v44, v75);
      self->_IOSize = 120;
      v63 = -[LiveFSAppleDouble writeXattrInfo](self, "writeXattrInfo");
      *((_DWORD *)v114 + 6) = v63;
      self->_emptyfinderinfo = 0;
      goto LABEL_35;
    }
    goto LABEL_31;
  }
LABEL_35:
  if (!*((_DWORD *)v114 + 6))
  {
    v86 = 0;
    v87 = &v86;
    v88 = 0x2020000000;
    v89 = 0;
    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__4;
    v84 = __Block_byref_object_dispose__4;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 184);
    v85 = (id)objc_claimAutoreleasedReturnValue();
    -[LiveFSAppleDouble manager](self, "manager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "queue");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_96;
    block[3] = &unk_24F64C8C8;
    block[4] = self;
    block[5] = &v86;
    block[6] = &v80;
    dispatch_sync(v23, block);

    if (!*((_DWORD *)v87 + 6))
    {
      *(_QWORD *)(objc_msgSend(objc_retainAutorelease((id)v81[5]), "mutableBytes") + 8) = 2048;
      -[LiveFSAppleDouble manager](self, "manager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "queue");
      v26 = objc_claimAutoreleasedReturnValue();
      v78[0] = v24;
      v78[1] = 3221225472;
      v78[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_3_98;
      v78[3] = &unk_24F64C8C8;
      v78[4] = self;
      v78[5] = &v80;
      v78[6] = &v86;
      dispatch_sync(v26, v78);

      if (*((_DWORD *)v114 + 6))
      {
        livefs_std_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *((_DWORD *)v87 + 6);
          *(_DWORD *)buf = 67109120;
          v118 = v28;
          _os_log_impl(&dword_22BD61000, v27, OS_LOG_TYPE_DEFAULT, "error updating MTIME on base file:%d", buf, 8u);
        }

      }
    }
    _Block_object_dispose(&v80, 8);

    _Block_object_dispose(&v86, 8);
  }
  -[LiveFSAppleDouble closeFile](self, "closeFile");
  v12 = *((_DWORD *)v114 + 6);
LABEL_43:
  _Block_object_dispose(&v113, 8);

  return v12;
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) + 4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2;
  v8[3] = &unk_24F64CB48;
  v8[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "writeTo:atOffset:fromBuffer:requestID:reply:", v4, v6, v5, -1, v8);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336));
}

uint64_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(unsigned int *)(*(_QWORD *)(v6 + 264) + 4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_4;
  v10[3] = &unk_24F64C940;
  v8 = *(_QWORD *)(a1 + 48);
  v10[4] = v6;
  v10[5] = v8;
  objc_msgSend(v3, "writeTo:atOffset:fromBuffer:requestID:reply:", v4, v7, v5, -1, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_4(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336));
}

void __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_92(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id location;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a1 + 48, 184);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_93;
  v8[3] = &unk_24F64CB70;
  objc_copyWeak(&v11, &location);
  v10 = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v9 = v7;
  objc_msgSend(v4, "setFileAttributesOf:to:requestID:reply:", v5, v6, -1, v8);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_93(uint64_t a1, int a2, void *a3)
{
  char *WeakRetained;
  void *v6;
  BOOL v7;
  id v8;

  v8 = a3;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v7 = 1;
  else
    v7 = WeakRetained == 0;
  if (!v7)
    objc_msgSend(v8, "getBytes:length:", WeakRetained + 24, 184);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_94(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[6];

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_95;
  v9[3] = &unk_24F64C940;
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v6;
  objc_msgSend(v3, "writeTo:atOffset:fromBuffer:requestID:reply:", v4, v5, v7, -1, v9);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_95(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336));
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_96(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseFileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_97;
  v6[3] = &unk_24F64C8A0;
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "fileAttributes:requestID:reply:", v4, -1, v6);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_97(_QWORD *a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  if (!*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setData:");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 336));
}

void __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_3_98(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseFileHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_4_99;
  v10[3] = &unk_24F64CA80;
  v8 = *(_QWORD *)(v7 + 40);
  v10[1] = 3221225472;
  v11 = v2;
  v12 = v6;
  v9 = v2;
  objc_msgSend(v4, "setFileAttributesOf:to:requestID:reply:", v5, v8, -1, v10);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_4_99(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)removeXattrNamed:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  attr_header *attrhdr;
  int v8;
  int v9;
  NSObject *v10;
  apple_double_entry *finderinfo;
  _OWORD *v12;
  int v13;
  int v14;
  NSObject *v15;
  apple_double_entry *rsrcfork;
  uint64_t var2;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  attr_entry *attr_entry;
  unsigned int v26;
  NSObject *v27;
  void *v28;
  char v29;
  NSObject *v31;
  int v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v43;
  attr_header *v44;
  unsigned int var3;
  unsigned int var4;
  NSObject *v47;
  unsigned int v48;
  uint64_t var0;
  uint64_t var1;
  uint64_t v51;
  NSObject *v52;
  attr_header *v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  NSObject *v62;
  attr_header *v63;
  unsigned __int16 v64;
  unsigned int v65;
  int v66;
  attr_entry *v67;
  char *v68;
  attr_entry *v69;
  unsigned int v70;
  NSObject *v71;
  int v72;
  NSObject *v73;
  NSObject *v74;
  int v75;
  _QWORD v76[7];
  _QWORD v77[7];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  int v81;
  _QWORD v82[5];
  id v83;
  uint64_t *v84;
  _QWORD block[6];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  int v101;
  uint8_t v102[4];
  int v103;
  __int128 buf;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  if (self->_purpose != 1)
  {
    v14 = 1;
    goto LABEL_70;
  }
  if (self->_ADFileOK)
  {
    v5 = -[LiveFSAppleDouble openFile](self, "openFile");
    *((_DWORD *)v99 + 6) = v5;
    if (!v5)
    {
      livefs_std_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[LiveFSAppleDouble removeXattrNamed:].cold.18();

      attrhdr = self->_attrhdr;
      if (attrhdr)
      {
        v8 = HIWORD(attrhdr->var6[2]);
        if (self->_rsrcfork)
          v9 = v8 + 1;
        else
          v9 = v8;
        if (self->_finderinfo && !self->_emptyfinderinfo)
          ++v9;
        livefs_std_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[LiveFSAppleDouble removeXattrNamed:].cold.17();

        if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.FinderInfo")))
        {
          finderinfo = self->_finderinfo;
          if (finderinfo && !self->_emptyfinderinfo)
          {
            if (v9 != 1)
            {
              v12 = (_OWORD *)((char *)&self->_filehdr->var0 + finderinfo->var1);
              *v12 = 0u;
              v12[1] = 0u;
              self->_IOSize = 120;
              v13 = -[LiveFSAppleDouble writeXattrInfo](self, "writeXattrInfo");
              *((_DWORD *)v99 + 6) = v13;
              if (!v13)
                self->_emptyfinderinfo = 1;
              goto LABEL_55;
            }
LABEL_85:
            *((_DWORD *)v99 + 6) = 0;
LABEL_86:
            -[LiveFSAppleDouble fileHandle](self, "fileHandle");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            livefs_std_log();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              -[LiveFSAppleDouble removeXattrNamed:].cold.5();

            -[LiveFSAppleDouble closeFile](self, "closeFile");
            -[LiveFSAppleDouble manager](self, "manager");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "queue");
            v59 = objc_claimAutoreleasedReturnValue();
            v82[0] = MEMORY[0x24BDAC760];
            v82[1] = 3221225472;
            v82[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_100;
            v82[3] = &unk_24F64C968;
            v82[4] = self;
            v60 = v56;
            v83 = v60;
            v84 = &v98;
            dispatch_sync(v59, v82);

            livefs_std_log();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
              -[LiveFSAppleDouble removeXattrNamed:].cold.4();

            goto LABEL_55;
          }
        }
        else
        {
          livefs_std_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[LiveFSAppleDouble removeXattrNamed:].cold.16();

          if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ResourceFork")))
          {
            if (self->_ADFileAttributes.fa_type != 1)
            {
              v32 = 1;
              goto LABEL_54;
            }
            rsrcfork = self->_rsrcfork;
            if (rsrcfork && rsrcfork->var2)
            {
              *((_DWORD *)v99 + 6) = 0;
              if (v9 != 1)
              {
                var2 = rsrcfork->var2;
                if (self->_ADFileAttributes.fa_size != (_DWORD)var2 + rsrcfork->var1)
                  goto LABEL_37;
                -[LiveFSAppleDouble manager](self, "manager");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "queue");
                v19 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke;
                block[3] = &unk_24F64CAA8;
                v86 = xmmword_22BD7EC50;
                v87 = 0u;
                v88 = 0u;
                v89 = var2;
                v90 = 0u;
                v91 = 0u;
                v92 = 0u;
                v93 = 0u;
                v94 = 0u;
                v95 = 0u;
                v96 = 0u;
                v97 = 0u;
                block[4] = self;
                block[5] = &v98;
                dispatch_sync(v19, block);

                if (*((_DWORD *)v99 + 6))
                {
                  livefs_std_log();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    v21 = *((_DWORD *)v99 + 6);
                    LODWORD(buf) = 67109120;
                    DWORD1(buf) = v21;
                    _os_log_impl(&dword_22BD61000, v20, OS_LOG_TYPE_DEFAULT, "removeXattrName: error truncating to resource fork length's:%d", (uint8_t *)&buf, 8u);
                  }

                }
                if (!*((_DWORD *)v99 + 6))
                {
LABEL_37:
                  self->_rsrcfork->var2 = 0;
                  self->_IOSize = 120;
                  v22 = -[LiveFSAppleDouble writeXattrInfo](self, "writeXattrInfo");
                  *((_DWORD *)v99 + 6) = v22;
                }
                goto LABEL_55;
              }
              goto LABEL_86;
            }
          }
          else
          {
            livefs_std_log();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              -[LiveFSAppleDouble removeXattrNamed:].cold.15();

            livefs_std_log();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              -[LiveFSAppleDouble removeXattrNamed:].cold.14();

            if (HIWORD(self->_attrhdr->var6[2]))
            {
              attr_entry = self->_attr_entry;
              v26 = 1;
              while ((char *)((unint64_t)attr_entry + ((attr_entry->var3 + 14) & 0x1FC)) <= &self->_rawAD[self->_ADBufferHeaderBytesValid])
              {
                livefs_std_log();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(buf) = 136315138;
                  *(_QWORD *)((char *)&buf + 4) = attr_entry->var4;
                  _os_log_debug_impl(&dword_22BD61000, v27, OS_LOG_TYPE_DEBUG, "removeXattrName: looking at [%s]", (uint8_t *)&buf, 0xCu);
                }

                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", attr_entry->var4);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v4, "isEqualToString:", v28);

                if ((v29 & 1) != 0)
                {
                  v75 = HIWORD(self->_attrhdr->var6[2]);
                  livefs_std_log();
                  v43 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                    -[LiveFSAppleDouble removeXattrNamed:].cold.13();

                  if (v9 != 1)
                  {
                    v44 = self->_attrhdr;
                    var3 = v44->var3;
                    var4 = v44->var4;
                    livefs_std_log();
                    v47 = objc_claimAutoreleasedReturnValue();
                    v48 = var4 + var3;
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                      -[LiveFSAppleDouble removeXattrNamed:].cold.12();

                    var0 = attr_entry->var0;
                    var1 = attr_entry->var1;
                    v51 = (attr_entry->var3 + 14) & 0x1FCLL;
                    if (v75 != v26)
                      memcpy(attr_entry, (char *)attr_entry + v51, (char *)self->_attrhdr + self->_attrhdr->var3 - ((char *)attr_entry + v51));
                    livefs_std_log();
                    v52 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                      -[LiveFSAppleDouble removeXattrNamed:].cold.11();

                    v53 = self->_attrhdr;
                    v54 = v53->var3;
                    if (v48 <= 0x10000)
                    {
                      memmove((char *)v53 + v54 - v51, (char *)v53 + v54, var0 - v54);
                      if (v75 != v26)
                        memmove((char *)self->_attrhdr + var0 - v51, (char *)self->_attrhdr + var0 + var1, self->_attrhdr->var4 + self->_attrhdr->var3 - (var1 + var0));
                      bzero((char *)self->_attrhdr + self->_attrhdr->var3 + self->_attrhdr->var4 - v51 - var1, v51 + var1);
                      v55 = self->_attrhdr->var4 + self->_attrhdr->var3;
                    }
                    else
                    {
                      -[LiveFSAppleDouble shiftDataUp:length:howMuch:](self, "shiftDataUp:length:howMuch:", v54, var0 - v54, v51);
                      if (v75 != v26)
                        -[LiveFSAppleDouble shiftDataUp:length:howMuch:](self, "shiftDataUp:length:howMuch:", var1 + var0, self->_attrhdr->var4 + self->_attrhdr->var3 - (var1 + var0), v51 + var1);
                      v55 = self->_attrhdr->var3 - v51;
                    }
                    self->_IOSize = v55;
                    livefs_std_log();
                    v62 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                      -[LiveFSAppleDouble removeXattrNamed:].cold.10();

                    v63 = self->_attrhdr;
                    v64 = HIWORD(v63->var6[2]) - 1;
                    HIWORD(v63->var6[2]) = v64;
                    v65 = v63->var4 - var1;
                    v63->var3 -= v51;
                    v63->var4 = v65;
                    v66 = v64;
                    if (v64)
                    {
                      v67 = self->_attr_entry;
                      v68 = &self->_rawAD[self->_ADBufferHeaderBytesValid];
                      do
                      {
                        v69 = (attr_entry *)((char *)v67 + ((v67->var3 + 14) & 0x1FC));
                        if (v69 > (attr_entry *)v68)
                          break;
                        v70 = v67->var0;
                        if (v67->var0 > var0)
                        {
                          v70 -= var1;
                          v67->var0 = v70;
                        }
                        v67->var0 = v70 - v51;
                        v67 = v69;
                        --v66;
                      }
                      while (v66);
                    }
                    livefs_std_log();
                    v71 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                      -[LiveFSAppleDouble removeXattrNamed:].cold.9();

                    v72 = -[LiveFSAppleDouble writeXattrInfo](self, "writeXattrInfo");
                    *((_DWORD *)v99 + 6) = v72;
                    if (v72)
                    {
                      livefs_std_log();
                      v73 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                        -[LiveFSAppleDouble removeXattrNamed:].cold.8();

                    }
                    livefs_std_log();
                    v74 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
                      -[LiveFSAppleDouble removeXattrNamed:].cold.7();

                    goto LABEL_55;
                  }
                  goto LABEL_85;
                }
                attr_entry = (attr_entry *)((char *)attr_entry + ((attr_entry->var3 + 14) & 0x1FC));
                if (v26++ >= HIWORD(self->_attrhdr->var6[2]))
                  break;
              }
            }
            livefs_std_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              -[LiveFSAppleDouble removeXattrNamed:].cold.6();

          }
        }
        v32 = 93;
LABEL_54:
        *((_DWORD *)v99 + 6) = v32;
        goto LABEL_55;
      }
      *((_DWORD *)v99 + 6) = 93;
    }
  }
  else
  {
    v101 = 93;
  }
LABEL_55:
  if (!*((_DWORD *)v99 + 6))
  {
    v78 = 0;
    v79 = &v78;
    v80 = 0x2020000000;
    v81 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v105 = 0x3032000000;
    v106 = __Block_byref_object_copy__4;
    v107 = __Block_byref_object_dispose__4;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 184);
    v108 = (id)objc_claimAutoreleasedReturnValue();
    -[LiveFSAppleDouble manager](self, "manager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "queue");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x24BDAC760];
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_102;
    v77[3] = &unk_24F64C8C8;
    v77[4] = self;
    v77[5] = &v78;
    v77[6] = &buf;
    dispatch_sync(v34, v77);

    if (!*((_DWORD *)v79 + 6))
    {
      *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40)), "mutableBytes") + 8) = 2048;
      -[LiveFSAppleDouble manager](self, "manager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "queue");
      v37 = objc_claimAutoreleasedReturnValue();
      v76[0] = v35;
      v76[1] = 3221225472;
      v76[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_3;
      v76[3] = &unk_24F64C8C8;
      v76[4] = self;
      v76[5] = &buf;
      v76[6] = &v78;
      dispatch_sync(v37, v76);

      if (*((_DWORD *)v79 + 6))
      {
        livefs_std_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = *((_DWORD *)v79 + 6);
          *(_DWORD *)v102 = 67109120;
          v103 = v39;
          _os_log_impl(&dword_22BD61000, v38, OS_LOG_TYPE_DEFAULT, "removeXattrNamed: Error updating base file's mtime:%d", v102, 8u);
        }

      }
    }
    livefs_std_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      -[LiveFSAppleDouble removeXattrNamed:].cold.3();

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v78, 8);
  }
  -[LiveFSAppleDouble closeFile](self, "closeFile");
  if (*((_DWORD *)v99 + 6))
  {
    livefs_std_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[LiveFSAppleDouble removeXattrNamed:].cold.2();
  }
  else
  {
    livefs_std_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      -[LiveFSAppleDouble removeXattrNamed:].cold.1();
  }

  v14 = *((_DWORD *)v99 + 6);
LABEL_70:
  _Block_object_dispose(&v98, 8);

  return v14;
}

void __38__LiveFSAppleDouble_removeXattrNamed___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id location;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a1 + 48, 184);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2;
  v8[3] = &unk_24F64CB70;
  objc_copyWeak(&v11, &location);
  v10 = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v9 = v7;
  objc_msgSend(v4, "setFileAttributesOf:to:requestID:reply:", v5, v6, -1, v8);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  char *WeakRetained;
  void *v6;
  BOOL v7;
  id v8;

  v8 = a3;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v7 = 1;
  else
    v7 = WeakRetained == 0;
  if (!v7)
    objc_msgSend(v8, "getBytes:length:", WeakRetained + 24, 184);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_100(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[6];

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "parentDirHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2_101;
  v9[3] = &unk_24F64C7B0;
  v7 = *(_QWORD *)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v7;
  objc_msgSend(v3, "removeItem:from:named:usingFlags:requestID:reply:", v4, v5, v6, 0, -1, v9);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2_101(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336));
}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_102(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseFileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2_103;
  v6[3] = &unk_24F64C8A0;
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "fileAttributes:requestID:reply:", v4, -1, v6);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2_103(_QWORD *a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  if (!*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setData:");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 336));
}

void __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseFileHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_4;
  v10[3] = &unk_24F64CA80;
  v8 = *(_QWORD *)(v7 + 40);
  v10[1] = 3221225472;
  v11 = v2;
  v12 = v6;
  v9 = v2;
  objc_msgSend(v4, "setFileAttributesOf:to:requestID:reply:", v5, v8, -1, v10);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_4(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)allXattrNamesAndPosixError:(int *)a3
{
  void *v5;
  int purpose;
  void *v7;
  void *v8;
  attr_header *attrhdr;
  unsigned int v10;
  attr_entry *attr_entry;
  uint64_t var3;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  purpose = self->_purpose;
  if (purpose != 1)
  {
    if (purpose)
    {
      v15 = 0;
      *a3 = 1;
      goto LABEL_26;
    }
    purpose = !self->_finderinfo && !self->_attrhdr && !self->_rsrcfork
           || (self->_ADFileAttributes.fa_size & 0xFFFFFFFFFFFF0000) != 0;
  }
  *a3 = 0;
  if (self->_ADFileOK && (!purpose || !-[LiveFSAppleDouble openFile](self, "openFile")))
  {
    if (self->_finderinfo && !self->_emptyfinderinfo)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.FinderInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
    if (self->_rsrcfork)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.ResourceFork");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
    attrhdr = self->_attrhdr;
    if (attrhdr && HIWORD(attrhdr->var6[2]))
    {
      v10 = 0;
      attr_entry = self->_attr_entry;
      do
      {
        var3 = attr_entry->var3;
        v13 = ((_WORD)var3 + 14) & 0x1FC;
        if ((char *)((unint64_t)attr_entry + v13) > &self->_rawAD[self->_ADBufferHeaderBytesValid])
          break;
        if (var3 <= 0x80 && !*(&attr_entry->var3 + var3))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", attr_entry->var4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

          attrhdr = self->_attrhdr;
          v13 = (attr_entry->var3 + 14) & 0x1FC;
        }
        attr_entry = (attr_entry *)((char *)attr_entry + v13);
        ++v10;
      }
      while (v10 < HIWORD(attrhdr->var6[2]));
    }
    -[LiveFSAppleDouble closeFile](self, "closeFile");
  }
  v15 = v5;
LABEL_26:

  return v15;
}

- (int)removeFile
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  _QWORD v10[6];
  uint64_t v11;
  _QWORD v12[2];
  int v13;

  v11 = 0;
  v12[0] = &v11;
  v12[1] = 0x2020000000;
  v13 = 0;
  if (self->_purpose == 2)
  {
    -[LiveFSAppleDouble fileHandle](self, "fileHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      livefs_std_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        -[LiveFSAppleDouble removeFile].cold.2(v4);

      -[LiveFSAppleDouble manager](self, "manager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "queue");
      v6 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __31__LiveFSAppleDouble_removeFile__block_invoke;
      v10[3] = &unk_24F64C878;
      v10[4] = self;
      v10[5] = &v11;
      dispatch_sync(v6, v10);

      livefs_std_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[LiveFSAppleDouble removeFile].cold.1((uint64_t)v12, v7);

      self->_purpose = 666;
      v8 = *(_DWORD *)(v12[0] + 24);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

intptr_t __31__LiveFSAppleDouble_removeFile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parentDirHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__LiveFSAppleDouble_removeFile__block_invoke_2;
  v8[3] = &unk_24F64C7B0;
  v9 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "removeItem:from:named:usingFlags:requestID:reply:", v4, v5, v6, 0, -1, v8);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __31__LiveFSAppleDouble_removeFile__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;

  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __31__LiveFSAppleDouble_removeFile__block_invoke_2_cold_1(v4);

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336));
}

- (int)renameFileToDirectory:(id)a3 andName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  int v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (self->_purpose == 2)
  {
    -[LiveFSAppleDouble fileHandle](self, "fileHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[LiveFSAppleDouble manager](self, "manager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "AppleDoubleNameForFileNamed:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[LiveFSAppleDouble manager](self, "manager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __51__LiveFSAppleDouble_renameFileToDirectory_andName___block_invoke;
      v17[3] = &unk_24F64CBE8;
      v17[4] = self;
      v18 = v6;
      v13 = v10;
      v19 = v13;
      v20 = &v21;
      dispatch_sync(v12, v17);

      livefs_std_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[LiveFSAppleDouble renameFileToDirectory:andName:].cold.1();

      self->_purpose = 666;
      v15 = *((_DWORD *)v22 + 6);

    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 1;
  }
  _Block_object_dispose(&v21, 8);

  return v15;
}

intptr_t __51__LiveFSAppleDouble_renameFileToDirectory_andName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parentDirHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__LiveFSAppleDouble_renameFileToDirectory_andName___block_invoke_2;
  v10[3] = &unk_24F64CBC0;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = v7;
  objc_msgSend(v3, "renameItemIn:named:toDirectory:newName:usingFlags:requestID:reply:", v4, v5, v8, v6, 0, -1, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __51__LiveFSAppleDouble_renameFileToDirectory_andName___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336));
}

- (int)linkFileToDirectory:(id)a3 andName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (self->_purpose == 2)
  {
    -[LiveFSAppleDouble fileHandle](self, "fileHandle");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[LiveFSAppleDouble manager](self, "manager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "AppleDoubleNameForFileNamed:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[LiveFSAppleDouble manager](self, "manager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __49__LiveFSAppleDouble_linkFileToDirectory_andName___block_invoke;
      v15[3] = &unk_24F64CBE8;
      v15[4] = self;
      v13 = v10;
      v16 = v13;
      v17 = v6;
      v18 = &v19;
      dispatch_sync(v12, v15);

      livefs_std_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[LiveFSAppleDouble linkFileToDirectory:andName:].cold.1();

      LODWORD(v8) = *((_DWORD *)v20 + 6);
    }
  }
  else
  {
    LODWORD(v8) = 1;
  }
  _Block_object_dispose(&v19, 8);

  return (int)v8;
}

intptr_t __49__LiveFSAppleDouble_linkFileToDirectory_andName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clientID");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__LiveFSAppleDouble_linkFileToDirectory_andName___block_invoke_2;
  v11[3] = &unk_24F64CC10;
  v9 = *(_QWORD *)(a1 + 56);
  v11[4] = *(_QWORD *)(a1 + 32);
  v11[5] = v9;
  objc_msgSend(v3, "makeLinkOf:named:inDirectory:andClient:requestID:reply:", v4, v6, v5, v8, -1, v11);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __49__LiveFSAppleDouble_linkFileToDirectory_andName___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336));
}

- (void)shiftDataDownAtOffset:(unsigned int)a3 lengh:(unsigned int)a4 howMuch:(unint64_t)a5
{
  void *v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  unint64_t v22;
  unsigned int v23;
  int v24;
  _QWORD block[5];
  id v26;
  uint64_t *v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4096);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (a4)
  {
    if (a5)
    {
      v9 = a3 + a4 - 4096;
      if (v9 >= a3)
      {
        v10 = MEMORY[0x24BDAC760];
        v11 = 4096;
        do
        {
          -[LiveFSAppleDouble manager](self, "manager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "queue");
          v13 = objc_claimAutoreleasedReturnValue();
          block[0] = v10;
          block[1] = 3221225472;
          block[2] = __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke;
          block[3] = &unk_24F64CC60;
          v28 = v11;
          v29 = v9;
          block[4] = self;
          v27 = &v30;
          v14 = v8;
          v26 = v14;
          dispatch_sync(v13, block);

          if (*((_DWORD *)v31 + 6))
          {
            v15 = 2;
          }
          else
          {
            -[LiveFSAppleDouble manager](self, "manager");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "queue");
            v17 = objc_claimAutoreleasedReturnValue();
            v19[0] = v10;
            v19[1] = 3221225472;
            v19[2] = __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_3;
            v19[3] = &unk_24F64CCB0;
            v23 = v9;
            v19[4] = self;
            v22 = a5;
            v20 = v14;
            v21 = &v30;
            v24 = v11;
            dispatch_sync(v17, v19);

            if (*((_DWORD *)v31 + 6) || v9 - v11 < a3 && (v11 = a3 - v9, a3 == v9))
              v15 = 2;
            else
              v15 = 0;

          }
          if (v15)
            break;
          v9 -= v11;
        }
        while (v9 >= a3);
      }
    }
  }
  _Block_object_dispose(&v30, 8);

}

void __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_2;
  v10[3] = &unk_24F64CC38;
  v5 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned int *)(a1 + 56);
  v7 = *(unsigned int *)(a1 + 60);
  v10[1] = 3221225472;
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v3, "readFrom:length:atOffset:requestID:reply:", v4, v6, v7, -1, v10);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "setData:");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 336));
}

intptr_t __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];
  int v11;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_DWORD *)(a1 + 68);
  v7 = *(_QWORD *)(a1 + 56) + *(unsigned int *)(a1 + 64);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_4;
  v10[3] = &unk_24F64CC88;
  v11 = v6;
  v8 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = v5;
  objc_msgSend(v3, "writeTo:atOffset:fromBuffer:requestID:reply:", v4, v7, v8, -1, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_DWORD *)(v3 + 24) && *(_DWORD *)(a1 + 48) != a3)
    *(_DWORD *)(v3 + 24) = 5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336));
}

- (void)shiftDataUp:(int64_t)a3 length:(unint64_t)a4 howMuch:(unint64_t)a5
{
  unint64_t v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD block[5];
  id v26;
  uint64_t *v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (a5 >= 0x1000)
    v8 = 4096;
  else
    v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a4 + a3;
  if ((uint64_t)(a4 + a3) > a3)
  {
    v11 = MEMORY[0x24BDAC760];
    do
    {
      -[LiveFSAppleDouble manager](self, "manager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke;
      block[3] = &unk_24F64CCD8;
      v28 = v8;
      v29 = a3;
      block[4] = self;
      v27 = &v30;
      v14 = v9;
      v26 = v14;
      dispatch_sync(v13, block);

      if (*((_DWORD *)v31 + 6))
      {
        v15 = 2;
      }
      else
      {
        -[LiveFSAppleDouble manager](self, "manager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "queue");
        v17 = objc_claimAutoreleasedReturnValue();
        v19[0] = v11;
        v19[1] = 3221225472;
        v19[2] = __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_3;
        v19[3] = &unk_24F64CD00;
        v19[4] = self;
        v22 = a3;
        v23 = a5;
        v20 = v14;
        v21 = &v30;
        v24 = v8;
        dispatch_sync(v17, v19);

        if (*((_DWORD *)v31 + 6) || v8 + a3 > v10 && (v8 = v10 - a3, v10 == a3))
          v15 = 2;
        else
          v15 = 0;

      }
      if (v15)
        break;
      a3 += v8;
    }
    while (a3 < v10);
  }
  _Block_object_dispose(&v30, 8);

}

void __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_2;
  v10[3] = &unk_24F64CC38;
  v5 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v10[1] = 3221225472;
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v3, "readFrom:length:atOffset:requestID:reply:", v4, v6, v7, -1, v10);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "setData:");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 336));
}

intptr_t __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 56) - *(_QWORD *)(a1 + 64);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_4;
  v10[3] = &unk_24F64CAD0;
  v10[5] = v5;
  v10[6] = v6;
  v8 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "writeTo:atOffset:fromBuffer:requestID:reply:", v4, v7, v8, -1, v10);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_4(_QWORD *a1, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v3 = *(_QWORD *)(a1[5] + 8);
  if (!*(_DWORD *)(v3 + 24) && a1[6] != a3)
    *(_DWORD *)(v3 + 24) = 5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 336));
}

- (LiveFSAppleDoubleManager)manager
{
  return (LiveFSAppleDoubleManager *)objc_getProperty(self, a2, 304, 1);
}

- (void)setManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSString)parentDirHandle
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setParentDirHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)fileHandle
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (OS_dispatch_semaphore)syncSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 336, 1);
}

- (void)setSyncSem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (int)purpose
{
  return self->_purpose;
}

- (int)ADFileErr
{
  return self->_ADFileErr;
}

- (NSString)baseFileHandle
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setBaseFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseFileHandle, 0);
  objc_storeStrong((id *)&self->syncSem, 0);
  objc_storeStrong((id *)&self->fileHandle, 0);
  objc_storeStrong((id *)&self->fileName, 0);
  objc_storeStrong((id *)&self->parentDirHandle, 0);
  objc_storeStrong((id *)&self->manager, 0);
  objc_storeStrong((id *)&self->_ADHeaderBuffer, 0);
}

- (void)createFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "AD:createFile:finish:error getting attrs:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)openFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "AD:openfile:finish:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)loadADHeader
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  v3 = 134217984;
  v4 = v0;
  OUTLINED_FUNCTION_7(&dword_22BD61000, v1, v2, "LFSAD: loadADHeader: successfully read apple double file: %zu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)setValue:forXattrNamed:how:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "setValue:forXattrNamed:how: error writing final xattr info: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)setValue:forXattrNamed:how:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "setValue:forXattrNamed:how: error writing value: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)setValue:forXattrNamed:how:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "setValue:forXattrNamed:how: error truncating: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)setValue:forXattrNamed:how:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "setValue:forXattrNamed:how: error writing out header: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)setValue:forXattrNamed:how:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "setValue:forXattrNamed:how: error replaceing xattr: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "removeXattrNamed: return %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "removeXattrNamed: return %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_22BD61000, v0, v1, "removeXattrName: updated ctime/mtime on the base file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "removeXattrName: Remove finished with - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "removeXattrNamed: removing AppleDouble file: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_22BD61000, v0, v1, "removeXattrName: did not find matching xattr, bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "removeXattrName: Success at removing an attr![%d]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "removeXattrNamed: failed to write updated xattr info: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_22BD61000, v0, v1, "removeXattrName: adjusted all offsets.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_22BD61000, v0, v1, "removeXattrName: removed data for xattr.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_22BD61000, v0, v1, "removeXattrName: compacted the entries", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "removeXattrName: splitData: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "removeXattrName: Found entry to delete with lastOne: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_22BD61000, v0, v1, "removeXattrName: about to itterate over all XATTRS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_22BD61000, v0, v1, "removeXattrName: Not removing resource fork", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_22BD61000, v0, v1, "removeXattrName: Not removing finderinfo", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "removeXattrName: Total number of attrs in the file - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)removeXattrNamed:.cold.18()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_22BD61000, v0, v1, "removeXattrName: removing xattr - %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)removeFile
{
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_22BD61000, a1, v2, "removeFile: Start on %s", v3);
  OUTLINED_FUNCTION_10();
}

void __31__LiveFSAppleDouble_removeFile__block_invoke_2_cold_1(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_22BD61000, a1, v2, "removeFile: removed on %s", v3);
  OUTLINED_FUNCTION_10();
}

- (void)renameFileToDirectory:andName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "renameFile: Rename finished with - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)linkFileToDirectory:andName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, v0, v1, "renameFile: Link finished with - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
