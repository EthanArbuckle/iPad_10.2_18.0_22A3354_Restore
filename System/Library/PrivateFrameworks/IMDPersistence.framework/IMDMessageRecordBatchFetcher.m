@implementation IMDMessageRecordBatchFetcher

- (IMDMessageRecordBatchFetcher)initWithAssociatedChatGUID:(id)a3 sortAscending:(BOOL)a4
{
  id v7;
  IMDMessageRecordBatchFetcher *v8;
  IMDMessageRecordBatchFetcher *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMDMessageRecordBatchFetcher;
  v8 = -[IMDRecordBatchFetcher init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_associatedChatGUID, a3);
    v9->_sortAscending = a4;
  }

  return v9;
}

- (IMDMessageRecordBatchFetcher)initWithAssociatedChatGUID:(id)a3
{
  return -[IMDMessageRecordBatchFetcher initWithAssociatedChatGUID:sortAscending:](self, "initWithAssociatedChatGUID:sortAscending:", a3, 1);
}

- (IMDMessageRecordBatchFetcher)init
{
  return (IMDMessageRecordBatchFetcher *)MEMORY[0x1E0DE7D20](self, sel_initWithAssociatedChatGUID_);
}

- (id)_rowIDPredicate
{
  _BOOL4 v3;
  void *v4;
  int64_t v5;
  const __CFString *v6;

  v3 = -[IMDMessageRecordBatchFetcher sortAscending](self, "sortAscending");
  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = -[IMDRecordBatchFetcher lastRowID](self, "lastRowID");
  if (v3)
    v6 = CFSTR("%K > %lld");
  else
    v6 = CFSTR("%K < %lld");
  objc_msgSend(v4, "predicateWithFormat:", v6, CFSTR("rowID"), v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)nextBatchWithSize:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1ABB70E64;
  v28 = sub_1ABB70E74;
  v29 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("rowID"), -[IMDMessageRecordBatchFetcher sortAscending](self, "sortAscending"));
  -[IMDMessageRecordBatchFetcher _rowIDPredicate](self, "_rowIDPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRecordBatchFetcher predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    v12 = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3528];
    v32[0] = v6;
    -[IMDRecordBatchFetcher predicate](self, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[IMDMessageRecordBatchFetcher associatedChatGUID](self, "associatedChatGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase");
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDMessageRecordBatchFetcher associatedChatGUID](self, "associatedChatGUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1ABB70E7C;
    v23[3] = &unk_1E5AB0468;
    v23[4] = &v24;
    objc_msgSend(v14, "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v15, v12, v16, a3, v23);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[IMDMessageRecordBatchFetcher parentedOnly](self, "parentedOnly");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1ABB70E8C;
    v22[3] = &unk_1E5AB0468;
    v22[4] = &v24;
    objc_msgSend(v14, "fetchMessageRecordsFilteredUsingPredicate:sortedUsingDescriptors:parentedOnly:limit:completionHandler:", v12, v15, v17, a3, v22);
  }

  if (objc_msgSend((id)v25[5], "count"))
  {
    objc_msgSend((id)v25[5], "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDRecordBatchFetcher setLastRowID:](self, "setLastRowID:", objc_msgSend(v18, "rowID"));

  }
  v19 = (void *)v25[5];
  if (!v19)
    v19 = (void *)MEMORY[0x1E0C9AA60];
  v20 = v19;

  _Block_object_dispose(&v24, 8);
  return v20;
}

- (NSString)associatedChatGUID
{
  return self->_associatedChatGUID;
}

- (BOOL)sortAscending
{
  return self->_sortAscending;
}

- (BOOL)parentedOnly
{
  return self->_parentedOnly;
}

- (void)setParentedOnly:(BOOL)a3
{
  self->_parentedOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedChatGUID, 0);
}

@end
