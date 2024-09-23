@implementation SSReadingList

+ (BOOL)supportsURL:(NSURL *)URL
{
  return -[NSURL safari_isHTTPFamilyURL](URL, "safari_isHTTPFamilyURL");
}

+ (SSReadingList)defaultReadingList
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSReadingList_defaultReadingList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SSReadingList defaultReadingList]::onceToken != -1)
    dispatch_once(&+[SSReadingList defaultReadingList]::onceToken, block);
  return (SSReadingList *)(id)+[SSReadingList defaultReadingList]::ssReadingList;
}

void __35__SSReadingList_defaultReadingList__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)+[SSReadingList defaultReadingList]::ssReadingList;
  +[SSReadingList defaultReadingList]::ssReadingList = v1;

}

- (SSReadingList)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Misuse of SSReadingList interface. Use class method defaultReadingList."));

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSReadingList;
  return -[SSReadingList init](&v3, sel_init);
}

- (BOOL)addReadingListItemWithURL:(NSURL *)URL title:(NSString *)title previewText:(NSString *)previewText error:(NSError *)error
{
  NSURL *v10;
  NSString *v11;
  NSString *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t v33[16];

  v10 = URL;
  v11 = title;
  v12 = previewText;
  v13 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1A3B2D000, v13, OS_LOG_TYPE_DEFAULT, "#Client: Adding item to Reading List", v33, 2u);
  }
  v14 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    if (v10)
      goto LABEL_5;
LABEL_11:
    v24 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SSReadingList addReadingListItemWithURL:title:previewText:error:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot add a Reading List item with nil URL."));
    goto LABEL_14;
  }
  -[SSReadingList addReadingListItemWithURL:title:previewText:error:].cold.3((uint64_t)v11, (uint64_t)v10, v14);
  if (!v10)
    goto LABEL_11;
LABEL_5:
  if (!+[SSReadingList supportsURL:](SSReadingList, "supportsURL:", v10))
  {
    v16 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[SSReadingList addReadingListItemWithURL:title:previewText:error:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
      if (error)
        goto LABEL_9;
    }
    else if (error)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSReadingListErrorDomain"), 1, 0);
      v15 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  v15 = -[SSReadingList _addReadingListItemWithURL:title:previewText:](self, "_addReadingListItemWithURL:title:previewText:", v10, v11, v12);
LABEL_15:

  return v15;
}

- (BOOL)_addReadingListItemWithURL:(id)a3 title:(id)a4 previewText:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  const char **v18;
  void *v19;
  const char **v20;
  void *v21;
  const char **v22;
  void *v23;
  WebBookmarksXPCConnection *connection;
  _QWORD *v25;
  void *v26;
  void *v27;
  const char **v28;
  void *v29;
  void *v30;
  objc_class *v31;
  id v32;
  BOOL result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SSReadingList _setUpConnectionIfNeeded](self, "_setUpConnectionIfNeeded");
  v11 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v8, "safari_userVisibleString");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend(v12, "UTF8String");

  if (v9)
  {
    objc_msgSend(getWebBookmarkClass(), "_trimmedTitle:", v9);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");

    if (v10)
    {
LABEL_3:
      objc_msgSend(getWebBookmarkClass(), "_trimmedPreviewText:", v10);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (const char *)objc_msgSend(v16, "UTF8String");

      goto LABEL_6;
    }
  }
  else
  {
    v15 = "";
    if (v10)
      goto LABEL_3;
  }
  v17 = "";
LABEL_6:
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2020000000;
  v18 = (const char **)getkWebBookmarksAddressKeySymbolLoc(void)::ptr;
  v37 = (void *)getkWebBookmarksAddressKeySymbolLoc(void)::ptr;
  if (!getkWebBookmarksAddressKeySymbolLoc(void)::ptr)
  {
    v19 = (void *)WebBookmarksLibrary();
    v18 = (const char **)dlsym(v19, "kWebBookmarksAddressKey");
    *(_QWORD *)(v35 + 24) = v18;
    getkWebBookmarksAddressKeySymbolLoc(void)::ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v34, 8);
  if (!v18)
    goto LABEL_24;
  xpc_dictionary_set_string(v11, *v18, v13);
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2020000000;
  v20 = (const char **)getkWebBookmarksTitleKeySymbolLoc(void)::ptr;
  v37 = (void *)getkWebBookmarksTitleKeySymbolLoc(void)::ptr;
  if (!getkWebBookmarksTitleKeySymbolLoc(void)::ptr)
  {
    v21 = (void *)WebBookmarksLibrary();
    v20 = (const char **)dlsym(v21, "kWebBookmarksTitleKey");
    *(_QWORD *)(v35 + 24) = v20;
    getkWebBookmarksTitleKeySymbolLoc(void)::ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v34, 8);
  if (!v20)
    goto LABEL_24;
  xpc_dictionary_set_string(v11, *v20, v15);
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2020000000;
  v22 = (const char **)getkWebBookmarksPreviewTextKeySymbolLoc(void)::ptr;
  v37 = (void *)getkWebBookmarksPreviewTextKeySymbolLoc(void)::ptr;
  if (!getkWebBookmarksPreviewTextKeySymbolLoc(void)::ptr)
  {
    v23 = (void *)WebBookmarksLibrary();
    v22 = (const char **)dlsym(v23, "kWebBookmarksPreviewTextKey");
    *(_QWORD *)(v35 + 24) = v22;
    getkWebBookmarksPreviewTextKeySymbolLoc(void)::ptr = (uint64_t)v22;
  }
  _Block_object_dispose(&v34, 8);
  if (!v22)
    goto LABEL_24;
  xpc_dictionary_set_string(v11, *v22, v17);
  connection = self->_connection;
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2020000000;
  v25 = (_QWORD *)getkWebBookmarksAddToReadingListMessageNameSymbolLoc(void)::ptr;
  v37 = (void *)getkWebBookmarksAddToReadingListMessageNameSymbolLoc(void)::ptr;
  if (!getkWebBookmarksAddToReadingListMessageNameSymbolLoc(void)::ptr)
  {
    v26 = (void *)WebBookmarksLibrary();
    v25 = dlsym(v26, "kWebBookmarksAddToReadingListMessageName");
    *(_QWORD *)(v35 + 24) = v25;
    getkWebBookmarksAddToReadingListMessageNameSymbolLoc(void)::ptr = (uint64_t)v25;
  }
  _Block_object_dispose(&v34, 8);
  if (!v25)
    goto LABEL_24;
  -[WebBookmarksXPCConnection messageWithName:](connection, "messageWithName:", *v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2020000000;
  v28 = (const char **)getkWebBookmarksItemKeySymbolLoc(void)::ptr;
  v37 = (void *)getkWebBookmarksItemKeySymbolLoc(void)::ptr;
  if (!getkWebBookmarksItemKeySymbolLoc(void)::ptr)
  {
    v29 = (void *)WebBookmarksLibrary();
    v28 = (const char **)dlsym(v29, "kWebBookmarksItemKey");
    *(_QWORD *)(v35 + 24) = v28;
    getkWebBookmarksItemKeySymbolLoc(void)::ptr = (uint64_t)v28;
  }
  _Block_object_dispose(&v34, 8);
  if (v28)
  {
    xpc_dictionary_set_value(v27, *v28, v11);
    -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v27);
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v30 = (void *)getSafariFetcherServerProxyClass(void)::softClass;
    v42 = getSafariFetcherServerProxyClass(void)::softClass;
    if (!getSafariFetcherServerProxyClass(void)::softClass)
    {
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = (uint64_t)___ZL32getSafariFetcherServerProxyClassv_block_invoke;
      v37 = &unk_1E4ABFDC0;
      v38 = &v39;
      ___ZL32getSafariFetcherServerProxyClassv_block_invoke((uint64_t)&v34);
      v30 = (void *)v40[3];
    }
    v31 = objc_retainAutorelease(v30);
    _Block_object_dispose(&v39, 8);
    v32 = objc_alloc_init(v31);
    objc_msgSend(v32, "startReadingListFetcher");

    return 1;
  }
  else
  {
LABEL_24:
    dlerror();
    result = abort_report_np();
    __break(1u);
  }
  return result;
}

- (void)_setUpConnectionIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  objc_class *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  WebBookmarksXPCConnection *v14;
  WebBookmarksXPCConnection *connection;
  _Unwind_Exception *v16;
  uint8_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  if (!self->_connection)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v9 = (void *)getWebBookmarksXPCConnectionClass(void)::softClass;
    v26 = getWebBookmarksXPCConnectionClass(void)::softClass;
    if (!getWebBookmarksXPCConnectionClass(void)::softClass)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = (uint64_t)___ZL33getWebBookmarksXPCConnectionClassv_block_invoke;
      v21 = &unk_1E4ABFDC0;
      v22 = &v23;
      ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke((uint64_t)&v18, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v17);
      v9 = (void *)v24[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v23, 8);
    v11 = [v10 alloc];
    v18 = 0;
    v19 = (uint64_t)&v18;
    v20 = 0x2020000000;
    v12 = (_QWORD *)getkWebBookmarksdServiceNameSymbolLoc(void)::ptr;
    v21 = (void *)getkWebBookmarksdServiceNameSymbolLoc(void)::ptr;
    if (!getkWebBookmarksdServiceNameSymbolLoc(void)::ptr)
    {
      v13 = (void *)WebBookmarksLibrary();
      v12 = dlsym(v13, "kWebBookmarksdServiceName");
      *(_QWORD *)(v19 + 24) = v12;
      getkWebBookmarksdServiceNameSymbolLoc(void)::ptr = (uint64_t)v12;
    }
    _Block_object_dispose(&v18, 8);
    if (!v12)
    {
      v16 = (_Unwind_Exception *)-[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:].cold.1();
      _Block_object_dispose(&v23, 8);
      _Unwind_Resume(v16);
    }
    v14 = (WebBookmarksXPCConnection *)objc_msgSend(v11, "initClientForMachService:", *v12);
    connection = self->_connection;
    self->_connection = v14;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)addReadingListItemWithURL:(uint64_t)a3 title:(uint64_t)a4 previewText:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to add item to Reading List because the URL was nil", a5, a6, a7, a8, 0);
}

- (void)addReadingListItemWithURL:(uint64_t)a3 title:(uint64_t)a4 previewText:(uint64_t)a5 error:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Cannot create a Reading List item: URLs must begin with http or https", a5, a6, a7, a8, 0);
}

- (void)addReadingListItemWithURL:(os_log_t)log title:previewText:error:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138478083;
  v4 = a1;
  v5 = 2113;
  v6 = a2;
  _os_log_debug_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_DEBUG, "#Client Title: %{private}@, URL: %{private}@", (uint8_t *)&v3, 0x16u);
}

@end
