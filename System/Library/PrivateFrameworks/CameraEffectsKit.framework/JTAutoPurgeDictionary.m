@implementation JTAutoPurgeDictionary

- (JTAutoPurgeDictionary)init
{
  JTAutoPurgeDictionary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionary;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JTAutoPurgeDictionary;
  v2 = -[JTAutoPurgeDictionary init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_highMemoryWarning, *MEMORY[0x24BDF7538], 0);

  }
  return v2;
}

- (id)copyOfDictionary
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_dictionary;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableDictionary copy](self->_dictionary, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (unint64_t)count
{
  NSMutableDictionary *v3;
  unint64_t v4;

  v3 = self->_dictionary;
  objc_sync_enter(v3);
  v4 = -[NSMutableDictionary count](self->_dictionary, "count");
  objc_sync_exit(v3);

  return v4;
}

- (void)addEntriesFromDictionary:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_dictionary;
  objc_sync_enter(v4);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_dictionary, "addEntriesFromDictionary:", v5);
  objc_sync_exit(v4);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self->_dictionary;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", v8, v6);
  objc_sync_exit(v7);

}

- (id)objectForKey:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_dictionary;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)removeAllObjects
{
  NSMutableDictionary *obj;

  obj = self->_dictionary;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
  objc_sync_exit(obj);

}

- (id)description
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_dictionary;
  objc_sync_enter(v3);
  -[NSMutableDictionary description](self->_dictionary, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (void)highMemoryWarning
{
  void *v3;
  char v4;
  id v5;

  if (!-[JTAutoPurgeDictionary suspendPurging](self, "suspendPurging"))
  {
    -[JTAutoPurgeDictionary removeAllObjects](self, "removeAllObjects");
    -[JTAutoPurgeDictionary delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[JTAutoPurgeDictionary delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didPurgeItems:", self);

    }
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7538], 0);

  v4.receiver = self;
  v4.super_class = (Class)JTAutoPurgeDictionary;
  -[JTAutoPurgeDictionary dealloc](&v4, sel_dealloc);
}

- (BOOL)suspendPurging
{
  return self->_suspendPurging;
}

- (void)setSuspendPurging:(BOOL)a3
{
  self->_suspendPurging = a3;
}

- (JTAutoPurgeDictionaryDelegate)delegate
{
  return (JTAutoPurgeDictionaryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
