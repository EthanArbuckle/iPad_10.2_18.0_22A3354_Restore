@implementation DOCItemCollectionSubscriber

- (id)updateBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (DOCItemCollectionSubscriber)initWithUpdateBlock:(id)a3
{
  id v4;
  DOCItemCollectionSubscriber *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCItemCollectionSubscriber;
  v5 = -[DOCItemCollectionSubscriber init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCItemCollectionSubscriber setUUID:](v5, "setUUID:", v6);

    -[DOCItemCollectionSubscriber setUpdateBlock:](v5, "setUpdateBlock:", v4);
  }

  return v5;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
