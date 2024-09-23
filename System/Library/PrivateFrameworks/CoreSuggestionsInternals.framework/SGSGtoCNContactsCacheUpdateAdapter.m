@implementation SGSGtoCNContactsCacheUpdateAdapter

- (SGSGtoCNContactsCacheUpdateAdapter)initWithSGSqlEntityStore:(id)a3
{
  id v4;
  SGSGtoCNContactsCacheUpdateAdapter *v5;
  SGSGtoCNContactsCacheUpdateAdapter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SGSGtoCNContactsCacheUpdateAdapter;
  v5 = -[SGSGtoCNContactsCacheUpdateAdapter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_store, v4);

  return v6;
}

- (void)addContact:(id)a3
{
  SGSqlEntityStore **p_store;
  id v4;
  id WeakRetained;

  p_store = &self->_store;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_store);
  objc_msgSend(WeakRetained, "refreshSuggestionsContact:", v4);

}

- (void)confirmContact:(id)a3
{
  SGSqlEntityStore **p_store;
  id v4;
  id WeakRetained;

  p_store = &self->_store;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_store);
  objc_msgSend(WeakRetained, "refreshSuggestionsContact:", v4);

}

- (void)rejectContact:(id)a3
{
  SGSqlEntityStore **p_store;
  id v4;
  uint64_t v5;
  id WeakRetained;

  p_store = &self->_store;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_store);
  v5 = objc_msgSend(v4, "masterEntityId");

  objc_msgSend(WeakRetained, "deleteAllCNContactMatchesForEntityID:", v5);
}

- (void)removeAllStoredPseudoContacts
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  objc_msgSend(WeakRetained, "deleteAllCNContactMatches");

}

- (SGSqlEntityStore)store
{
  return (SGSqlEntityStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (void)setStore:(id)a3
{
  objc_storeWeak((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
}

@end
