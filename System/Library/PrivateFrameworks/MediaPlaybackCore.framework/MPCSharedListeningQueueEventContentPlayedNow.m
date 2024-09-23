@implementation MPCSharedListeningQueueEventContentPlayedNow

- (MPCSharedListeningQueueEventContentPlayedNow)initWithItems:(id)a3 container:(id)a4 startItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPCSharedListeningQueueEventContentPlayedNow *v11;
  MPCSharedListeningQueueEventContentPlayedNow *v12;
  uint64_t v13;
  NSArray *items;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCSharedListeningQueueEventContentPlayedNow;
  v11 = -[MPCSharedListeningQueueEventContentPlayedNow init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_container, a4);
    v13 = objc_msgSend(v8, "copy");
    items = v12->_items;
    v12->_items = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_startItem, a5);
  }

  return v12;
}

- (id)description
{
  NSArray *items;
  MPModelGenericObject *container;
  uint64_t v5;

  items = self->_items;
  container = self->_container;
  if (container)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventContentPlayedNow: %p container=%@ startItem=%@ items=%@>"), self, container, self->_startItem, items);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventContentPlayedNow: %p startItem=%@ items=%@>"), self, self->_startItem, items, v5);
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

- (MPModelGenericObject)startItem
{
  return self->_startItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
