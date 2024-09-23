@implementation MPCSharedListeningQueueEventContentReordered

- (MPCSharedListeningQueueEventContentReordered)initWithItem:(id)a3
{
  id v5;
  MPCSharedListeningQueueEventContentReordered *v6;
  MPCSharedListeningQueueEventContentReordered *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCSharedListeningQueueEventContentReordered;
  v6 = -[MPCSharedListeningQueueEventContentReordered init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventContentReordered: %p item=%@>"), self, self->_item);
}

- (MPModelGenericObject)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
