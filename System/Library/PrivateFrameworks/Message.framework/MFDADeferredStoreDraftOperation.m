@implementation MFDADeferredStoreDraftOperation

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MFDADeferredStoreDraftOperation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_270 != -1)
    dispatch_once(&log_onceToken_270, block);
  return (id)log_log_269;
}

void __38__MFDADeferredStoreDraftOperation_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_269;
  log_log_269 = (uint64_t)v1;

}

- (MFDADeferredStoreDraftOperation)initWithMessageIDHeader:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  MFDADeferredStoreDraftOperation *v8;
  uint64_t v9;
  NSString *messageIDHeader;
  uint64_t v11;
  NSString *folderID;
  MFDADeferredStoreDraftOperation *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFDADeferredStoreDraftOperation;
  v8 = -[MFDADeferredStoreDraftOperation init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    messageIDHeader = v8->_messageIDHeader;
    v8->_messageIDHeader = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    folderID = v8->_folderID;
    v8->_folderID = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (MFDADeferredStoreDraftOperation)initWithCoder:(id)a3
{
  id v4;
  MFDADeferredStoreDraftOperation *v5;
  uint64_t v6;
  NSString *messageIDHeader;
  uint64_t v8;
  NSString *folderID;
  MFDADeferredStoreDraftOperation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFDADeferredStoreDraftOperation;
  v5 = -[MFDADeferredStoreDraftOperation init](&v12, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
      __assert_rtn("-[MFDADeferredStoreDraftOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 684, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MessageID"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageIDHeader = v5->_messageIDHeader;
    v5->_messageIDHeader = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FolderID"));
    v8 = objc_claimAutoreleasedReturnValue();
    folderID = v5->_folderID;
    v5->_folderID = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[MFDADeferredStoreDraftOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 693, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\");
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageIDHeader, CFSTR("MessageID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_folderID, CFSTR("FolderID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__16;
  v33 = __Block_byref_object_dispose__16;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__16;
  v27 = __Block_byref_object_dispose__16;
  v28 = 0;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT ROWID, mailbox FROM messages JOIN WHERE message_id = ? LIMIT 1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", MFStringHashForMessageIDHeader());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__MFDADeferredStoreDraftOperation_translateToLocalActionWithConnection___block_invoke;
  v22[3] = &unk_1E4E8ABE8;
  v22[4] = &v29;
  v22[5] = &v23;
  v7 = objc_msgSend(v4, "executeWithIndexedBindings:usingBlock:error:", v6, v22, &v21);
  v8 = v21;

  if ((v7 & 1) != 0)
  {
    if (v24[5])
    {
      objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT INTO local_message_actions (action_type, mailbox, source_mailbox, destination_mailbox, user_initiated) VALUES (2, ?, NULL, ?, 0)"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v24[5];
      v36[1] = v36[0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v8;
      v11 = objc_msgSend(v9, "executeWithIndexedBindings:usingBlock:error:", v10, 0, &v20);
      v12 = v20;

      if (!v11)
      {
        objc_msgSend(v3, "handleError:message:", v12, CFSTR("Inserting append action"));
        v14 = 0;
LABEL_10:

        v8 = v12;
        goto LABEL_11;
      }
      v13 = objc_msgSend(v3, "lastInsertedDatabaseID");

      v8 = v12;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT INTO action_messages (action, message, remote_id, destination_message, action_phase) VALUES (?, NULL, NULL, ?, 3)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v30[5];
    v35[0] = v15;
    v35[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
    v14 = objc_msgSend(v9, "executeWithIndexedBindings:usingBlock:error:", v17, 0, &v19);
    v12 = v19;

    if ((v14 & 1) == 0)
      objc_msgSend(v3, "handleError:message:", v12, CFSTR("Inserting message for append"));
    goto LABEL_10;
  }
  objc_msgSend(v3, "handleError:message:", v8, CFSTR("Selecting message for append"));
  v14 = 0;
LABEL_11:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __72__MFDADeferredStoreDraftOperation_translateToLocalActionWithConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberValue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  *a4 = 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MFDADeferredStoreDraftOperation;
  -[MFDADeferredStoreDraftOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ message-id \"%@\"), v4, self->_messageIDHeader);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_messageIDHeader, 0);
}

@end
