@implementation IMDChatRecordBatchFetcher

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
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1ABC4D3AC;
  v24 = sub_1ABC4D3BC;
  v25 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("rowID"), 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %lld"), CFSTR("rowID"), -[IMDRecordBatchFetcher lastRowID](self, "lastRowID"));
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
    v27[0] = v6;
    -[IMDRecordBatchFetcher predicate](self, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1ABC4D3C4;
  v19[3] = &unk_1E5AB0468;
  v19[4] = &v20;
  objc_msgSend(v13, "fetchChatRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v12, v14, a3, v19);

  if (objc_msgSend((id)v21[5], "count"))
  {
    objc_msgSend((id)v21[5], "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDRecordBatchFetcher setLastRowID:](self, "setLastRowID:", objc_msgSend(v15, "rowID"));

  }
  v16 = (void *)v21[5];
  if (!v16)
    v16 = (void *)MEMORY[0x1E0C9AA60];
  v17 = v16;

  _Block_object_dispose(&v20, 8);
  return v17;
}

@end
