@implementation CLKWatchFaceLibrary

+ (CLKWatchFaceLibrary)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__CLKWatchFaceLibrary_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (CLKWatchFaceLibrary *)(id)sharedInstance___shared;
}

void __37__CLKWatchFaceLibrary_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___shared;
  sharedInstance___shared = (uint64_t)v1;

}

- (CLKWatchFaceLibrary)init
{
  CLKWatchFaceLibrary *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *helperQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKWatchFaceLibrary;
  v2 = -[CLKWatchFaceLibrary init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ClockKit.CLKWatchFaceLibrary", v3);
    helperQueue = v2->_helperQueue;
    v2->_helperQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)addWatchFaceAtURL:(NSURL *)fileURL completionHandler:(void *)handler
{
  void *v6;
  void *v7;
  NSURL *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x24BDD1760];
  v7 = handler;
  v8 = fileURL;
  objc_msgSend(v6, "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CLKWatchFaceLibrary _addWatchFaceAtURL:shouldValidate:completionHandler:](self, "_addWatchFaceAtURL:shouldValidate:completionHandler:", v8, objc_msgSend(v11, "isEqualToString:", CFSTR("mobilesms")) ^ 1, v7);
}

- (void)_addWatchFaceAtURL:(id)a3 shouldValidate:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD);
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  CLKLoggingObjectForDomain(9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl(&dword_2114F4000, v10, OS_LOG_TYPE_DEFAULT, "importWatchFaceAtURL: %@", buf, 0xCu);
  }

  v11 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke;
  v25[3] = &unk_24CBF90D0;
  v12 = v9;
  v26 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BDBEAC](v25);
  if ((objc_msgSend(v8, "isFileURL") & 1) != 0)
  {
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_3;
    v22[3] = &unk_24CBFADB8;
    v22[4] = self;
    v14 = v8;
    v23 = v14;
    v15 = v13;
    v24 = v15;
    v16 = MEMORY[0x212BDBEAC](v22);
    v17 = (void *)v16;
    if (v6)
    {
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_4;
      v19[3] = &unk_24CBFB1B0;
      v20 = v15;
      v21 = v17;
      -[CLKWatchFaceLibrary _validateWatchFaceAtURL:completionHandler:](self, "_validateWatchFaceAtURL:completionHandler:", v14, v19);

    }
    else
    {
      (*(void (**)(uint64_t))(v16 + 16))(v16);
    }

  }
  else
  {
    +[CLKWatchFaceLibrary errorWithCode:](CLKWatchFaceLibrary, "errorWithCode:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v18);

  }
}

void __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_2;
  v6[3] = &unk_24CBFAE30;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_importWatchFaceAtURL:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __75__CLKWatchFaceLibrary__addWatchFaceAtURL_shouldValidate_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)errorWithCode:(int64_t)a3
{
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a3 - 1) > 3)
    v5 = CFSTR("IMPORT_FACE_ERROR_UNKNOWN");
  else
    v5 = off_24CBFB1D0[a3 - 1];
  CLKGreenfieldLocalizedString(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v5 = (__CFString *)v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLKWatchFaceLibraryErrorDomain"), a3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_validateWatchFaceAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *helperQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  helperQueue = self->_helperQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke;
  v11[3] = &unk_24CBFAED0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(helperQueue, v11);

}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CLKWatchFaceLibrary _unzipFile:toPath:](CLKWatchFaceLibrary, "_unzipFile:toPath:", *(_QWORD *)(a1 + 32), v6))
  {
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("face.json"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v7, 0, &v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v33;
    if (v9)
    {
      v10 = v9;
      CLKLoggingObjectForDomain(9);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_4();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_29;
      block[3] = &unk_24CBFAD18;
      v32 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v12 = v32;
    }
    else
    {
      v30 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v30);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v30;
      if (v10)
      {
        CLKLoggingObjectForDomain(9);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_3();

        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_31;
        v28[3] = &unk_24CBFAD18;
        v29 = *(id *)(a1 + 40);
        dispatch_async(MEMORY[0x24BDAC9B8], v28);
        v16 = v29;
      }
      else
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("face type"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundle id"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            CLKLoggingObjectForDomain(9);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_1();

            v24[0] = MEMORY[0x24BDAC760];
            v24[1] = 3221225472;
            v24[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_34;
            v24[3] = &unk_24CBFAD18;
            v20 = &v25;
            v25 = *(id *)(a1 + 40);
            dispatch_async(MEMORY[0x24BDAC9B8], v24);
          }
          else
          {
            +[CLKWatchFaceLibraryServer sharedInstance](CLKWatchFaceLibraryServer, "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v22[1] = 3221225472;
            v22[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_2;
            v22[3] = &unk_24CBF90D0;
            v20 = &v23;
            v22[0] = MEMORY[0x24BDAC760];
            v23 = *(id *)(a1 + 40);
            objc_msgSend(v19, "validateFaceType:faceBundleId:completionHandler:", v16, v17, v22);

          }
        }
        else
        {
          CLKLoggingObjectForDomain(9);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_1();

          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_33;
          v26[3] = &unk_24CBFAD18;
          v27 = *(id *)(a1 + 40);
          dispatch_async(MEMORY[0x24BDAC9B8], v26);
          v17 = v27;
        }

      }
    }

  }
  else
  {
    CLKLoggingObjectForDomain(9);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_5((uint64_t *)(a1 + 32), v13, v14);

    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_27;
    v34[3] = &unk_24CBFAD18;
    v35 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v34);
    v10 = v35;
  }

}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_27(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[CLKWatchFaceLibrary errorWithCode:](CLKWatchFaceLibrary, "errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[CLKWatchFaceLibrary errorWithCode:](CLKWatchFaceLibrary, "errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_31(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[CLKWatchFaceLibrary errorWithCode:](CLKWatchFaceLibrary, "errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_33(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[CLKWatchFaceLibrary errorWithCode:](CLKWatchFaceLibrary, "errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_34(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[CLKWatchFaceLibrary errorWithCode:](CLKWatchFaceLibrary, "errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_3;
  v5[3] = &unk_24CBFAED0;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    +[CLKWatchFaceLibrary errorWithCode:](CLKWatchFaceLibrary, "errorWithCode:", 4);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

+ (BOOL)_unzipFile:(id)a3 toPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int next_header;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  archive_read_new();
  archive_read_support_format_zip();
  archive_read_support_filter_gzip();
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "fileSystemRepresentation");
  if (archive_read_open_filename())
  {
    CLKLoggingObjectForDomain(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CLKWatchFaceLibrary _unzipFile:toPath:].cold.3(v7, v8);

    v9 = 0;
  }
  else
  {
    while (1)
    {
      next_header = archive_read_next_header();
      if (next_header)
        break;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", archive_entry_pathname());
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_retainAutorelease(v13);
      objc_msgSend(v14, "UTF8String");
      archive_entry_set_pathname();
      if (archive_read_extract())
      {
        CLKLoggingObjectForDomain(9);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[CLKWatchFaceLibrary _unzipFile:toPath:].cold.2((uint64_t)v11, v15, v16);

        goto LABEL_15;
      }

    }
    if (next_header == 1)
    {
      v9 = 1;
      goto LABEL_16;
    }
    CLKLoggingObjectForDomain(9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CLKWatchFaceLibrary _unzipFile:toPath:].cold.1(v11);
LABEL_15:

    v9 = 0;
LABEL_16:
    archive_read_free();
  }

  return v9;
}

- (void)_importWatchFaceAtURL:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, id);
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = 0;
  v5 = (void (**)(id, id))a4;
  objc_msgSend(a3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    CLKLoggingObjectForDomain(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CLKWatchFaceLibrary _importWatchFaceAtURL:completionHandler:].cold.1((uint64_t)v7, v8, v9);

    v5[2](v5, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();

    +[CLKWatchFaceLibraryServer sharedInstance](CLKWatchFaceLibraryServer, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openWatchFaceURLWithBookmarkData:sourceApplicationBundleIdentifier:completionHandler:", v6, v11, v5);

    v5 = (void (**)(id, id))v11;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperQueue, 0);
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3(&dword_2114F4000, v0, v1, "Failed to decode face.json: %@ %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_3(&dword_2114F4000, v0, (uint64_t)v0, "Failed to decode face.json: %@ %@", v1);
  OUTLINED_FUNCTION_1_0();
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_3(&dword_2114F4000, v0, (uint64_t)v0, "Failed to load face.json file: %@ %@", v1);
  OUTLINED_FUNCTION_1_0();
}

void __65__CLKWatchFaceLibrary__validateWatchFaceAtURL_completionHandler___block_invoke_cold_5(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a2, a3, "Failed to unzip watch face file from url: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_unzipFile:(os_log_t)log toPath:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2114F4000, log, OS_LOG_TYPE_ERROR, "Decompression failed. Bad header.", v1, 2u);
}

+ (void)_unzipFile:(uint64_t)a3 toPath:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a2, a3, "Decompression failed. Could not extract entry: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_unzipFile:(void *)a1 toPath:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 136315138;
  v5 = objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a2, v3, "Decompression failed. Could not open source: %s", (uint8_t *)&v4);
}

- (void)_importWatchFaceAtURL:(uint64_t)a3 completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a2, a3, "Failed to get the bookmark data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

@end
