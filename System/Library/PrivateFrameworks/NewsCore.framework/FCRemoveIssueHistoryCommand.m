@implementation FCRemoveIssueHistoryCommand

- (FCRemoveIssueHistoryCommand)initWithIssueHistoryItemIDs:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  FCRemoveIssueHistoryCommand *v10;
  FCRemoveIssueHistoryCommand *v11;
  objc_super v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0C95098];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", CFSTR("IssueReadingHistory"), *MEMORY[0x1E0C94730]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__FCRemoveIssueHistoryCommand_initWithIssueHistoryItemIDs___block_invoke;
  v15[3] = &unk_1E463C7F0;
  v8 = v7;
  v16 = v8;
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)FCRemoveIssueHistoryCommand;
    v10 = -[FCRemoveRecordsCommand initWithRecordIDs:](&v14, sel_initWithRecordIDs_, v9);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)FCRemoveIssueHistoryCommand;
    v10 = -[FCRemoveRecordsCommand initWithRecordIDs:](&v13, sel_initWithRecordIDs_, MEMORY[0x1E0C9AA60]);
  }
  v11 = v10;

  return v11;
}

id __59__FCRemoveIssueHistoryCommand_initWithIssueHistoryItemIDs___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C95070];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRecordName:zoneID:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

@end
