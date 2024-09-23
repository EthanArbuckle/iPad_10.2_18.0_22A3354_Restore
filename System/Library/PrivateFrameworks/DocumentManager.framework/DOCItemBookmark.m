@implementation DOCItemBookmark

- (DOCItemBookmark)initWithBookmarkableString:(id)a3 fileProviderItem:(id)a4
{
  id v6;
  id v7;
  DOCItemBookmark *v8;
  NSObject **v9;
  NSObject *v10;
  void *v11;
  DOCItemBookmark *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DOCItemBookmark;
  v8 = -[DOCItemBookmark init](&v14, sel_init);
  if (v8)
  {
    v9 = (NSObject **)MEMORY[0x24BE2DF90];
    v10 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_209052000, v10, OS_LOG_TYPE_INFO, "DOCItemBookmark: initWithBookmarkableString: %@", buf, 0xCu);
    }
    -[DOCItemBookmark setBookmarkableString:](v8, "setBookmarkableString:", v6);
    -[DOCItemBookmark setFileProviderItem:](v8, "setFileProviderItem:", v7);
    objc_msgSend(v7, "contentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCItemBookmark setContentType:](v8, "setContentType:", v11);

    v8->_needsToBeImported = 0;
    v12 = v8;
  }

  return v8;
}

- (DOCItemBookmark)initWithURL:(id)a3 fileProviderItem:(id)a4
{
  id v6;
  id v7;
  DOCItemBookmark *v8;
  NSObject **v9;
  NSObject *v10;
  int v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  FPSandboxingURLWrapper *wrapper;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  DOCItemBookmark *v23;
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)DOCItemBookmark;
  v8 = -[DOCItemBookmark init](&v34, sel_init);
  if (v8)
  {
    v9 = (NSObject **)MEMORY[0x24BE2DF90];
    v10 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209052000, v10, OS_LOG_TYPE_INFO, "DOCItemBookmark: initWithURL", buf, 2u);
    }
    v11 = objc_msgSend(v6, "startAccessingSecurityScopedResource");
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__2;
    v32 = __Block_byref_object_dispose__2;
    v33 = 0;
    v12 = objc_alloc_init(MEMORY[0x24BDD1570]);
    v26[4] = buf;
    v27 = 0;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __48__DOCItemBookmark_initWithURL_fileProviderItem___block_invoke;
    v26[3] = &unk_24C0F1998;
    objc_msgSend(v12, "coordinateReadingItemAtURL:options:error:byAccessor:", v6, 0, &v27, v26);
    v13 = v27;
    if (v13)
    {
      v14 = *v9;
      if (!*v9)
      {
        DOCInitLogging();
        v14 = *v9;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[DOCItemBookmark initWithURL:fileProviderItem:].cold.2();
    }
    else
    {
      v15 = (void *)*((_QWORD *)v29 + 5);
      if (v15)
      {
        v16 = v15;

        v6 = v16;
      }
    }

    _Block_object_dispose(buf, 8);
    v25 = v13;
    +[DOCItemBookmark _wrapperForURL:error:](DOCItemBookmark, "_wrapperForURL:error:", v6, &v25);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v25;

    wrapper = v8->_wrapper;
    v8->_wrapper = (FPSandboxingURLWrapper *)v17;

    if (v11)
      objc_msgSend(v6, "stopAccessingSecurityScopedResource");
    if (v8->_wrapper)
      goto LABEL_19;
    v20 = *v9;
    if (!*v9)
    {
      DOCInitLogging();
      v20 = *v9;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[DOCItemBookmark initWithURL:fileProviderItem:].cold.1();
      if (v7)
        goto LABEL_20;
    }
    else
    {
LABEL_19:
      if (v7)
      {
LABEL_20:
        -[DOCItemBookmark setFileProviderItem:](v8, "setFileProviderItem:", v7);
        objc_msgSend(v7, "contentType");
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v22 = (void *)v21;
        -[DOCItemBookmark setContentType:](v8, "setContentType:", v21);

        v8->_needsToBeImported = 0;
        v23 = v8;

        goto LABEL_24;
      }
    }
    +[DOCItemBookmark _contentTypeForURL:](DOCItemBookmark, "_contentTypeForURL:", v6);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_24:

  return v8;
}

void __48__DOCItemBookmark_initWithURL_fileProviderItem___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)_contentTypeForURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  char v11;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDF8240], "typeWithFilenameExtension:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v11);

    v8 = (id *)MEMORY[0x24BDF8428];
    if (v11)
      v8 = (id *)MEMORY[0x24BDF8370];
    v5 = *v8;
  }
  v9 = v5;

  return v9;
}

+ (id)_wrapperForURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", a3, 0, a4);
}

+ (void)_fetchDocumentURLFromBookmarkableString:(id)a3 completion:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  FPDocumentURLFromBookmarkableString();

}

uint64_t __70__DOCItemBookmark__fetchDocumentURLFromBookmarkableString_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)prepareForMode:(unint64_t)a3 usingBookmark:(BOOL)a4 completionBlock:(id)a5
{
  -[DOCItemBookmark prepareForMode:usingBookmark:shouldConvert:conversionRules:completionBlock:](self, "prepareForMode:usingBookmark:shouldConvert:conversionRules:completionBlock:", a3, a4, 0, 0, a5);
}

- (void)prepareForMode:(unint64_t)a3 usingBookmark:(BOOL)a4 shouldConvert:(BOOL)a5 conversionRules:(id)a6 completionBlock:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSString *bookmarkableString;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(id, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t);
  void *v49;
  id v50;
  _QWORD v51[5];
  id v52;
  unint64_t v53;
  SEL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t);
  void *v63;
  id v64;
  _QWORD v65[3];

  v8 = a5;
  v9 = a4;
  v65[1] = *MEMORY[0x24BDAC8D0];
  v13 = a6;
  v14 = a7;
  -[DOCItemBookmark fileURL](self, "fileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v60 = MEMORY[0x24BDAC760];
    v61 = 3221225472;
    v62 = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke;
    v63 = &unk_24C0F06E8;
    v64 = v14;
    DOCRunInMainThread();

  }
  if (!v9)
  {
    v20 = self->_wrapper != 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Trying to prepare a DOCItem in mode %lu without using bookmark and with a nil _wrapper"), a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = DOCAssertWithIntenalBuildAlert(v20, 0, CFSTR("[INTERNAL BUILD] Elusive Bug Alert"), CFSTR("Trying to prepare a DOCItemBookmark with usingBookmark==NO and with a nil _wrapper.\n\n Please file a radar to DocumentManager | iOS and attach a sysdiagnose.\n\n We will now abort the action."), v21, 0);

    if ((v20 & 1) == 0)
    {
      v46 = MEMORY[0x24BDAC760];
      v47 = 3221225472;
      v48 = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_5;
      v49 = &unk_24C0F06E8;
      v50 = v14;
      DOCRunInMainThread();
      v19 = v50;
      goto LABEL_27;
    }
    -[FPSandboxingURLWrapper url](self->_wrapper, "url");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCItemBookmark setFileURL:](self, "setFileURL:", v22);

    if (a3 && !-[DOCItemBookmark needsToBeImported](self, "needsToBeImported"))
    {
      v42 = v14;
      DOCRunInMainThread();
      v19 = v42;
      goto LABEL_27;
    }
    -[DOCItemBookmark fileURL](self, "fileURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCItemBookmark.m"), 173, CFSTR("Trying to prepare a DOCItemBookmark in mode ImportCopy with a nil urls"));

    }
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_6;
    v44[3] = &unk_24C0F19E8;
    v44[4] = self;
    v24 = (void (**)(id, _QWORD))v14;
    v45 = v24;
    v25 = (void *)MEMORY[0x20BD0CEF0](v44);
    -[DOCItemBookmark fileURL](self, "fileURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v8)
    {
      v41 = v25;
      v28 = objc_msgSend(v26, "startAccessingSecurityScopedResource");

      -[DOCItemBookmark fileURL](self, "fileURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *MEMORY[0x24BDBCBE8];
      v65[0] = *MEMORY[0x24BDBCBE8];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      objc_msgSend(v29, "promisedItemResourceValuesForKeys:error:", v31, &v43);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v43;

      if (v28)
      {
        -[DOCItemBookmark fileURL](self, "fileURL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stopAccessingSecurityScopedResource");

      }
      objc_msgSend(v27, "valueForKey:", v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32 || !v35)
      {
        v24[2](v24, 0);

LABEL_26:
        v19 = v45;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x24BDF8240], "typeWithIdentifier:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allKeys");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "containsObject:", v36);

      -[DOCItemBookmark fileURL](self, "fileURL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v41;
      if (v38)
        -[DOCItemBookmark copyURLToInbox:completion:](self, "copyURLToInbox:completion:", v39, v41);
      else
        -[DOCItemBookmark convertAndCopyURLToInbox:ofType:conversionRules:completion:](self, "convertAndCopyURLToInbox:ofType:conversionRules:completion:", v39, v36, v13, v41);

    }
    else
    {
      -[DOCItemBookmark copyURLToInbox:completion:](self, "copyURLToInbox:completion:", v26, v25);
    }

    goto LABEL_26;
  }
  v16 = self->_bookmarkableString != 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Trying to prepare a DOCItem in mode %lu with a nil bookmarkableString"), a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = DOCAssertWithIntenalBuildAlert(v16, 0, CFSTR("[INTERNAL BUILD] Elusive Bug Alert"), CFSTR("Trying to prepare a DOCItemBookmark with usingBookmark==YES and with a nil bookmarkableString.\n\n Please file a radar to DocumentManager | iOS and attach a sysdiagnose.\n\n We will now abort the action."), v17, 0);

  if ((v16 & 1) != 0)
  {
    bookmarkableString = self->_bookmarkableString;
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3;
    v51[3] = &unk_24C0F1A10;
    v51[4] = self;
    v52 = v14;
    v53 = a3;
    v54 = a2;
    +[DOCItemBookmark _fetchDocumentURLFromBookmarkableString:completion:](DOCItemBookmark, "_fetchDocumentURLFromBookmarkableString:completion:", bookmarkableString, v51);
    v19 = v52;
  }
  else
  {
    v55 = MEMORY[0x24BDAC760];
    v56 = 3221225472;
    v57 = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_2;
    v58 = &unk_24C0F06E8;
    v59 = v14;
    DOCRunInMainThread();
    v19 = v59;
  }
LABEL_27:

}

uint64_t __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x24BE2DF90];
    v8 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_13;
    v27 = &unk_24C0F06E8;
    v28 = *(id *)(a1 + 40);
    DOCRunInMainThread();
    v15 = v28;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setFileURL:", v5);
    if (*(_QWORD *)(a1 + 48) && !objc_msgSend(*(id *)(a1 + 32), "needsToBeImported"))
    {
      v21 = *(id *)(a1 + 40);
      DOCRunInMainThread();
      v15 = v21;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("DOCItemBookmark.m"), 148, CFSTR("Trying to prepare a DOCItemBookmark in mode ImportCopy with a nil urls"));

      }
      v17 = *(void **)(a1 + 32);
      objc_msgSend(v17, "fileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_2_19;
      v22[3] = &unk_24C0F19E8;
      v19 = *(void **)(a1 + 40);
      v22[4] = *(_QWORD *)(a1 + 32);
      v23 = v19;
      objc_msgSend(v17, "copyURLToInbox:completion:", v18, v22);

      v15 = v23;
    }
  }

}

uint64_t __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_2_19(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setFileURL:", a2);
  v3 = *(id *)(a1 + 40);
  DOCRunInMainThread();

}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3_20(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);

}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);

}

uint64_t __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setFileURL:", a2);
  v3 = *(id *)(a1 + 40);
  DOCRunInMainThread();

}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);

}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);

}

- (void)convertAndCopyURLToInbox:(id)a3 ofType:(id)a4 conversionRules:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_get_global_queue(21, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke;
  v18[3] = &unk_24C0F1A88;
  v19 = v9;
  v20 = v11;
  v21 = v10;
  v22 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  v17 = v9;
  dispatch_async(v13, v18);

}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject **v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject **v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject **v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(_QWORD *, CFURLRef);
  void *v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  if (objc_msgSend(*(id *)(a1 + 32), "startAccessingSecurityScopedResource"))
  {
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__2;
    v59 = __Block_byref_object_dispose__2;
    v60 = 0;
    v2 = *(void **)(a1 + 48);
    v3 = *(void **)(a1 + 40);
    v4 = MEMORY[0x24BDAC760];
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_2;
    v52[3] = &unk_24C0F1A38;
    v53 = v2;
    v54 = &v55;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v52);
    if (v56[5])
    {
      objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v56[5], "preferredFilenameExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathExtension:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "ui_incomingDirectory:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByAppendingPathComponent:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v51 = 0;
      v11 = objc_alloc_init(MEMORY[0x24BDD1570]);
      v12 = *(_QWORD *)(a1 + 32);
      v47 = 0;
      v40 = v4;
      v41 = 3221225472;
      v42 = __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_29;
      v43 = &unk_24C0F1A60;
      v45 = &v48;
      v13 = v10;
      v44 = v13;
      v46 = &v55;
      objc_msgSend(v11, "coordinateReadingItemAtURL:options:error:byAccessor:", v12, 1, &v47, &v40);
      v14 = v47;
      objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource", v40, v41, v42, v43);
      if (*((_BYTE *)v49 + 24))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        objc_msgSend(v13, "ui_scheduleForCleanup");
      }
      else
      {
        v32 = (NSObject **)MEMORY[0x24BE2DF90];
        v33 = *MEMORY[0x24BE2DF90];
        if (!*MEMORY[0x24BE2DF90])
        {
          DOCInitLogging();
          v33 = *v32;
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_2((uint64_t)v14, v33, v34, v35, v36, v37, v38, v39);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }

      _Block_object_dispose(&v48, 8);
    }
    else
    {
      v24 = (NSObject **)MEMORY[0x24BE2DF90];
      v25 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        DOCInitLogging();
        v25 = *v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_1(a1 + 48, v25, v26, v27, v28, v29, v30, v31);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

    _Block_object_dispose(&v55, 8);
  }
  else
  {
    v15 = (NSObject **)MEMORY[0x24BE2DF90];
    v16 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v16 = *v15;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_3(v16, v17, v18, v19, v20, v21, v22, v23);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_29(_QWORD *a1, CFURLRef url)
{
  CGImageSourceRef v3;
  CGImageSource *v4;
  const __CFURL *v5;
  __CFString *v6;
  char v7;
  CGImageDestination *v8;

  v3 = CGImageSourceCreateWithURL(url, 0);
  if (v3)
  {
    v4 = v3;
    v5 = (const __CFURL *)a1[4];
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "identifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    v8 = CGImageDestinationCreateWithURL(v5, v6, 1uLL, 0);

    CGImageDestinationAddImageFromSource(v8, v4, 0, 0);
    CGImageDestinationFinalize(v8);
    CFRelease(v8);
    CFRelease(v4);
  }
  else
  {
    v7 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v7;
}

- (void)copyURLToInbox:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke;
  v10[3] = &unk_24C0F0908;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject **v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject **v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  id obj;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;

  if (objc_msgSend(*(id *)(a1 + 32), "startAccessingSecurityScopedResource"))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD1580]);
    v3 = objc_alloc_init(MEMORY[0x24BDD1570]);
    objc_msgSend(MEMORY[0x24BDBCF48], "ui_incomingDirectory:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0;
    v39[0] = &v38;
    v39[1] = 0x3032000000;
    v39[2] = __Block_byref_object_copy__2;
    v39[3] = __Block_byref_object_dispose__2;
    v40 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v7 = *(_QWORD *)(a1 + 32);
    obj = 0;
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke_2;
    v29 = &unk_24C0F1AB0;
    v8 = v2;
    v30 = v8;
    v31 = &v34;
    v32 = &v38;
    objc_msgSend(v3, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v7, 1, v6, 8, &obj, &v26);
    objc_storeStrong(&v40, obj);
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource", v26, v27, v28, v29);
    if (*((_BYTE *)v35 + 24))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_msgSend(v6, "ui_scheduleForCleanup");
    }
    else
    {
      v18 = (NSObject **)MEMORY[0x24BE2DF90];
      v19 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        DOCInitLogging();
        v19 = *v18;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke_cold_1((uint64_t)v39, v19, v20, v21, v22, v23, v24, v25);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);

  }
  else
  {
    v9 = (NSObject **)MEMORY[0x24BE2DF90];
    v10 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_3(v10, v11, v12, v13, v14, v15, v16, v17);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  char v10;
  id v11;
  NSObject **v12;
  NSObject *v13;
  id v14;
  id obj;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", v6, 0);
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v5, v6, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  objc_msgSend(v6, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDBCCB0], 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = 0;
    v10 = objc_msgSend(getQLThumbnailAdditionClass(), "associateThumbnailsForDocumentAtURL:withImmutableDocument:atURL:error:", v5, 0, v6, &v14);
    v11 = v14;
    if ((v10 & 1) == 0)
    {
      v12 = (NSObject **)MEMORY[0x24BE2DF90];
      v13 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        DOCInitLogging();
        v13 = *v12;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v17 = v5;
        v18 = 2112;
        v19 = v6;
        v20 = 2112;
        v21 = v11;
        _os_log_error_impl(&dword_209052000, v13, OS_LOG_TYPE_ERROR, "Failed to associate thumbnails for picked URL %@ with the Inbox copy %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    v11 = 0;
  }

}

- (id)coordinatedFileURL
{
  FPSandboxingURLWrapper *wrapper;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  wrapper = self->_wrapper;
  if (!wrapper)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCItemBookmark.m"), 324, CFSTR("Trying to prepare a coordinatedFileURL with a nil wrapper"));

    wrapper = self->_wrapper;
  }
  -[FPSandboxingURLWrapper url](wrapper, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  objc_msgSend(v4, "startAccessingSecurityScopedResource");
  v5 = objc_alloc_init(MEMORY[0x24BDD1570]);
  v12 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__DOCItemBookmark_coordinatedFileURL__block_invoke;
  v11[3] = &unk_24C0F1998;
  v11[4] = &v13;
  objc_msgSend(v5, "coordinateReadingItemAtURL:options:error:byAccessor:", v4, 0, &v12, v11);
  v6 = v12;
  objc_msgSend(v4, "stopAccessingSecurityScopedResource");
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __37__DOCItemBookmark_coordinatedFileURL__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)documentsURLsForItemBookmarks:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "fileURL", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCItemBookmark)initWithCoder:(id)a3
{
  id v4;
  DOCItemBookmark *v5;
  uint64_t v6;
  UTType *contentType;
  uint64_t v8;
  FPSandboxingURLWrapper *wrapper;
  uint64_t v10;
  FPItem *fileProviderItem;
  uint64_t v12;
  NSString *bookmarkableString;
  DOCItemBookmark *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DOCItemBookmark;
  v5 = -[DOCItemBookmark init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contentType"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentType = v5->_contentType;
    v5->_contentType = (UTType *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wrapper"));
    v8 = objc_claimAutoreleasedReturnValue();
    wrapper = v5->_wrapper;
    v5->_wrapper = (FPSandboxingURLWrapper *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fileProviderItem"));
    v10 = objc_claimAutoreleasedReturnValue();
    fileProviderItem = v5->_fileProviderItem;
    v5->_fileProviderItem = (FPItem *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bookmarkableString"));
    v12 = objc_claimAutoreleasedReturnValue();
    bookmarkableString = v5->_bookmarkableString;
    v5->_bookmarkableString = (NSString *)v12;

    -[DOCItemBookmark setNeedsToBeImported:](v5, "setNeedsToBeImported:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_needsToBeImported")));
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  FPSandboxingURLWrapper *wrapper;
  FPItem *fileProviderItem;
  NSString *bookmarkableString;
  id v8;

  v8 = a3;
  if (self->_contentType)
  {
    -[DOCItemBookmark contentType](self, "contentType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("_contentType"));

  }
  wrapper = self->_wrapper;
  if (wrapper)
    objc_msgSend(v8, "encodeObject:forKey:", wrapper, CFSTR("_wrapper"));
  fileProviderItem = self->_fileProviderItem;
  if (fileProviderItem)
    objc_msgSend(v8, "encodeObject:forKey:", fileProviderItem, CFSTR("_fileProviderItem"));
  bookmarkableString = self->_bookmarkableString;
  if (bookmarkableString)
    objc_msgSend(v8, "encodeObject:forKey:", bookmarkableString, CFSTR("_bookmarkableString"));
  objc_msgSend(v8, "encodeBool:forKey:", -[DOCItemBookmark needsToBeImported](self, "needsToBeImported"), CFSTR("_needsToBeImported"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)DOCItemBookmark;
  -[DOCItemBookmark description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ FPItem=%@"), v4, self->_fileProviderItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)needsToBeImported
{
  return self->_needsToBeImported;
}

- (void)setNeedsToBeImported:(BOOL)a3
{
  self->_needsToBeImported = a3;
}

+ (BOOL)isAnyItemBookmarkAFault:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "fileProviderItem", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isCloudItem"))
        {
          v8 = objc_msgSend(v7, "isDownloaded");

          if ((v8 & 1) == 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
LABEL_12:

  return v4;
}

+ (BOOL)isAnyFPItemAFault:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isCloudItem", (_QWORD)v9)
          && !objc_msgSend(v7, "isDownloaded"))
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bookmarkableString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBookmarkableString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (FPItem)fileProviderItem
{
  return (FPItem *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileProviderItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderItem, 0);
  objc_storeStrong((id *)&self->_bookmarkableString, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

- (void)initWithURL:fileProviderItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_209052000, v0, v1, "Failed to create FPSandboxingURLWrapper with URL: %@. %@");
  OUTLINED_FUNCTION_3();
}

- (void)initWithURL:fileProviderItem:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_209052000, v0, v1, "Failed to coordinate on bookmark item with URL: %@. %@");
  OUTLINED_FUNCTION_3();
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209052000, a2, a3, "Failed to create a url from bookmarkableString (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209052000, a2, a3, "Failed to find a conversion rule for type (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209052000, a2, a3, "Failed to convert the imported file into the local container (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_209052000, a1, a3, "can't acces security scoped url", a5, a6, a7, a8, 0);
}

void __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209052000, a2, a3, "Failed to copy the imported file into the local container (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
