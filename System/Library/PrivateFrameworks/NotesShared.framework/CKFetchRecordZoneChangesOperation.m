@implementation CKFetchRecordZoneChangesOperation

void __57__CKFetchRecordZoneChangesOperation_IC__ic_loggingValues__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(v5, "previousServerChangeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "previousServerChangeToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(none)");
  }
  objc_msgSend(v12, "ic_loggingDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v11 = v9;
  else
    v11 = CFSTR("(none)");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v10);

}

@end
