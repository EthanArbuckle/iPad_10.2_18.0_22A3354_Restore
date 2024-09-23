@implementation DIIdentityDriversLicenseDescriptor

- (DIIdentityDriversLicenseDescriptor)init
{
  DIIdentityDriversLicenseDescriptor *v2;
  DIIdentityDriversLicenseDescriptor *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *elementsToIntentToStore;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DIIdentityDriversLicenseDescriptor;
  v2 = -[DIIdentityDriversLicenseDescriptor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    elementsToIntentToStore = v3->_elementsToIntentToStore;
    v3->_elementsToIntentToStore = v4;

  }
  return v3;
}

- (NSArray)elements
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_elementsToIntentToStore, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addElements:(id)a3 withIntentToStore:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elementsToIntentToStore, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)intentToStoreForElement:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_elementsToIntentToStore, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)elementsToIntentToStore
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_elementsToIntentToStore;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setElementsToIntentToStore:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *elementsToIntentToStore;
  NSMutableDictionary *v6;

  v6 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_elementsToIntentToStore != v6)
  {
    v4 = (NSMutableDictionary *)-[NSMutableDictionary copyWithZone:](v6, "copyWithZone:", 0);
    elementsToIntentToStore = self->_elementsToIntentToStore;
    self->_elementsToIntentToStore = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("elementsToIntentToStore: %@, "), self->_elementsToIntentToStore);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementsToIntentToStore, 0);
}

@end
