@implementation MFDADeferredMessageMoveOperation

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MFDADeferredMessageMoveOperation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_223 != -1)
    dispatch_once(&log_onceToken_223, block);
  return (id)log_log_222;
}

void __39__MFDADeferredMessageMoveOperation_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_222;
  log_log_222 = (uint64_t)v1;

}

- (MFDADeferredMessageMoveOperation)initWithCoder:(id)a3
{
  id v4;
  MFDADeferredMessageMoveOperation *v5;
  uint64_t v6;
  NSString *sourceMailboxID;
  uint64_t v8;
  NSString *destinationMailboxID;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *sourceRemoteIDs;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *originalFlags;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *temporaryRemoteIDs;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MFDADeferredMessageMoveOperation;
  v5 = -[MFDADeferredMessageMoveOperation init](&v26, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
      __assert_rtn("-[MFDADeferredMessageMoveOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 546, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceMailbox"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceMailboxID = v5->_sourceMailboxID;
    v5->_sourceMailboxID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DestinationMailbox"));
    v8 = objc_claimAutoreleasedReturnValue();
    destinationMailboxID = v5->_destinationMailboxID;
    v5->_destinationMailboxID = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("SourceRemoteIDs"));
    v13 = objc_claimAutoreleasedReturnValue();
    sourceRemoteIDs = v5->_sourceRemoteIDs;
    v5->_sourceRemoteIDs = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("OriginalFlags"));
    v18 = objc_claimAutoreleasedReturnValue();
    originalFlags = v5->_originalFlags;
    v5->_originalFlags = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("TemporaryIDs"));
    v23 = objc_claimAutoreleasedReturnValue();
    temporaryRemoteIDs = v5->_temporaryRemoteIDs;
    v5->_temporaryRemoteIDs = (NSArray *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[MFDADeferredMessageMoveOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 558, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\");
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceMailboxID, CFSTR("SourceMailbox"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_destinationMailboxID, CFSTR("DestinationMailbox"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceRemoteIDs, CFSTR("SourceRemoteIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalFlags, CFSTR("OriginalFlags"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_temporaryRemoteIDs, CFSTR("TemporaryIDs"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  id v4;
  NSUInteger v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id *v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id *v19;
  char v20;
  NSObject *v21;
  void *v22;
  NSUInteger v23;
  NSUInteger v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  BOOL v26;
  void *v27;
  id v28;
  void *v29;
  id *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  id v44;
  id v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  id obj;
  _QWORD v54[4];
  NSObject *v55;
  _BYTE *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[3];
  _BYTE v75[24];
  void *v76;
  _BYTE buf[24];
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_sourceRemoteIDs, "count"))
  {
    v5 = -[NSArray count](self->_sourceRemoteIDs, "count");
    if (v5 == -[NSArray count](self->_temporaryRemoteIDs, "count"))
    {
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_temporaryRemoteIDs, "count"));
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v78 = __Block_byref_object_copy__16;
      v79 = __Block_byref_object_dispose__16;
      v80 = 0;
      v68 = 0;
      v69 = &v68;
      v70 = 0x3032000000;
      v71 = __Block_byref_object_copy__16;
      v72 = __Block_byref_object_dispose__16;
      v73 = 0;
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[NSArray valueForKey:](self->_temporaryRemoteIDs, "valueForKey:", CFSTR("ef_quotedSQLEscapedString"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("SELECT messages.ROWID, messages.mailbox, mailboxes.url FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.ROWID WHERE remote_id IN (%@)"), v8);

      objc_msgSend(v4, "preparedStatementForQueryString:", v37);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      v63 = &v62;
      v64 = 0x3032000000;
      v65 = __Block_byref_object_copy__16;
      v66 = __Block_byref_object_dispose__16;
      v67 = 0;
      v58 = 0;
      v59 = &v58;
      v60 = 0x2020000000;
      v61 = -86;
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke;
      v54[3] = &unk_1E4E8D180;
      v10 = v36;
      v55 = v10;
      v56 = buf;
      v57 = &v68;
      v11 = (id *)(v63 + 5);
      obj = (id)v63[5];
      v35 = v9;
      LOBYTE(v9) = objc_msgSend(v9, "executeUsingBlock:error:", v54, &obj);
      objc_storeStrong(v11, obj);
      v61 = (char)v9;
      v12 = v59;
      if (!*((_BYTE *)v59 + 24))
      {
        objc_msgSend(v4, "handleError:message:", v63[5], CFSTR("Selecting messages with temporary remote IDs"));
        v12 = v59;
      }
      v47 = 0;
      v48 = &v47;
      v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__16;
      v51 = __Block_byref_object_dispose__16;
      v52 = 0;
      if (!*((_BYTE *)v12 + 24))
        goto LABEL_24;
      objc_msgSend((id)v69[5], "URLByDeletingLastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLByAppendingPathComponent:", self->_sourceMailboxID);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0x1E0C99000uLL;
      if (v14)
      {
        objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("SELECT ROWID FROM mailboxes WHERE URL = ? LIMIT 1"));
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "absoluteString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = 3221225472;
        v46[2] = __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke_2;
        v46[3] = &unk_1E4E8A268;
        v46[4] = &v47;
        v19 = (id *)(v63 + 5);
        v45 = (id)v63[5];
        v46[0] = MEMORY[0x1E0C809B0];
        v20 = -[NSObject executeWithIndexedBindings:usingBlock:error:](v16, "executeWithIndexedBindings:usingBlock:error:", v18, v46, &v45);
        objc_storeStrong(v19, v45);
        v15 = 0x1E0C99000;
        *((_BYTE *)v59 + 24) = v20;

        if (!*((_BYTE *)v59 + 24))
          objc_msgSend(v4, "handleError:message:", v63[5], CFSTR("Selecting source mailbox"));
        if (!v48[5])
        {
          +[MFDADeferredMessageMoveOperation log](MFDADeferredMessageMoveOperation, "log");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", self->_sourceMailboxID);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFDADeferredMessageMoveOperation translateToLocalActionWithConnection:].cold.2(v22, (uint64_t)v75, v21);
          }

        }
      }
      else
      {
        +[MFDADeferredMessageMoveOperation log](MFDADeferredMessageMoveOperation, "log");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", self->_sourceMailboxID);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFDADeferredMessageMoveOperation translateToLocalActionWithConnection:].cold.1(v27, (uint64_t)v75, v16);
        }
      }

      if (!v48[5])
        goto LABEL_24;
      objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("INSERT INTO local_message_actions (action_type, mailbox, source_mailbox, destination_mailbox, user_initiated) VALUES (6, ?, ?, ?, 0)"));
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v74[0] = v48[5];
      v74[1] = v74[0];
      v74[2] = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      objc_msgSend(*(id *)(v15 + 3360), "arrayWithObjects:count:", v74, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id *)(v63 + 5);
      v44 = (id)v63[5];
      v31 = objc_msgSend(v28, "executeWithIndexedBindings:usingBlock:error:", v29, 0, &v44);
      objc_storeStrong(v30, v44);
      *((_BYTE *)v59 + 24) = v31;

      if (*((_BYTE *)v59 + 24))
      {
        v32 = objc_msgSend(v4, "lastInsertedDatabaseID");

        if (!v32)
        {
LABEL_24:
          v26 = *((_BYTE *)v59 + 24) != 0;
          _Block_object_dispose(&v47, 8);

          _Block_object_dispose(&v58, 8);
          _Block_object_dispose(&v62, 8);

          _Block_object_dispose(&v68, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_25;
        }
        objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("INSERT INTO action_messages (action, message, remote_id, destination_message, action_phase) VALUES (?, NULL, ?, ?, 3)"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke_255;
        v38[3] = &unk_1E4E8D1A8;
        v38[4] = self;
        v39 = v33;
        v41 = &v58;
        v42 = &v62;
        v43 = v32;
        v40 = v4;
        v28 = v33;
        -[NSObject enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v38);

      }
      else
      {
        objc_msgSend(v4, "handleError:message:", v63[5], CFSTR("Inserting move action"));
      }

      goto LABEL_24;
    }
  }
  +[MFDADeferredMessageMoveOperation log](MFDADeferredMessageMoveOperation, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v23 = -[NSArray count](self->_sourceRemoteIDs, "count");
    v24 = -[NSArray count](self->_temporaryRemoteIDs, "count");
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", self->_sourceMailboxID);
    v25 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 2114;
    v78 = v25;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Not enough _sourceRemoteIDs(%ld) or _temporaryRemoteIDs(%ld) to migrate for source mailbox %{public}@", buf, 0x20u);

  }
  v26 = 1;
LABEL_25:

  return v26;
}

void __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberValue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v10);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
  }

}

void __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  *a4 = 1;
}

void __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke_255(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id obj;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = v8;
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v12 + 40);
  LOBYTE(v9) = objc_msgSend(v9, "executeWithIndexedBindings:usingBlock:error:", v11, 0, &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v9;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "handleError:message:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), CFSTR("Inserting message for move"));
    *a4 = 1;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MFDADeferredMessageMoveOperation;
  -[MFDADeferredMessageMoveOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ source \"%@\", destination \"%@\", %lu messages"), v4, self->_sourceMailboxID, self->_destinationMailboxID, -[NSArray count](self->_sourceRemoteIDs, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMailboxID, 0);
  objc_storeStrong((id *)&self->_sourceMailboxID, 0);
  objc_storeStrong((id *)&self->_temporaryRemoteIDs, 0);
  objc_storeStrong((id *)&self->_originalFlags, 0);
  objc_storeStrong((id *)&self->_sourceRemoteIDs, 0);
}

- (void)translateToLocalActionWithConnection:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "Unable to find source mailbox URL for source mailbox id: %{public}@", (uint8_t *)a2);

}

- (void)translateToLocalActionWithConnection:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "Unable to find source mailbox in database for source mailbox id: %{public}@", (uint8_t *)a2);

}

@end
