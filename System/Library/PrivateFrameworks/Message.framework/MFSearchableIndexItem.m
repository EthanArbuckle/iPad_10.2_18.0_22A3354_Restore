@implementation MFSearchableIndexItem

void __32__MFSearchableIndexItem_iOS_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_29;
  log_log_29 = (uint64_t)v1;

}

MFSearchableIndexItem_iOS *__67__MFSearchableIndexItem_iOS_searchableIndexItemsFromMessages_type___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  MFSearchableIndexItem_iOS *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_bodyDataForMessage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EDSearchableIndexItem initWithMessage:bodyData:fetchBody:]([MFSearchableIndexItem_iOS alloc], "initWithMessage:bodyData:fetchBody:", v3, v4, 1);
  -[EDSearchableIndexItem setIndexingType:](v5, "setIndexingType:", *(_QWORD *)(a1 + 40));

  return v5;
}

void __54__MFSearchableIndexItem_iOS_fetchIndexableAttachments__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v9, v8);

}

id __54__MFSearchableIndexItem_iOS_fetchIndexableAttachments__block_invoke_2()
{
  objc_msgSend(MEMORY[0x1E0D1EEC0], "nullFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
