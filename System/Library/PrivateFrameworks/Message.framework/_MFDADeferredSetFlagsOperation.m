@implementation _MFDADeferredSetFlagsOperation

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___MFDADeferredSetFlagsOperation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_164 != -1)
    dispatch_once(&log_onceToken_164, block);
  return (id)log_log_163;
}

- (_MFDADeferredSetFlagsOperation)initWithCoder:(id)a3
{
  id v4;
  _MFDADeferredSetFlagsOperation *v5;
  uint64_t v6;
  NSString *messageID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFDADeferredSetFlagsOperation;
  v5 = -[_MFDADeferredSetFlagsOperation init](&v9, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
      __assert_rtn("-[_MFDADeferredSetFlagsOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 374, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\");
    v5->_onFlags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("OnFlags"));
    v5->_offFlags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("OffFlags"));
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
    __assert_rtn("-[_MFDADeferredSetFlagsOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 384, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\");
  objc_msgSend(v4, "encodeInt64:forKey:", self->_onFlags, CFSTR("OnFlags"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_offFlags, CFSTR("OffFlags"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageID, CFSTR("MessageID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  id v4;
  unint64_t onFlags;
  unint64_t offFlags;
  NSString **p_messageID;
  int v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[3];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  onFlags = self->_onFlags;
  offFlags = self->_offFlags;
  v36 = 0;
  v37 = 0;
  p_messageID = &self->_messageID;
  v8 = -[_MFOfflineCacheOperation databaseID:andMailbox:forMessageWithRemoteID:connection:](self, "databaseID:andMailbox:forMessageWithRemoteID:connection:", &v37, &v36, self->_messageID, v4);
  v31 = v37;
  v9 = v36;
  if (!v9)
  {
    +[_MFDADeferredSetFlagsOperation log](_MFDADeferredSetFlagsOperation, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_MFDADeferredSetFlagsOperation translateToLocalActionWithConnection:].cold.1((uint64_t *)&self->_messageID, v13, v19);
    goto LABEL_13;
  }
  if (v8)
  {
    objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("INSERT INTO local_message_actions (action_type, mailbox, source_mailbox, destination_mailbox, user_initiated) VALUES (3, ?, NULL, NULL, 0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v12 = objc_msgSend(v10, "executeWithIndexedBindings:usingBlock:error:", v11, 0, &v35);
    v13 = v35;

    if (v12)
    {
      v30 = objc_msgSend(v4, "lastInsertedDatabaseID");

      if ((onFlags & 1 | offFlags & 1) == 1)
      {
        objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("INSERT INTO action_flags (action, flag_type, flag_value) VALUES (?, 1, ?)"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v30);
        v40[0] = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v40[0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", onFlags & 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v13;
        v16 = objc_msgSend(v10, "executeWithIndexedBindings:usingBlock:error:", v15, 0, &v34);
        v28 = v34;

        if ((v16 & 1) == 0)
        {
          objc_msgSend(v4, "handleError:message:", v28, CFSTR("Inserting read flag change"));
          LOBYTE(v8) = 0;
          v13 = v28;
          goto LABEL_12;
        }

        v17 = (onFlags >> 1) & 1 | (offFlags >> 1) & 1;
        v18 = v28;
        if ((v17 & 1) == 0)
        {
LABEL_18:
          objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("INSERT INTO action_messages (action, message, remote_id, destination_message, action_phase) VALUES (?, ?, ?, NULL, 0)"), v28);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v30);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = v26;
          v38[1] = v31;
          v38[2] = *p_messageID;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v18;
          LOBYTE(v8) = objc_msgSend(v10, "executeWithIndexedBindings:usingBlock:error:", v27, 0, &v32);
          v13 = v32;

          if ((v8 & 1) == 0)
            objc_msgSend(v4, "handleError:message:", v13, CFSTR("Inserting message for flag change"));
          goto LABEL_12;
        }
      }
      else
      {
        v21 = onFlags | offFlags;
        v18 = v13;
        if ((v21 & 2) == 0)
          goto LABEL_18;
      }
      objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("INSERT INTO action_flags (action, flag_type, flag_value) VALUES (?, 4, ?)"), v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v22;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (onFlags >> 1) & 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v18;
      v25 = objc_msgSend(v10, "executeWithIndexedBindings:usingBlock:error:", v24, 0, &v33);
      v13 = v33;

      if (v25)
      {

        v18 = v13;
        goto LABEL_18;
      }
      objc_msgSend(v4, "handleError:message:", v13, CFSTR("Inserting flagged flag change"));
    }
    else
    {
      objc_msgSend(v4, "handleError:message:", v13, CFSTR("Inserting flag change action"));
    }
    LOBYTE(v8) = 0;
LABEL_12:

LABEL_13:
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_MFDADeferredSetFlagsOperation;
  -[_MFDADeferredSetFlagsOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ message-id \"%@\", on-flags %llu, off-flags %llu"), v4, self->_messageID, self->_onFlags, self->_offFlags);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
}

- (void)translateToLocalActionWithConnection:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "DAMessageID: %@ and corresponding mailboxNumber not found.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

@end
