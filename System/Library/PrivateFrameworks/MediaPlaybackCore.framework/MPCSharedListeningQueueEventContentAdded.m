@implementation MPCSharedListeningQueueEventContentAdded

- (MPCSharedListeningQueueEventContentAdded)initWithItems:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  MPCSharedListeningQueueEventContentAdded *v8;
  MPCSharedListeningQueueEventContentAdded *v9;
  uint64_t v10;
  NSArray *items;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MPCSharedListeningQueueEventContentAdded;
  v8 = -[MPCSharedListeningQueueEventContentAdded init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_container, a4);
    v10 = objc_msgSend(v6, "copy");
    items = v9->_items;
    v9->_items = (NSArray *)v10;

  }
  return v9;
}

- (id)description
{
  NSArray *items;
  uint64_t v4;

  items = self->_items;
  if (self->_container)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventContentAdded: %p container=%@ items=%@>"), self, self->_container, items);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventContentAdded: %p items=%@>"), self, items, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPModelGenericObject)container
{
  return self->_container;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
