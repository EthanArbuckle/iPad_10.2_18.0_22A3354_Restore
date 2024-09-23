@implementation AFQueue

- (void)dealloc
{
  AFLinkedListItem *v3;
  void *v4;
  id v5;
  objc_super v6;

  v3 = self->_head;
  if (v3)
  {
    v4 = v3;
    do
    {
      v5 = v4;
      objc_msgSend(v5, "nextItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "removeFromList");
    }
    while (v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)AFQueue;
  -[AFQueue dealloc](&v6, sel_dealloc);
}

- (id)_objects
{
  void *v3;
  AFLinkedListItem *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (self->_count)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_count);
    v4 = self->_head;
    if (v4)
    {
      v5 = v4;
      do
      {
        objc_msgSend(v5, "object");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v6);

        objc_msgSend(v5, "nextItem");
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v7;
      }
      while (v7);
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v6;
  unint64_t var0;
  AFLinkedListItem *v12;
  void *v13;
  unint64_t v14;

  a3->var1 = a4;
  a3->var2 = (unint64_t *)&a3->var2;
  if (!self->_count || a3->var3[0] == 1)
    return 0;
  var0 = a3->var0;
  v12 = (AFLinkedListItem *)(id)a3->var0;
  if (!var0)
    v12 = self->_head;
  v13 = v12;
  v6 = 0;
  while (a5 != v6)
  {
    a4[v6++] = (id)objc_msgSend(v13, "object");
    objc_msgSend(v13, "nextItem");
    v14 = objc_claimAutoreleasedReturnValue();

    a3->var0 = v14;
    v13 = (void *)v14;
    if (!v14)
    {
      a3->var3[0] = 1;
      return v6;
    }
  }

  return a5;
}

- (id)frontObject
{
  return -[AFLinkedListItem object](self->_head, "object");
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t count;
  unint64_t v4;
  AFLinkedListItem *head;
  void *v6;
  AFLinkedListItem *v7;
  AFLinkedListItem *v8;

  count = self->_count;
  if (count <= a3)
  {
    v6 = 0;
  }
  else
  {
    v4 = a3;
    if (!a3)
    {
      head = self->_head;
      goto LABEL_7;
    }
    if (count - 1 == a3)
    {
      head = self->_tail;
LABEL_7:
      -[AFLinkedListItem object](head, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    v7 = self->_head;
    do
    {
      v8 = v7;
      -[AFLinkedListItem nextItem](v7, "nextItem");
      v7 = (AFLinkedListItem *)objc_claimAutoreleasedReturnValue();

      --v4;
    }
    while (v4);
    -[AFLinkedListItem object](v7, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)enqueueObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFQueue enqueueObjects:](self, "enqueueObjects:", v6, v7, v8);
}

- (void)enqueueObjects:(id)a3
{
  id v4;
  uint64_t v5;
  AFLinkedListItem *v6;
  AFLinkedListItem *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AFLinkedListItem *v13;
  AFLinkedListItem *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (!v5)
    goto LABEL_18;
  v19 = v5;
  v6 = self->_head;
  v7 = self->_tail;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v9)
    goto LABEL_15;
  v10 = v9;
  v11 = *(_QWORD *)v21;
  do
  {
    v12 = 0;
    v13 = v7;
    do
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v8);
      v14 = -[AFLinkedListItem initWithObject:]([AFLinkedListItem alloc], "initWithObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12));
      v7 = v14;
      if (v6)
      {
        if (!v13)
          goto LABEL_10;
LABEL_9:
        -[AFLinkedListItem insertAfterItem:](v7, "insertAfterItem:", v13);
        goto LABEL_10;
      }
      v6 = v14;
      if (v13)
        goto LABEL_9;
LABEL_10:

      ++v12;
      v13 = v7;
    }
    while (v10 != v12);
    v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v10 = v15;
  }
  while (v15);
LABEL_15:

  objc_storeStrong((id *)&self->_head, v6);
  objc_storeStrong((id *)&self->_tail, v7);
  self->_count += v19;
  -[AFQueue delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[AFQueue delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "queue:didEnqueueObjects:", self, v8);

  }
LABEL_18:

}

- (id)dequeueObject
{
  AFLinkedListItem *v3;
  void *v4;
  AFLinkedListItem *v5;
  AFLinkedListItem *v6;
  AFLinkedListItem *v7;
  AFLinkedListItem *head;

  if (self->_count && (v3 = self->_head) != 0)
  {
    -[AFLinkedListItem object](v3, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_head;
    v6 = v5;
    if (self->_tail == v5)
    {
      self->_tail = 0;

    }
    -[AFLinkedListItem nextItem](self->_head, "nextItem");
    v7 = (AFLinkedListItem *)objc_claimAutoreleasedReturnValue();
    head = self->_head;
    self->_head = v7;

    -[AFLinkedListItem removeFromList](v6, "removeFromList");
    --self->_count;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)dequeueAllObjects
{
  void *v3;
  AFLinkedListItem *v4;
  void *v5;
  void *v6;
  id v7;
  AFLinkedListItem *head;
  AFLinkedListItem *tail;

  if (self->_count)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_count);
    v4 = self->_head;
    if (v4)
    {
      v5 = v4;
      do
      {
        objc_msgSend(v5, "object");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v6);

        v7 = v5;
        objc_msgSend(v7, "nextItem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "removeFromList");
      }
      while (v5);
    }
    head = self->_head;
    self->_head = 0;

    tail = self->_tail;
    self->_tail = 0;

    self->_count = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFQueue;
  -[AFQueue description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFQueue _objects](self, "_objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AFQueueDelegate)delegate
{
  return (AFQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

@end
