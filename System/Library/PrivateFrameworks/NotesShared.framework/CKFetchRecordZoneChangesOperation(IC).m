@implementation CKFetchRecordZoneChangesOperation(IC)

- (id)ic_loggingValues
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&off_1EF55D9D0;
  objc_msgSendSuper2(&v9, sel_ic_loggingValues);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(a1, "configurationsByRecordZoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CKFetchRecordZoneChangesOperation_IC__ic_loggingValues__block_invoke;
  v7[3] = &unk_1E76CAE80;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)ic_shortLoggingDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "operationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)ic_removeAllCompletionBlocks
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EF55D9D0;
  objc_msgSendSuper2(&v3, sel_ic_removeAllCompletionBlocks);
  objc_msgSend(a1, "setRecordWasChangedBlock:", 0);
  objc_msgSend(a1, "setRecordWithIDWasDeletedBlock:", 0);
  objc_msgSend(a1, "setFetchRecordZoneChangesCompletionBlock:", 0);
  objc_msgSend(a1, "setRecordZoneFetchCompletionBlock:", 0);
  return objc_msgSend(a1, "setRecordZoneChangeTokensUpdatedBlock:", 0);
}

@end
