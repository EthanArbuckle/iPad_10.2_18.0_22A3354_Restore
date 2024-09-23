@implementation CalInMemoryTrackedDatabase

- (NSHashTable)clients
{
  return self->_clients;
}

- (BOOL)hasClients
{
  _OWORD v3[4];
  _BYTE v4[128];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, sizeof(v3));
  return -[NSHashTable countByEnumeratingWithState:objects:count:](self->_clients, "countByEnumeratingWithState:objects:count:", v3, v4, 16) != 0;
}

- (CalInMemoryTrackedDatabase)init
{
  CalInMemoryTrackedDatabase *v2;
  CalDatabaseInMemoryChangeTracking *v3;
  CalDatabaseInMemoryChangeTracking *database;
  uint64_t v5;
  NSHashTable *clients;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CalInMemoryTrackedDatabase;
  v2 = -[CalInMemoryTrackedDatabase init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CalDatabaseInMemoryChangeTracking);
    database = v2->_database;
    v2->_database = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 2);
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v5;

  }
  return v2;
}

- (CalDatabaseInMemoryChangeTracking)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
