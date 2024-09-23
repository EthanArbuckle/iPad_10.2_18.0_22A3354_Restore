@implementation _MFDADeferredDeleteMessageOperation

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___MFDADeferredDeleteMessageOperation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_207 != -1)
    dispatch_once(&log_onceToken_207, block);
  return (id)log_log_206;
}

- (_MFDADeferredDeleteMessageOperation)initWithCoder:(id)a3
{
  id v4;
  _MFDADeferredDeleteMessageOperation *v5;
  uint64_t v6;
  NSString *messageID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFDADeferredDeleteMessageOperation;
  v5 = -[_MFDADeferredDeleteMessageOperation init](&v9, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
      __assert_rtn("-[_MFDADeferredDeleteMessageOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 472, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MessageID"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageID = v5->_messageID;
    v5->_messageID = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[_MFDADeferredDeleteMessageOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 480, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\");
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageID, CFSTR("MessageID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  id v4;
  uint64_t *p_messageID;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = 0;
  p_messageID = (uint64_t *)&self->_messageID;
  LODWORD(v6) = -[_MFOfflineCacheOperation databaseID:andMailbox:forMessageWithRemoteID:connection:](self, "databaseID:andMailbox:forMessageWithRemoteID:connection:", &v21, &v20, self->_messageID, v4);
  v7 = v21;
  v8 = v20;
  if (v8)
  {
    if ((_DWORD)v6)
    {
      objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("INSERT INTO local_message_actions (action_type, mailbox, source_mailbox, destination_mailbox, user_initiated) VALUES (5, ?, ?, NULL, 0)"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      v23[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v11 = objc_msgSend(v9, "executeWithIndexedBindings:usingBlock:error:", v10, 0, &v19);
      v12 = v19;

      if (v11)
      {
        v6 = objc_msgSend(v4, "lastInsertedDatabaseID");

        if (!v6)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
        objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("INSERT INTO action_messages (action, message, remote_id, destination_message, action_phase) VALUES (?, ?, ?, NULL, 4)"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v13;
        v22[1] = v7;
        v22[2] = *p_messageID;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v12;
        LOBYTE(v6) = objc_msgSend(v9, "executeWithIndexedBindings:usingBlock:error:", v14, 0, &v18);
        v15 = v18;

        if ((v6 & 1) == 0)
          objc_msgSend(v4, "handleError:message:", v15, CFSTR("Inserting message for delete"));
        v12 = v15;
      }
      else
      {
        objc_msgSend(v4, "handleError:message:", v12, CFSTR("Inserting delete action"));
        LOBYTE(v6) = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    +[_MFDADeferredDeleteMessageOperation log](_MFDADeferredDeleteMessageOperation, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_MFDADeferredSetFlagsOperation translateToLocalActionWithConnection:].cold.1(p_messageID, v12, v16);
  }
LABEL_13:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_MFDADeferredDeleteMessageOperation;
  -[_MFDADeferredDeleteMessageOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ message-id \"%@\"), v4, self->_messageID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
