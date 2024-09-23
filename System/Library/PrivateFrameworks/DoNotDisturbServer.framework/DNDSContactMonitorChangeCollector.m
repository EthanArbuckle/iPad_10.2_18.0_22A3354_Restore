@implementation DNDSContactMonitorChangeCollector

- (DNDSContactMonitorChangeCollector)initWithMonitoredContactIdentifiers:(id)a3
{
  id v4;
  DNDSContactMonitorChangeCollector *v5;
  uint64_t v6;
  NSMutableArray *updatedContacts;
  uint64_t v8;
  NSMutableArray *deletedContactIdentifiers;
  uint64_t v10;
  NSSet *monitoredContactIdentifiers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DNDSContactMonitorChangeCollector;
  v5 = -[DNDSContactMonitorChangeCollector init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    updatedContacts = v5->_updatedContacts;
    v5->_updatedContacts = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    deletedContactIdentifiers = v5->_deletedContactIdentifiers;
    v5->_deletedContactIdentifiers = (NSMutableArray *)v8;

    v10 = objc_msgSend(v4, "copy");
    monitoredContactIdentifiers = v5->_monitoredContactIdentifiers;
    v5->_monitoredContactIdentifiers = (NSSet *)v10;

  }
  return v5;
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  NSSet *monitoredContactIdentifiers;
  void *v6;
  void *v7;
  NSMutableArray *updatedContacts;
  void *v9;
  id v10;

  v4 = a3;
  monitoredContactIdentifiers = self->_monitoredContactIdentifiers;
  v10 = v4;
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(monitoredContactIdentifiers) = -[NSSet containsObject:](monitoredContactIdentifiers, "containsObject:", v7);

  if ((_DWORD)monitoredContactIdentifiers)
  {
    updatedContacts = self->_updatedContacts;
    objc_msgSend(v10, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](updatedContacts, "addObject:", v9);

  }
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4;
  NSSet *monitoredContactIdentifiers;
  void *v6;
  NSMutableArray *deletedContactIdentifiers;
  void *v8;
  id v9;

  v4 = a3;
  monitoredContactIdentifiers = self->_monitoredContactIdentifiers;
  v9 = v4;
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(monitoredContactIdentifiers) = -[NSSet containsObject:](monitoredContactIdentifiers, "containsObject:", v6);

  if ((_DWORD)monitoredContactIdentifiers)
  {
    deletedContactIdentifiers = self->_deletedContactIdentifiers;
    objc_msgSend(v9, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](deletedContactIdentifiers, "addObject:", v8);

  }
}

- (NSArray)updatedContacts
{
  return &self->_updatedContacts->super;
}

- (NSArray)deletedContactIdentifiers
{
  return &self->_deletedContactIdentifiers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_deletedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedContacts, 0);
}

@end
