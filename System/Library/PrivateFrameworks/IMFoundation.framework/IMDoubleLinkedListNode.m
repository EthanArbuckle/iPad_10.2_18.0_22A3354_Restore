@implementation IMDoubleLinkedListNode

- (IMDoubleLinkedListNode)initWithObject:(id)a3
{
  id v5;
  IMDoubleLinkedListNode *v6;
  IMDoubleLinkedListNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDoubleLinkedListNode;
  v6 = -[IMDoubleLinkedListNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

- (void)removeFromList
{
  IMDoubleLinkedListNode *prev;
  IMDoubleLinkedListNode *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  IMDoubleLinkedListNode *v13;

  prev = self->_prev;
  v4 = self->_next;
  v13 = prev;
  objc_msgSend_setNext_(v13, v5, (uint64_t)v4, v6);
  objc_msgSend_setPrev_(v4, v7, (uint64_t)v13, v8);

  objc_msgSend_setNext_(self, v9, 0, v10);
  objc_msgSend_setPrev_(self, v11, 0, v12);

}

- (void)orphan
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend_setNext_(self, a2, 0, v2);
  objc_msgSend_setPrev_(self, v4, 0, v5);
  objc_msgSend_setObject_(self, v6, 0, v7);
}

- (IMDoubleLinkedListNode)prev
{
  return (IMDoubleLinkedListNode *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrev:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (IMDoubleLinkedListNode)next
{
  return (IMDoubleLinkedListNode *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)object
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_prev, 0);
}

@end
