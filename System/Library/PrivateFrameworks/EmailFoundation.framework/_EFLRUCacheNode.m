@implementation _EFLRUCacheNode

- (_EFLRUCacheNode)initWithKey:(id)a3 element:(id)a4
{
  id v7;
  id v8;
  _EFLRUCacheNode *v9;
  _EFLRUCacheNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EFLRUCacheNode;
  v9 = -[_EFLRUCacheNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong(&v10->_element, a4);
  }

  return v10;
}

- (id)element
{
  return self->_element;
}

- (id)key
{
  return self->_key;
}

- (_EFLRUCacheNode)previous
{
  return self->_previous;
}

- (void)setPrevious:(id)a3
{
  objc_storeStrong((id *)&self->_previous, a3);
}

- (_EFLRUCacheNode)next
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
  objc_storeStrong((id *)&self->_previous, 0);
  objc_storeStrong(&self->_key, 0);
  objc_storeStrong(&self->_element, 0);
}

@end
