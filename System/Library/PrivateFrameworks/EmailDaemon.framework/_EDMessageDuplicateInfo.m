@implementation _EDMessageDuplicateInfo

- (_EDMessageDuplicateInfo)initWithMailboxProvider:(id)a3
{
  id v5;
  _EDMessageDuplicateInfo *v6;
  _EDMessageDuplicateInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EDMessageDuplicateInfo;
  v6 = -[_EDMessageDuplicateInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mailboxProvider, a3);

  return v7;
}

- (NSMutableSet)mailboxes
{
  NSMutableSet *mailboxes;
  NSMutableSet *v4;
  NSMutableSet *v5;

  mailboxes = self->_mailboxes;
  if (!mailboxes)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mailboxes;
    self->_mailboxes = v4;

    mailboxes = self->_mailboxes;
  }
  return mailboxes;
}

- (NSMutableArray)flags
{
  NSMutableArray *flags;
  NSMutableArray *v4;
  NSMutableArray *v5;

  flags = self->_flags;
  if (!flags)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_flags;
    self->_flags = v4;

    flags = self->_flags;
  }
  return flags;
}

- (NSMutableArray)dates
{
  NSMutableArray *dates;
  NSMutableArray *v4;
  NSMutableArray *v5;

  dates = self->_dates;
  if (!dates)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dates;
    self->_dates = v4;

    dates = self->_dates;
  }
  return dates;
}

- (void)addMessage:(id)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageTransformer.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message != nil"));

  }
  if (!self->_primaryPersistedMessage
    || (objc_msgSend(v16, "persistedMessageID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[EDPersistedMessage persistedMessageID](self->_primaryPersistedMessage, "persistedMessageID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v6 < v7))
  {
    objc_storeStrong((id *)&self->_primaryPersistedMessage, a3);
  }
  -[_EDMessageDuplicateInfo mailboxProvider](self, "mailboxProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessageTransformer mailboxesForPersistedMessage:mailboxProvider:](EDMessageTransformer, "mailboxesForPersistedMessage:mailboxProvider:", v16, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_EDMessageDuplicateInfo mailboxes](self, "mailboxes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v9);

  -[_EDMessageDuplicateInfo flags](self, "flags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "flags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  -[_EDMessageDuplicateInfo dates](self, "dates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateReceived");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

}

- (id)combinedMailboxes
{
  void *v2;
  void *v3;
  void *v4;

  -[_EDMessageDuplicateInfo mailboxes](self, "mailboxes");
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

  -[_EDMessageDuplicateInfo flags](self, "flags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0D1E1E8];
    -[_EDMessageDuplicateInfo flags](self, "flags");
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

  -[_EDMessageDuplicateInfo dates](self, "dates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_reduce:", &__block_literal_global_45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EDMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (void)setMailboxProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxProvider, a3);
}

- (EDPersistedMessage)primaryPersistedMessage
{
  return self->_primaryPersistedMessage;
}

- (void)setPrimaryPersistedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPersistedMessage, a3);
}

- (void)setMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxes, a3);
}

- (void)setFlags:(id)a3
{
  objc_storeStrong((id *)&self->_flags, a3);
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
  objc_storeStrong((id *)&self->_primaryPersistedMessage, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
}

@end
