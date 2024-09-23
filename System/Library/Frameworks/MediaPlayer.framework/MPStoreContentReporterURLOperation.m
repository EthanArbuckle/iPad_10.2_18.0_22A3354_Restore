@implementation MPStoreContentReporterURLOperation

void __MPStoreContentReporterURLOperation_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v4, "ic_URLByAppendingQueryParameters:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v5);
  v8 = v7;
  if (*(_BYTE *)(a1 + 56))
    v9 = CFSTR("GET");
  else
    v9 = CFSTR("POST");
  objc_msgSend(v7, "setHTTPMethod:", v9);
  v10 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithIdentity:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0A8]), "initWithURLRequest:requestContext:", v8, v12);
  objc_msgSend(MEMORY[0x1E0DDC0F0], "defaultSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __MPStoreContentReporterURLOperation_block_invoke_2;
  v17[3] = &unk_1E3162038;
  v15 = *(id *)(a1 + 48);
  v18 = v3;
  v19 = v15;
  v16 = v3;
  objc_msgSend(v14, "enqueueDataRequest:withCompletionHandler:", v13, v17);

}

void __MPStoreContentReporterURLOperation_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "parsedBodyDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

@end
