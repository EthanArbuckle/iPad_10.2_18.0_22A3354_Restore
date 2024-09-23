@implementation MCMDoublyLinkedListNode

- (MCMDoublyLinkedListNode)initWithKey:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  MCMDoublyLinkedListNode *v8;
  MCMDoublyLinkedListNode *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCMDoublyLinkedListNode;
  v8 = -[MCMDoublyLinkedListNode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MCMDoublyLinkedListNode setKey:](v8, "setKey:", v6);
    -[MCMDoublyLinkedListNode setData:](v9, "setData:", v7);
  }

  return v9;
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong(&self->_data, a3);
}

- (id)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong(&self->_key, a3);
}

- (MCMDoublyLinkedListNode)prev
{
  return (MCMDoublyLinkedListNode *)objc_loadWeakRetained((id *)&self->_prev);
}

- (void)setPrev:(id)a3
{
  objc_storeWeak((id *)&self->_prev, a3);
}

- (MCMDoublyLinkedListNode)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_destroyWeak((id *)&self->_prev);
  objc_storeStrong(&self->_key, 0);
  objc_storeStrong(&self->_data, 0);
}

@end
