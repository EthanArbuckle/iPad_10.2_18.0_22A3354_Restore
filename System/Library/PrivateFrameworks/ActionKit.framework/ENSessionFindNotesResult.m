@implementation ENSessionFindNotesResult

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ENSessionFindNotesResult title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSessionFindNotesResult notebook](self, "notebook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSessionFindNotesResult created](self, "created");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSessionFindNotesResult updated](self, "updated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ENSessionFindNotesResult updateSequenceNum](self, "updateSequenceNum");
  -[ENSessionFindNotesResult noteRef](self, "noteRef");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title = \"%@\"; notebook name = \"%@\"; created = %@; updated = %@; usn = %d; noteRef = %p>"),
    v4,
    self,
    v5,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (ENNoteRef)noteRef
{
  return self->_noteRef;
}

- (void)setNoteRef:(id)a3
{
  objc_storeStrong((id *)&self->_noteRef, a3);
}

- (ENNotebook)notebook
{
  return self->_notebook;
}

- (void)setNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_notebook, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSDate)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
  objc_storeStrong((id *)&self->_created, a3);
}

- (NSDate)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_updated, a3);
}

- (BOOL)hasResources
{
  return self->_hasResources;
}

- (void)setHasResources:(BOOL)a3
{
  self->_hasResources = a3;
}

- (int)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setUpdateSequenceNum:(int)a3
{
  self->_updateSequenceNum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notebook, 0);
  objc_storeStrong((id *)&self->_noteRef, 0);
}

@end
