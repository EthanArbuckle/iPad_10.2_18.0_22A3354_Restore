@implementation ENSessionListNotebooksContext

- (NSMutableArray)resultNotebooks
{
  return self->_resultNotebooks;
}

- (void)setResultNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_resultNotebooks, a3);
}

- (NSMutableArray)linkedPersonalNotebooks
{
  return self->_linkedPersonalNotebooks;
}

- (void)setLinkedPersonalNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPersonalNotebooks, a3);
}

- (NSMutableDictionary)sharedBusinessNotebooks
{
  return self->_sharedBusinessNotebooks;
}

- (void)setSharedBusinessNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_sharedBusinessNotebooks, a3);
}

- (NSCountedSet)sharedBusinessNotebookGuids
{
  return self->_sharedBusinessNotebookGuids;
}

- (void)setSharedBusinessNotebookGuids:(id)a3
{
  objc_storeStrong((id *)&self->_sharedBusinessNotebookGuids, a3);
}

- (NSMutableDictionary)businessNotebooks
{
  return self->_businessNotebooks;
}

- (void)setBusinessNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_businessNotebooks, a3);
}

- (NSMutableDictionary)sharedNotebooks
{
  return self->_sharedNotebooks;
}

- (void)setSharedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_sharedNotebooks, a3);
}

- (int64_t)pendingSharedNotebooks
{
  return self->_pendingSharedNotebooks;
}

- (void)setPendingSharedNotebooks:(int64_t)a3
{
  self->_pendingSharedNotebooks = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sharedNotebooks, 0);
  objc_storeStrong((id *)&self->_businessNotebooks, 0);
  objc_storeStrong((id *)&self->_sharedBusinessNotebookGuids, 0);
  objc_storeStrong((id *)&self->_sharedBusinessNotebooks, 0);
  objc_storeStrong((id *)&self->_linkedPersonalNotebooks, 0);
  objc_storeStrong((id *)&self->_resultNotebooks, 0);
}

@end
