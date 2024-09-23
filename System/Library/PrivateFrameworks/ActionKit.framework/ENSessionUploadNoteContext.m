@implementation ENSessionUploadNoteContext

- (EDAMNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (ENNoteRef)refToReplace
{
  return self->_refToReplace;
}

- (void)setRefToReplace:(id)a3
{
  objc_storeStrong((id *)&self->_refToReplace, a3);
}

- (ENNotebook)notebook
{
  return self->_notebook;
}

- (void)setNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_notebook, a3);
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ENNoteStoreClient)noteStore
{
  return self->_noteStore;
}

- (void)setNoteStore:(id)a3
{
  objc_storeStrong((id *)&self->_noteStore, a3);
}

- (ENNoteRef)noteRef
{
  return self->_noteRef;
}

- (void)setNoteRef:(id)a3
{
  objc_storeStrong((id *)&self->_noteRef, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteRef, 0);
  objc_storeStrong((id *)&self->_noteStore, 0);
  objc_storeStrong(&self->_progress, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_notebook, 0);
  objc_storeStrong((id *)&self->_refToReplace, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
