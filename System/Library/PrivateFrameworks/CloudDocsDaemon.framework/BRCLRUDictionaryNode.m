@implementation BRCLRUDictionaryNode

- (BRCLRUDictionaryNode)initWithKey:(id)a3 object:(id)a4
{
  id v7;
  id v8;
  BRCLRUDictionaryNode *v9;
  BRCLRUDictionaryNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCLRUDictionaryNode;
  v9 = -[BRCLRUDictionaryNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong(&v10->_object, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BRCLRUDictionaryNode initWithKey:object:]([BRCLRUDictionaryNode alloc], "initWithKey:object:", self->_key, self->_object);
}

- (id)key
{
  return self->_key;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (BRCLRUDictionaryNode)next
{
  return (BRCLRUDictionaryNode *)objc_loadWeakRetained((id *)&self->_next);
}

- (void)setNext:(id)a3
{
  objc_storeWeak((id *)&self->_next, a3);
}

- (BRCLRUDictionaryNode)prev
{
  return (BRCLRUDictionaryNode *)objc_loadWeakRetained((id *)&self->_prev);
}

- (void)setPrev:(id)a3
{
  objc_storeWeak((id *)&self->_prev, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_prev);
  objc_destroyWeak((id *)&self->_next);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

@end
