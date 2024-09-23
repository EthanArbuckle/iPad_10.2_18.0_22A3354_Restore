@implementation CKContextContentProvider

- (void)extractUsingExecutor:(id)a3
{
  -[CKContextContentProvider extractUsingExecutor:withOptions:](self, "extractUsingExecutor:withOptions:", a3, 0);
}

- (double)timeout
{
  return 0.0;
}

+ (unsigned)controlCodeForExecutor:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  objc_msgSend(a3, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CKContextContentProviderManager controlCodeForNonce:](CKContextContentProviderManager, "controlCodeForNonce:", objc_msgSend(v3, "nonce"));

  return v4;
}

+ (id)handlePDFView:(id)a3 withExecutor:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "currentSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v4, "currentPage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

+ (void)extractContentFromWebViewPDFData:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = dispatch_queue_create("CKContextContentProviderUIScene WebView PDF Queue", 0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__CKContextContentProvider_extractContentFromWebViewPDFData_withCompletionHandler___block_invoke;
    v9[3] = &unk_1E6243408;
    v10 = v5;
    v11 = v7;
    dispatch_async(v8, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __83__CKContextContentProvider_extractContentFromWebViewPDFData_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "The web view is displaying an encrypted PDF.", (uint8_t *)v14, 2u);
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v2 = (void *)getPDFDocumentClass_softClass;
  v18 = getPDFDocumentClass_softClass;
  if (!getPDFDocumentClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getPDFDocumentClass_block_invoke;
    v14[3] = &unk_1E6243378;
    v14[4] = &v15;
    __getPDFDocumentClass_block_invoke((uint64_t)v14);
    v2 = (void *)v16[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v15, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v5 = objc_msgSend(v4, "pageCount");
  if (v5 >= 2)
    v6 = 2;
  else
    v6 = v5;
  if (v6)
  {
    v7 = 0;
    v8 = &stru_1E6243B40;
    do
    {
      objc_msgSend(v4, "pageAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "string");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (const __CFString *)v10;
      else
        v12 = &stru_1E6243B40;
      -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stringByAppendingString:", CFSTR("\n\n"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    v8 = &stru_1E6243B40;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
