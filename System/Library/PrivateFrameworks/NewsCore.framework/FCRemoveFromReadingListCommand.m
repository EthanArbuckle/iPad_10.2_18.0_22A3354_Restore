@implementation FCRemoveFromReadingListCommand

- (FCRemoveFromReadingListCommand)initWithEntryID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  FCRemoveFromReadingListCommand *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C95098];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", CFSTR("ReadingList"), *MEMORY[0x1E0C94730]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v5, v7);

  if (v8)
  {
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCRemoveRecordsCommand initWithRecordIDs:](self, "initWithRecordIDs:", v9);

  }
  else
  {
    v10 = -[FCRemoveRecordsCommand initWithRecordIDs:](self, "initWithRecordIDs:", MEMORY[0x1E0C9AA60]);
  }

  return v10;
}

- (FCRemoveFromReadingListCommand)initWithEntryIDs:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  FCRemoveFromReadingListCommand *v11;
  _QWORD v13[4];
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0C95098];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", CFSTR("ReadingList"), *MEMORY[0x1E0C94730]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__FCRemoveFromReadingListCommand_initWithEntryIDs___block_invoke;
  v13[3] = &unk_1E463C7F0;
  v14 = v7;
  v8 = v7;
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = -[FCRemoveRecordsCommand initWithRecordIDs:](self, "initWithRecordIDs:", v10);

  return v11;
}

id __51__FCRemoveFromReadingListCommand_initWithEntryIDs___block_invoke(uint64_t a1, void *a2)
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
