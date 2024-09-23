@implementation AMSDoubleLinkedListNode

- (id)object
{
  return self->_object;
}

- (AMSDoubleLinkedListNode)next
{
  return self->_next;
}

- (AMSDoubleLinkedListNode)previous
{
  return (AMSDoubleLinkedListNode *)objc_loadWeakRetained((id *)&self->_previous);
}

- (void)setListIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_listIdentifier, a3);
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (void)setPrevious:(id)a3
{
  objc_storeWeak((id *)&self->_previous, a3);
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (AMSDoubleLinkedListNode)initWithObject:(id)a3
{
  id v5;
  AMSDoubleLinkedListNode *v6;
  AMSDoubleLinkedListNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDoubleLinkedListNode;
  v6 = -[AMSDoubleLinkedListNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong(&self->_object, 0);
  objc_destroyWeak((id *)&self->_previous);
}

- (AMSDoubleLinkedListNode)init
{
  return -[AMSDoubleLinkedListNode initWithObject:](self, "initWithObject:", 0);
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

@end
