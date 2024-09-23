@implementation ENLinkedNoteStoreClient

- (id)authenticationToken
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[ENLinkedNoteStoreClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENLinkedNoteStoreClient.m"), 46, CFSTR("ENLinkedNoteStoreClient delegate not set"));

  }
  -[ENLinkedNoteStoreClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENLinkedNoteStoreClient linkedNotebookRef](self, "linkedNotebookRef");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticationTokenForLinkedNotebookRef:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)noteStoreUrl
{
  void *v2;
  void *v3;

  -[ENLinkedNoteStoreClient linkedNotebookRef](self, "linkedNotebookRef");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteStoreUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ENLinkedNoteStoreClientDelegate)delegate
{
  return (ENLinkedNoteStoreClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ENLinkedNotebookRef)linkedNotebookRef
{
  return self->_linkedNotebookRef;
}

- (void)setLinkedNotebookRef:(id)a3
{
  objc_storeStrong((id *)&self->_linkedNotebookRef, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedNotebookRef, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)noteStoreClientForLinkedNotebookRef:(id)a3
{
  id v3;
  ENLinkedNoteStoreClient *v4;

  v3 = a3;
  v4 = objc_alloc_init(ENLinkedNoteStoreClient);
  -[ENLinkedNoteStoreClient setLinkedNotebookRef:](v4, "setLinkedNotebookRef:", v3);

  return v4;
}

@end
