@implementation LiveFSFPTrashObserver

- (LiveFSFPTrashObserver)initWithCompletionHandler:(id)a3
{
  id v4;
  LiveFSFPTrashObserver *v5;
  uint64_t v6;
  NSMutableArray *items;
  uint64_t v8;
  id completionHandler;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LiveFSFPTrashObserver;
  v5 = -[LiveFSFPTrashObserver init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSMutableArray *)v6;

    v8 = MEMORY[0x2207CD064](v4);
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = (id)v8;

  }
  return v5;
}

+ (id)newWithCompletionHandler:(id)a3
{
  id v3;
  LiveFSFPTrashObserver *v4;

  v3 = a3;
  v4 = -[LiveFSFPTrashObserver initWithCompletionHandler:]([LiveFSFPTrashObserver alloc], "initWithCompletionHandler:", v3);

  return v4;
}

- (void)didEnumerateItems:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  LiveFSFPTrashObserver *v10;

  v4 = (objc_class *)MEMORY[0x24BDD16F0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__LiveFSFPTrashObserver_didEnumerateItems___block_invoke;
  v8[3] = &unk_24E46B248;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

void __43__LiveFSFPTrashObserver_didEnumerateItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "numberFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (void)finishEnumeratingUpToPage:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_lastPage, a3);
  v5 = v6;
  if (!v6)
  {
    (*((void (**)(void))self->_completionHandler + 2))();
    v5 = 0;
  }

}

- (void)finishEnumeratingWithError:(id)a3
{
  NSData *lastPage;
  id v5;

  lastPage = self->_lastPage;
  self->_lastPage = 0;
  v5 = a3;

  (*((void (**)(void))self->_completionHandler + 2))();
}

- (NSMutableArray)items
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSData)lastPage
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPage, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
