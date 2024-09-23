@implementation _ICNullLexiconManager

- (_ICNullLexiconManager)init
{
  _ICNullLexiconManager *v2;
  NSMutableArray *v3;
  NSMutableArray *contactObservers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ICNullLexiconManager;
  v2 = -[_ICNullLexiconManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    contactObservers = v2->_contactObservers;
    v2->_contactObservers = v3;

  }
  return v2;
}

- (id)addContactObserver:(id)a3
{
  void *v4;
  NSMutableArray *contactObservers;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  contactObservers = self->_contactObservers;
  v6 = (void *)MEMORY[0x2276AC454]();
  -[NSMutableArray addObject:](contactObservers, "addObject:", v6);

  v7 = (void *)MEMORY[0x2276AC454](v4);
  return v7;
}

- (void)removeContactObserver:(id)a3
{
  NSMutableArray *contactObservers;
  id v4;

  contactObservers = self->_contactObservers;
  v4 = (id)MEMORY[0x2276AC454](a3, a2);
  -[NSMutableArray removeObject:](contactObservers, "removeObject:", v4);

}

- (id)addNamedEntitiesUpdateObserver:(id)a3
{
  return (id)objc_msgSend(a3, "copy");
}

- (id)loadLexicons:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)loadLexiconsUsingFilter:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)loadLexicons
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactObservers, 0);
}

- (id)test_loadLexicons
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
