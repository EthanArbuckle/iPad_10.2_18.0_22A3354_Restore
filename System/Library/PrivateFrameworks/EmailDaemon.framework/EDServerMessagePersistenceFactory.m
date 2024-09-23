@implementation EDServerMessagePersistenceFactory

- (EDServerMessagePersistenceFactory)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4
{
  id v7;
  id v8;
  EDServerMessagePersistenceFactory *v9;
  EDServerMessagePersistenceFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDServerMessagePersistenceFactory;
  v9 = -[EDServerMessagePersistenceFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_gmailLabelPersistence, a4);
  }

  return v10;
}

- (EDServerMessagePersistenceFactory)init
{
  -[EDServerMessagePersistenceFactory doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDServerMessagePersistenceFactory init]", "EDServerMessagePersistence.m", 68, "0");
}

- (id)serverMessagePersistenceForMailboxURL:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  EDServerMessagePersistence *v9;
  void *v10;
  void *v11;
  EDServerMessagePersistence *v12;
  __int16 v14;

  v5 = a3;
  v14 = 0;
  v6 = -[EDServerMessagePersistenceFactory mailboxIDForMailboxURL:useNumericSearch:supportsLabels:](self, "mailboxIDForMailboxURL:useNumericSearch:supportsLabels:", v5, (char *)&v14 + 1, &v14);
  if (v6 == *MEMORY[0x1E0D1DC08])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't get mailboxID for URL %@"), v5);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    qword_1EFCBC158 = objc_msgSend(v7, "UTF8String");
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDServerMessagePersistence.m"), 78, CFSTR("EDServerMessagePersistenceFactory couldn't map mailboxURL"));

  }
  v9 = [EDServerMessagePersistence alloc];
  -[EDServerMessagePersistenceFactory database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDServerMessagePersistenceFactory gmailLabelPersistence](self, "gmailLabelPersistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EDServerMessagePersistence initWithDatabase:gmailLabelPersistence:mailboxID:useNumericSearch:supportsLabels:](v9, "initWithDatabase:gmailLabelPersistence:mailboxID:useNumericSearch:supportsLabels:", v10, v11, v6, HIBYTE(v14), v14);

  return v12;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDGmailLabelPersistence)gmailLabelPersistence
{
  return self->_gmailLabelPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmailLabelPersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
