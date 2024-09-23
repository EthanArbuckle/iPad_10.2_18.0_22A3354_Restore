@implementation _MFOfflineCacheOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  return 1;
}

- (BOOL)databaseID:(id *)a3 andMailbox:(id *)a4 forMessageWithRemoteID:(id)a5 connection:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__16;
  v28 = __Block_byref_object_dispose__16;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  v23 = 0;
  objc_msgSend(v10, "preparedStatementForQueryString:", CFSTR("SELECT ROWID, mailbox FROM messages WHERE remote_id = ? LIMIT 1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84___MFOfflineCacheOperation_databaseID_andMailbox_forMessageWithRemoteID_connection___block_invoke;
  v17[3] = &unk_1E4E8ABE8;
  v17[4] = &v24;
  v17[5] = &v18;
  v13 = objc_msgSend(v11, "executeWithIndexedBindings:usingBlock:error:", v12, v17, &v16);
  v14 = v16;

  if ((v13 & 1) == 0)
    objc_msgSend(v10, "handleError:message:", v14, CFSTR("Fetching database ID and mailbox for message"));
  if (a3)
    *a3 = objc_retainAutorelease((id)v25[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

@end
