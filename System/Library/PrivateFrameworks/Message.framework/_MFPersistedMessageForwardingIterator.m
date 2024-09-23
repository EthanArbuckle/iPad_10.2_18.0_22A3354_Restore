@implementation _MFPersistedMessageForwardingIterator

- (BOOL)handleMessage:(id)a3
{
  id v4;
  id handler;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    handler = self->_handler;
  else
    handler = 0;
  v6 = (void (**)(id, void *, _QWORD))handler;
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

  -[_MFPersistedMessageForwardingIterator messageSet](self, "messageSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIndex:", objc_msgSend(v4, "libraryID"));

  v9 = atomic_load((unsigned __int8 *)&self->_cancelled);
  v10 = (v9 & 1) == 0;

  return v10;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
}

- (NSMutableIndexSet)messageSet
{
  return self->_messageSet;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_messageSet, 0);
}

@end
