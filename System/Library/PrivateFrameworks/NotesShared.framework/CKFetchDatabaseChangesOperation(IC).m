@implementation CKFetchDatabaseChangesOperation(IC)

- (id)ic_loggingValues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&off_1EF55E968;
  objc_msgSendSuper2(&v9, sel_ic_loggingValues);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(a1, "previousServerChangeToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "previousServerChangeToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(none)");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("serverChangeToken"));

  return v3;
}

- (uint64_t)ic_removeAllCompletionBlocks
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EF55E968;
  objc_msgSendSuper2(&v3, sel_ic_removeAllCompletionBlocks);
  objc_msgSend(a1, "setRecordZoneWithIDChangedBlock:", 0);
  objc_msgSend(a1, "setRecordZoneWithIDWasDeletedBlock:", 0);
  return objc_msgSend(a1, "setFetchDatabaseChangesCompletionBlock:", 0);
}

@end
