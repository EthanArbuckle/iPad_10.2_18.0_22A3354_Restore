@implementation CalChangeHistoryCollector

- (CalChangeHistoryCollector)init
{
  CalChangeHistoryCollector *v2;
  NSMutableArray *v3;
  NSMutableArray *insertedContacts;
  NSMutableArray *v5;
  NSMutableArray *updatedContacts;
  NSMutableArray *v7;
  NSMutableArray *deletedContactIdentifiers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CalChangeHistoryCollector;
  v2 = -[CalChangeHistoryCollector init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    insertedContacts = v2->_insertedContacts;
    v2->_insertedContacts = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedContacts = v2->_updatedContacts;
    v2->_updatedContacts = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedContactIdentifiers = v2->_deletedContactIdentifiers;
    v2->_deletedContactIdentifiers = v7;

  }
  return v2;
}

- (void)visitDropEverythingEvent:(id)a3
{
  self->_didReset = 1;
}

- (void)visitAddContactEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CalChangeHistoryCollector insertedContacts](self, "insertedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v6);
  self->_hasChanges = 1;
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CalChangeHistoryCollector updatedContacts](self, "updatedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v6);
  self->_hasChanges = 1;
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CalChangeHistoryCollector deletedContactIdentifiers](self, "deletedContactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v6);
  self->_hasChanges = 1;
}

- (BOOL)didReset
{
  return self->_didReset;
}

- (void)setDidReset:(BOOL)a3
{
  self->_didReset = a3;
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)setHasChanges:(BOOL)a3
{
  self->_hasChanges = a3;
}

- (NSMutableArray)insertedContacts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInsertedContacts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)updatedContacts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedContacts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)deletedContactIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeletedContactIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedContacts, 0);
  objc_storeStrong((id *)&self->_insertedContacts, 0);
}

@end
