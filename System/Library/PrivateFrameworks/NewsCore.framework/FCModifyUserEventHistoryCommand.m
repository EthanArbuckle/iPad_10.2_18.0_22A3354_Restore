@implementation FCModifyUserEventHistoryCommand

- (id)ckRecordWithSessionID:(id)a3 data:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = qword_1ED0F8810;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&qword_1ED0F8810, &__block_literal_global_166);
  v8 = objc_alloc(MEMORY[0x1E0C95070]);
  v9 = (void *)objc_msgSend(v8, "initWithRecordName:zoneID:", v7, _MergedGlobals_212);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("UserEventHistorySession"), v9);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("sessionData"));

  return v10;
}

void __62__FCModifyUserEventHistoryCommand_ckRecordWithSessionID_data___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("UserEventHistory"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_212;
  _MergedGlobals_212 = v1;

}

- (FCModifyUserEventHistoryCommand)initWithSessionID:(id)a3 data:(id)a4
{
  void *v5;
  void *v6;
  FCModifyUserEventHistoryCommand *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[FCModifyUserEventHistoryCommand ckRecordWithSessionID:data:](self, "ckRecordWithSessionID:data:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)FCModifyUserEventHistoryCommand;
  v7 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](&v9, sel_initWithLocalRecords_merge_, v6, 0);

  return v7;
}

- (FCModifyUserEventHistoryCommand)initWithSessions:(id)a3
{
  FCModifyUserEventHistoryCommand *v4;
  void *v5;
  FCModifyUserEventHistoryCommand *v6;
  objc_super v8;
  _QWORD v9[4];
  FCModifyUserEventHistoryCommand *v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__FCModifyUserEventHistoryCommand_initWithSessions___block_invoke;
  v9[3] = &unk_1E4649728;
  v4 = self;
  v10 = v4;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = v4;
  v8.super_class = (Class)FCModifyUserEventHistoryCommand;
  v6 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](&v8, sel_initWithLocalRecords_merge_, v5, 0);

  return v6;
}

id __52__FCModifyUserEventHistoryCommand_initWithSessions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compressedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "ckRecordWithSessionID:data:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v7 = (objc_class *)MEMORY[0x1E0CB3940];
    v8 = a4;
    v9 = a3;
    v10 = (void *)objc_msgSend([v7 alloc], "initWithFormat:", CFSTR("FCModifyUserEventHistoryCommand Asked to merge local and remote records Local Record: %@, Remote Record: %@"), v9, v8);

    *(_DWORD *)buf = 136315906;
    v12 = "-[FCModifyUserEventHistoryCommand mergeLocalRecord:withRemoteRecord:]";
    v13 = 2080;
    v14 = "FCModifyUserEventHistoryCommand.m";
    v15 = 1024;
    v16 = 45;
    v17 = 2114;
    v18 = v10;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: UnexpectedUserEventHistoryMerge) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return 0;
}

@end
