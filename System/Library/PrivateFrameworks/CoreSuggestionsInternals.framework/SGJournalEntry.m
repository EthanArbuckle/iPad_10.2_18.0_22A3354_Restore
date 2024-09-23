@implementation SGJournalEntry

- (SGJournalEntry)initWithOperation:(unint64_t)a3 event:(id)a4
{
  id v8;
  SGJournalEntry *v9;
  SGJournalEntry *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournalEntry.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SGJournalEntry;
  v9 = -[SGJournalEntry init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_operation = a3;
    objc_storeStrong((id *)&v9->_event, a4);
  }

  return v10;
}

- (SGJournalEntry)initWithOperation:(unint64_t)a3 eventBatch:(id)a4
{
  id v8;
  SGJournalEntry *v9;
  SGJournalEntry *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournalEntry.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventBatch"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SGJournalEntry;
  v9 = -[SGJournalEntry init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_operation = a3;
    objc_storeStrong((id *)&v9->_eventBatch, a4);
  }

  return v10;
}

- (SGJournalEntry)initWithOperation:(unint64_t)a3 contact:(id)a4
{
  id v8;
  SGJournalEntry *v9;
  SGJournalEntry *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournalEntry.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SGJournalEntry;
  v9 = -[SGJournalEntry init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_operation = a3;
    objc_storeStrong((id *)&v9->_contact, a4);
  }

  return v10;
}

- (SGJournalEntry)initWithOperation:(unint64_t)a3 reminder:(id)a4
{
  id v8;
  SGJournalEntry *v9;
  SGJournalEntry *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournalEntry.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reminder"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SGJournalEntry;
  v9 = -[SGJournalEntry init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_operation = a3;
    objc_storeStrong((id *)&v9->_reminder, a4);
  }

  return v10;
}

- (SGJournalEntry)initWithOperation:(unint64_t)a3
{
  SGJournalEntry *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGJournalEntry;
  result = -[SGJournalEntry init](&v5, sel_init);
  if (result)
    result->_operation = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SGJournalEntry *v4;
  SGJournalEntry *v5;
  BOOL v6;

  v4 = (SGJournalEntry *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGJournalEntry isEqualToJournalEntry:](self, "isEqualToJournalEntry:", v5);

  return v6;
}

- (BOOL)isEqualToJournalEntry:(id)a3
{
  SGJournalEntry *v4;
  SGJournalEntry *v5;
  SGStorageEvent *event;
  SGStorageEvent *v7;
  SGStorageEvent *v8;
  SGStorageEvent *v9;
  BOOL v10;
  char v11;
  unint64_t operation;
  SGStorageContact *v13;
  SGStorageContact *v14;

  v4 = (SGJournalEntry *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    event = self->_event;
    v7 = v4->_event;
    if (event == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = event;
      v10 = -[SGStorageEvent isEqual:](v9, "isEqual:", v8);

      if (!v10)
        goto LABEL_10;
    }
    operation = self->_operation;
    if (operation != -[SGJournalEntry operation](v5, "operation"))
    {
LABEL_10:
      v11 = 0;
      goto LABEL_13;
    }
    v13 = self->_contact;
    v14 = v13;
    if (v13 == v5->_contact)
      v11 = 1;
    else
      v11 = -[SGStorageContact isEqual:](v13, "isEqual:");

  }
LABEL_13:

  return v11;
}

- (id)description
{
  id v3;
  void *event;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  event = self->_event;
  if (!event)
  {
    event = self->_contact;
    if (!event)
      event = self->_reminder;
  }
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGJournalEntry op:%lu entity:%@"), self->_operation, event);
}

- (unint64_t)operation
{
  return self->_operation;
}

- (SGStorageEvent)event
{
  return self->_event;
}

- (NSArray)eventBatch
{
  return self->_eventBatch;
}

- (SGStorageContact)contact
{
  return self->_contact;
}

- (SGStorageReminder)reminder
{
  return self->_reminder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminder, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_eventBatch, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
