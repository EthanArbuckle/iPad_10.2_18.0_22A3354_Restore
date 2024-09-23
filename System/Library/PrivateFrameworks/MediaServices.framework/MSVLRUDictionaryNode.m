@implementation MSVLRUDictionaryNode

- (id)object
{
  return self->_object;
}

- (MSVLRUDictionaryNode)initWithKey:(id)a3 object:(id)a4
{
  id v7;
  id v8;
  MSVLRUDictionaryNode *v9;
  MSVLRUDictionaryNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSVLRUDictionaryNode;
  v9 = -[MSVLRUDictionaryNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong(&v10->_object, a4);
  }

  return v10;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (void)setPrev:(id)a3
{
  objc_storeWeak((id *)&self->_prev, a3);
}

- (void)setNext:(id)a3
{
  objc_storeWeak((id *)&self->_next, a3);
}

- (MSVLRUDictionaryNode)next
{
  return (MSVLRUDictionaryNode *)objc_loadWeakRetained((id *)&self->_next);
}

- (MSVLRUDictionaryNode)prev
{
  return (MSVLRUDictionaryNode *)objc_loadWeakRetained((id *)&self->_prev);
}

- (id)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_prev);
  objc_destroyWeak((id *)&self->_next);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MSVLRUDictionaryNode initWithKey:object:]([MSVLRUDictionaryNode alloc], "initWithKey:object:", self->_key, self->_object);
}

@end
