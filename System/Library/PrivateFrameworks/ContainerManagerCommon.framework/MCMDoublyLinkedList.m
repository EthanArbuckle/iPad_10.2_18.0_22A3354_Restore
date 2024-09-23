@implementation MCMDoublyLinkedList

- (id)removeFromHead
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MCMDoublyLinkedList head](self, "head");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "next");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMDoublyLinkedList setHead:](self, "setHead:", v5);

    objc_msgSend(v4, "next");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrev:", 0);

    -[MCMDoublyLinkedList tail](self, "tail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v7)
      -[MCMDoublyLinkedList setTail:](self, "setTail:", 0);
    -[MCMDoublyLinkedList setCount:](self, "setCount:", -[MCMDoublyLinkedList count](self, "count") - 1);
  }
  objc_msgSend(v4, "setNext:", 0);
  objc_msgSend(v4, "setPrev:", 0);
  return v4;
}

- (void)addToTail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MCMDoublyLinkedList tail](self, "tail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCMDoublyLinkedList tail](self, "tail");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNext:", v4);

    -[MCMDoublyLinkedList tail](self, "tail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrev:", v7);

    objc_msgSend(v4, "setNext:", 0);
  }
  else
  {
    objc_msgSend(v4, "setPrev:", 0);
    objc_msgSend(v4, "setNext:", 0);
    -[MCMDoublyLinkedList setHead:](self, "setHead:", v4);
  }
  -[MCMDoublyLinkedList setTail:](self, "setTail:", v4);

  -[MCMDoublyLinkedList setCount:](self, "setCount:", -[MCMDoublyLinkedList count](self, "count") + 1);
}

- (void)removeNodeAndAddToTail:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "prev");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "next");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrev:", v4);

  objc_msgSend(v12, "next");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "prev");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNext:", v6);

  -[MCMDoublyLinkedList head](self, "head");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v12)
  {
    objc_msgSend(v12, "next");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMDoublyLinkedList setHead:](self, "setHead:", v9);

  }
  -[MCMDoublyLinkedList tail](self, "tail");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v12)
  {
    objc_msgSend(v12, "prev");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMDoublyLinkedList setTail:](self, "setTail:", v11);

  }
  objc_msgSend(v12, "setPrev:", 0);
  objc_msgSend(v12, "setNext:", 0);
  -[MCMDoublyLinkedList setCount:](self, "setCount:", -[MCMDoublyLinkedList count](self, "count") - 1);
  -[MCMDoublyLinkedList addToTail:](self, "addToTail:", v12);

}

- (void)removeAllObjects
{
  void *v3;

  do
  {
    -[MCMDoublyLinkedList removeFromHead](self, "removeFromHead");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v3);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (MCMDoublyLinkedListNode)head
{
  return self->_head;
}

- (void)setHead:(id)a3
{
  objc_storeStrong((id *)&self->_head, a3);
}

- (MCMDoublyLinkedListNode)tail
{
  return self->_tail;
}

- (void)setTail:(id)a3
{
  objc_storeStrong((id *)&self->_tail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

@end
