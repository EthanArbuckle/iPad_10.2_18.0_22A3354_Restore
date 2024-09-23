@implementation EMFetchController

+ (id)remoteInterface
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FCD0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_performFetchOfType_mailboxObjectIds_, 1, 0);

  return v5;
}

- (EMFetchController)initWithRemoteConnection:(id)a3
{
  id v5;
  EMFetchController *v6;
  EMFetchController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFetchController;
  v6 = -[EMFetchController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)performFetchOfType:(int)a3 mailboxes:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  objc_msgSend(a4, "ef_map:", &__block_literal_global_13);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EMFetchController connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performFetchOfType:mailboxObjectIds:", v4, v8);

}

- (void)setSuppressedContexts:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMFetchController connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressedContexts:", v6);

}

- (void)performFetchOfType:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[EMFetchController connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performFetchOfType:", v3);

}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 8, 1);
}

id __50__EMFetchController_performFetchOfType_mailboxes___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)performFetchForOTC
{
  void *v2;
  id v3;

  -[EMFetchController connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performFetchForOTC");

}

- (void)performFetchOfType:(int)a3 accounts:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  objc_msgSend(a4, "ef_map:", &__block_literal_global_67);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EMFetchController connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performFetchOfType:accountIds:", v4, v8);

}

id __49__EMFetchController_performFetchOfType_accounts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "representedObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)diagnosticInformation
{
  void *v2;
  void *v3;
  void *v4;

  -[EMFetchController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnosticInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
