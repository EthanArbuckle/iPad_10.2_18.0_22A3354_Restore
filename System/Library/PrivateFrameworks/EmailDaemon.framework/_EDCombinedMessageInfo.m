@implementation _EDCombinedMessageInfo

- (_EDCombinedMessageInfo)init
{
  _EDCombinedMessageInfo *v2;
  uint64_t v3;
  NSMutableSet *mailboxes;
  uint64_t v5;
  NSMutableArray *flags;
  uint64_t v7;
  NSMutableArray *dates;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_EDCombinedMessageInfo;
  v2 = -[_EDCombinedMessageInfo init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    mailboxes = v2->_mailboxes;
    v2->_mailboxes = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    flags = v2->_flags;
    v2->_flags = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    dates = v2->_dates;
    v2->_dates = (NSMutableArray *)v7;

  }
  return v2;
}

- (EMMessage)deduplicatedMessage
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[5];
  id v11;

  -[_EDCombinedMessageInfo message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDBatchingMessageQueryIterator.m"), 69, CFSTR("Don't have primary message for combined message info."));

  }
  if ((unint64_t)-[NSMutableArray count](self->_dates, "count") > 1)
  {
    v6 = objc_alloc(MEMORY[0x1E0D1E1E8]);
    objc_msgSend(v4, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45___EDCombinedMessageInfo_deduplicatedMessage__block_invoke;
    v10[3] = &unk_1E949B430;
    v10[4] = self;
    v11 = v4;
    v5 = (id)objc_msgSend(v6, "initWithObjectID:builder:", v7, v10);

  }
  else
  {
    v5 = v4;
  }

  return (EMMessage *)v5;
}

- (void)addMessage:(id)a3 withDatabaseID:(int64_t)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDBatchingMessageQueryIterator.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message != nil"));

  }
  if (!self->_message || self->_lowestDatabaseID > a4)
  {
    objc_storeStrong((id *)&self->_message, a3);
    self->_lowestDatabaseID = a4;
  }
  -[_EDCombinedMessageInfo mailboxes](self, "mailboxes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mailboxes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  -[_EDCombinedMessageInfo flags](self, "flags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "flags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  -[_EDCombinedMessageInfo dates](self, "dates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (id)combinedMailboxes
{
  void *v2;
  void *v3;
  void *v4;

  -[_EDCombinedMessageInfo mailboxes](self, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_notEmpty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)combinedMessageFlags
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_EDCombinedMessageInfo flags](self, "flags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0D1E1E8];
    -[_EDCombinedMessageInfo flags](self, "flags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "combinedFlagsForMessageListItemFlags:forDisplay:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)combinedDate
{
  void *v2;
  void *v3;

  -[_EDCombinedMessageInfo dates](self, "dates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_reduce:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (int64_t)lowestDatabaseID
{
  return self->_lowestDatabaseID;
}

- (void)setLowestDatabaseID:(int64_t)a3
{
  self->_lowestDatabaseID = a3;
}

- (NSMutableSet)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxes, a3);
}

- (NSMutableArray)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
  objc_storeStrong((id *)&self->_flags, a3);
}

- (NSMutableArray)dates
{
  return self->_dates;
}

- (void)setDates:(id)a3
{
  objc_storeStrong((id *)&self->_dates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
