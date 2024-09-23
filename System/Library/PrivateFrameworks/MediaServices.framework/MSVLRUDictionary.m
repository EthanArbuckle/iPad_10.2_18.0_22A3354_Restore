@implementation MSVLRUDictionary

- (void)pokeKey:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLRUDictionary.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  -[MSVLRUDictionary dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[MSVLRUDictionary _moveNodeToFront:](self, "_moveNodeToFront:", v6);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  MSVLRUDictionaryNode *v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLRUDictionary.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  -[MSVLRUDictionary dictionary](self, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (MSVLRUDictionaryNode *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MSVLRUDictionary _moveNodeToFront:](self, "_moveNodeToFront:", v9);
    -[MSVLRUDictionaryNode setObject:](v9, "setObject:", v18);
  }
  else
  {
    if (!self->_transactionCount)
    {
      -[MSVLRUDictionary dictionary](self, "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      v12 = -[MSVLRUDictionary maximumCapacity](self, "maximumCapacity");

      if (v11 == v12)
      {
        -[MSVLRUDictionary tail](self, "tail");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "prev");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVLRUDictionary _removeNode:](self, "_removeNode:", v14);

      }
    }
    v15 = (void *)objc_msgSend(v7, "copy");
    v9 = -[MSVLRUDictionaryNode initWithKey:object:]([MSVLRUDictionaryNode alloc], "initWithKey:object:", v15, v18);
    -[MSVLRUDictionary dictionary](self, "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, v15);

    -[MSVLRUDictionary _addNodeToFront:](self, "_addNodeToFront:", v9);
  }

}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (id)objectForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLRUDictionary.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  -[MSVLRUDictionary dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MSVLRUDictionary _moveNodeToFront:](self, "_moveNodeToFront:", v7);
    objc_msgSend(v7, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)maximumCapacity
{
  return self->_maximumCapacity;
}

- (void)_removeNodeFromLinkedList:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "prev");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "next");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setNext:", v4);
  objc_msgSend(v4, "setPrev:", v5);

}

- (void)_addNodeToFront:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MSVLRUDictionary head](self, "head");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "next");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[MSVLRUDictionary head](self, "head");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNext:", v4);

  -[MSVLRUDictionary head](self, "head");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrev:", v7);

  objc_msgSend(v4, "setNext:", v8);
  objc_msgSend(v8, "setPrev:", v4);

}

- (MSVLRUDictionaryNode)head
{
  return self->_head;
}

- (void)_moveNodeToFront:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[MSVLRUDictionary head](self, "head");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "next");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[MSVLRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:", v6);
    -[MSVLRUDictionary _addNodeToFront:](self, "_addNodeToFront:", v6);
  }

}

- (MSVLRUDictionaryNode)tail
{
  return self->_tail;
}

- (void)_removeNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MSVLRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:");
  -[MSVLRUDictionary delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionary:willRemoveObject:forKey:", self, v5, v6);

  }
  -[MSVLRUDictionary dictionary](self, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (MSVLRUDictionaryDelegate)delegate
{
  return (MSVLRUDictionaryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)allKeys
{
  return (id)-[NSMutableDictionary allKeys](self->_dictionary, "allKeys");
}

- (void)endTransaction
{
  int64_t transactionCount;
  BOOL v3;
  int64_t v4;

  transactionCount = self->_transactionCount;
  v3 = transactionCount < 1;
  v4 = transactionCount - 1;
  if (!v3)
  {
    self->_transactionCount = v4;
    -[MSVLRUDictionary _shrinkToCapacity](self, "_shrinkToCapacity");
  }
}

- (void)performTransaction:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[MSVLRUDictionary beginTransaction](self, "beginTransaction");
  v4[2](v4);

  -[MSVLRUDictionary endTransaction](self, "endTransaction");
}

- (void)beginTransaction
{
  ++self->_transactionCount;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_shrinkToCapacity
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (self->_transactionCount <= 0)
  {
    while (-[MSVLRUDictionary count](self, "count") > self->_maximumCapacity)
    {
      -[MSVLRUDictionary tail](self, "tail");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "prev");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v5 = 0;
LABEL_8:

        return;
      }
      -[MSVLRUDictionary head](self, "head");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v6;
      if (v6 == v4)
        goto LABEL_8;
      -[MSVLRUDictionary _removeNode:](self, "_removeNode:", v6);

    }
  }
}

- (int64_t)count
{
  return -[NSMutableDictionary count](self->_dictionary, "count");
}

- (MSVLRUDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  MSVLRUDictionary *v5;
  uint64_t v6;
  NSMutableDictionary *dictionary;
  MSVLRUDictionaryNode *v8;
  MSVLRUDictionaryNode *head;
  MSVLRUDictionaryNode *v10;
  MSVLRUDictionaryNode *tail;
  void *v14;
  objc_super v15;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLRUDictionary.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maximumCapacity > 0"));

  }
  v15.receiver = self;
  v15.super_class = (Class)MSVLRUDictionary;
  v5 = -[MSVLRUDictionary init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSMutableDictionary *)v6;

    v5->_maximumCapacity = a3;
    v8 = -[MSVLRUDictionaryNode initWithKey:object:]([MSVLRUDictionaryNode alloc], "initWithKey:object:", 0, 0);
    head = v5->_head;
    v5->_head = v8;

    v10 = -[MSVLRUDictionaryNode initWithKey:object:]([MSVLRUDictionaryNode alloc], "initWithKey:object:", 0, 0);
    tail = v5->_tail;
    v5->_tail = v10;

    -[MSVLRUDictionaryNode setNext:](v5->_head, "setNext:", v5->_tail);
    -[MSVLRUDictionaryNode setPrev:](v5->_tail, "setPrev:", v5->_head);
    v5->_transactionCount = 0;
  }
  return v5;
}

- (void)setMaximumCapacity:(int64_t)a3
{
  void *v6;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLRUDictionary.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maximumCapacity >= 0"));

  }
  self->_maximumCapacity = a3;
  -[MSVLRUDictionary _shrinkToCapacity](self, "_shrinkToCapacity");
}

- (id)allValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_dictionary, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_dictionary, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "object");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)peekObjectForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLRUDictionary.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  -[MSVLRUDictionary dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MSVLRUDictionary dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[MSVLRUDictionary _removeNode:](self, "_removeNode:", v7);
    v6 = v7;
  }

}

- (void)removeAllObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MSVLRUDictionary dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[MSVLRUDictionary tail](self, "tail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLRUDictionary head](self, "head");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNext:", v4);

  -[MSVLRUDictionary head](self, "head");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVLRUDictionary tail](self, "tail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrev:", v7);

}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v11 = 0;
  -[MSVLRUDictionary head](self, "head");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "next");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  while (1)
  {
    -[MSVLRUDictionary tail](self, "tail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      break;
    objc_msgSend(v6, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8, v9, &v11);

    objc_msgSend(v6, "next");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v10;
    if (v11)
      goto LABEL_6;
  }
  v10 = v6;
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  MSVLRUDictionary *v4;
  uint64_t v5;
  NSMutableDictionary *dictionary;
  uint64_t v7;
  MSVLRUDictionaryNode *head;
  uint64_t v9;
  MSVLRUDictionaryNode *tail;

  v4 = -[MSVLRUDictionary initWithMaximumCapacity:]([MSVLRUDictionary alloc], "initWithMaximumCapacity:", -[MSVLRUDictionary maximumCapacity](self, "maximumCapacity"));
  v5 = -[NSMutableDictionary mutableCopy](self->_dictionary, "mutableCopy");
  dictionary = v4->_dictionary;
  v4->_dictionary = (NSMutableDictionary *)v5;

  v7 = -[MSVLRUDictionaryNode copy](self->_head, "copy");
  head = v4->_head;
  v4->_head = (MSVLRUDictionaryNode *)v7;

  v9 = -[MSVLRUDictionaryNode copy](self->_tail, "copy");
  tail = v4->_tail;
  v4->_tail = (MSVLRUDictionaryNode *)v9;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = -[NSMutableDictionary isEqual:](self->_dictionary, "isEqual:", v4[3]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_dictionary, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  MSVLRUDictionaryNode *v5;
  void *v6;
  void *v7;
  MSVLRUDictionaryNode *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>{\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLRUDictionary head](self, "head");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "next");
  v5 = (MSVLRUDictionaryNode *)objc_claimAutoreleasedReturnValue();

  if (v5 == self->_tail)
  {
    v8 = v5;
  }
  else
  {
    do
    {
      -[MSVLRUDictionaryNode key](v5, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSVLRUDictionaryNode object](v5, "object");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t%@ = %@;\n"), v6, v7);

      -[MSVLRUDictionaryNode next](v5, "next");
      v8 = (MSVLRUDictionaryNode *)objc_claimAutoreleasedReturnValue();

      v5 = v8;
    }
    while (v8 != self->_tail);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}\n"));

  return v3;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void)setHead:(id)a3
{
  objc_storeStrong((id *)&self->_head, a3);
}

- (void)setTail:(id)a3
{
  objc_storeStrong((id *)&self->_tail, a3);
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(int64_t)a3
{
  self->_transactionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
