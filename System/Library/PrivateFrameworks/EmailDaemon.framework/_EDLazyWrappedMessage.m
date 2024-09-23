@implementation _EDLazyWrappedMessage

- (_EDLazyWrappedMessage)initWithMessage:(id)a3 messagePersistence:(id)a4
{
  id v7;
  uint64_t v8;
  _EDLazyWrappedMessage *v9;
  _EDLazyWrappedMessage *v10;
  objc_super v12;

  v7 = a4;
  v8 = *MEMORY[0x1E0D1DC08];
  v12.receiver = self;
  v12.super_class = (Class)_EDLazyWrappedMessage;
  v9 = -[_EDWrappedMessage initWithMessage:databaseID:](&v12, sel_initWithMessage_databaseID_, a3, v8);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_messagePersistence, a4);

  return v10;
}

- (int64_t)databaseID
{
  int64_t result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  result = self->super._databaseID;
  if (result == *MEMORY[0x1E0D1DC08])
  {
    -[_EDLazyWrappedMessage messagePersistence](self, "messagePersistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EDWrappedMessage message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "databaseIDsDictionaryForMessageObjectIDs:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      self->super._databaseID = objc_msgSend(v10, "longLongValue");

    return self->super._databaseID;
  }
  return result;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

@end
