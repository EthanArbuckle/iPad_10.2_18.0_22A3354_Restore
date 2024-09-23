@implementation CPLRUDictionary

- (void)_removeNodeFromLinkedList:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v4 = *((_QWORD *)a3 + 3);
  v3 = *((_QWORD *)a3 + 4);
  *(_QWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v4 + 32) = v3;
}

- (void)_removeNode:(id)a3
{
  -[CPLRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:");
  CFDictionaryRemoveValue(self->_dictionary, (const void *)objc_msgSend(a3, "key"));
}

- (void)_moveNodeToFront:(id)a3
{
  if (self->_head->next != a3)
  {
    -[CPLRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:");
    -[CPLRUDictionary _addNodeToFront:](self, "_addNodeToFront:", a3);
  }
}

- (void)_addNodeToFront:(id)a3
{
  CPLRUDictionaryNode *head;
  CPLRUDictionaryNode *next;
  CPLRUDictionaryNode *v5;

  head = self->_head;
  next = head->next;
  head->next = (CPLRUDictionaryNode *)a3;
  v5 = self->_head;
  *((_QWORD *)a3 + 3) = next;
  *((_QWORD *)a3 + 4) = v5;
  next->prev = (CPLRUDictionaryNode *)a3;
}

+ (id)dictionaryWithMaximumCapacity:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMaximumCapacity:", a3);
}

- (CPLRUDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  CPLRUDictionary *v5;
  CPLRUDictionaryNode *v6;
  objc_super v8;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CPLRUDictionary.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxCount > 0"));
  v8.receiver = self;
  v8.super_class = (Class)CPLRUDictionary;
  v5 = -[CPLRUDictionary init](&v8, sel_init);
  if (v5)
  {
    v5->_dictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5->_maxCount = a3;
    v5->_head = -[CPLRUDictionaryNode initWithKey:object:]([CPLRUDictionaryNode alloc], "initWithKey:object:", 0, 0);
    v6 = -[CPLRUDictionaryNode initWithKey:object:]([CPLRUDictionaryNode alloc], "initWithKey:object:", 0, 0);
    v5->_tail = v6;
    v5->_head->next = v6;
    v5->_tail->prev = v5->_head;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_dictionary);

  v3.receiver = self;
  v3.super_class = (Class)CPLRUDictionary;
  -[CPLRUDictionary dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  CPLRUDictionaryNode *i;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>{\n"), objc_opt_class(), self);
  for (i = self->_head->next; i != self->_tail; i = i->next)
    objc_msgSend(v3, "appendFormat:", CFSTR("\t%@ = %@;\n"),
      -[CPLRUDictionaryNode key](i, "key"),
      -[CPLRUDictionaryNode object](i, "object"));
  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_dictionary);
}

- (id)allKeys
{
  return (id)-[__CFDictionary allKeys](self->_dictionary, "allKeys");
}

- (id)objectForKey:(id)a3
{
  id result;
  id v5;

  result = (id)CFDictionaryGetValue(self->_dictionary, a3);
  if (result)
  {
    v5 = result;
    -[CPLRUDictionary _moveNodeToFront:](self, "_moveNodeToFront:", result);
    return (id)objc_msgSend(v5, "object");
  }
  return result;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  void *Value;
  void *v8;
  CPLRUDictionaryNode *v9;
  void *key;

  Value = (void *)CFDictionaryGetValue(self->_dictionary, a4);
  if (Value)
  {
    v8 = Value;
    -[CPLRUDictionary _moveNodeToFront:](self, "_moveNodeToFront:", Value);
    objc_msgSend(v8, "setObject:", a3);
  }
  else
  {
    if (CFDictionaryGetCount(self->_dictionary) == self->_maxCount)
      -[CPLRUDictionary _removeNode:](self, "_removeNode:", self->_tail->prev);
    key = (void *)objc_msgSend(a4, "copyWithZone:", 0);
    v9 = -[CPLRUDictionaryNode initWithKey:object:]([CPLRUDictionaryNode alloc], "initWithKey:object:", key, a3);
    CFDictionaryAddValue(self->_dictionary, key, v9);
    -[CPLRUDictionary _addNodeToFront:](self, "_addNodeToFront:", v9);

  }
}

- (void)removeObjectForKey:(id)a3
{
  const void *Value;

  Value = CFDictionaryGetValue(self->_dictionary, a3);
  if (Value)
    -[CPLRUDictionary _removeNode:](self, "_removeNode:", Value);
}

- (void)removeAllObjects
{
  CFDictionaryRemoveAllValues(self->_dictionary);
  self->_head->next = self->_tail;
  self->_tail->prev = self->_head;
}

- (unint64_t)linkedListCount
{
  CPLRUDictionaryNode *head;
  CPLRUDictionaryNode *tail;
  unint64_t result;

  head = self->_head;
  tail = self->_tail;
  result = -1;
  do
  {
    head = head->next;
    ++result;
  }
  while (head != tail);
  return result;
}

- (id)allKeysInLRUOrder
{
  void *v3;
  CPLRUDictionaryNode *i;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = self->_head->next; i != self->_tail; i = i->next)
    objc_msgSend(v3, "addObject:", -[CPLRUDictionaryNode key](i, "key"));
  return v3;
}

- (id)allValuesInLRUOrder
{
  void *v3;
  CPLRUDictionaryNode *i;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = self->_head->next; i != self->_tail; i = i->next)
    objc_msgSend(v3, "addObject:", -[CPLRUDictionaryNode object](i, "object"));
  return v3;
}

- (id)objectForKeyWithoutAffectingLRU:(id)a3
{
  return (id)objc_msgSend((id)CFDictionaryGetValue(self->_dictionary, a3), "object");
}

@end
