@implementation AFDisambiguationStore

- (id)_store
{
  AFManagedStorageConnection *store;
  AFManagedStorageConnection *v4;
  AFManagedStorageConnection *v5;

  store = self->_store;
  if (!store)
  {
    v4 = objc_alloc_init(AFManagedStorageConnection);
    v5 = self->_store;
    self->_store = v4;

    store = self->_store;
  }
  return store;
}

- (void)reset
{
  id v2;

  -[AFDisambiguationStore _store](self, "_store");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetKnowledgeStoreWithName:", CFSTR("com.apple.siri.disambiguation"));

}

- (id)infoForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[AFDisambiguationStore _store](self, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataForKey:inKnowledgeStoreWithName:", v6, CFSTR("com.apple.siri.disambiguation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v9, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)saveInfo:(id)a3 forIdentifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a4, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[AFDisambiguationStore _store](self, "_store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setData:forKey:inKnowledgeStoreWithName:", v7, v6, CFSTR("com.apple.siri.disambiguation"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
