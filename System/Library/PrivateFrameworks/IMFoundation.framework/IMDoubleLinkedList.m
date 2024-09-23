@implementation IMDoubleLinkedList

- (IMDoubleLinkedList)init
{
  IMDoubleLinkedList *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDoubleLinkedList;
  result = -[IMDoubleLinkedList init](&v3, sel_init);
  if (result)
    result->_count = 0;
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_removeAllObjects(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMDoubleLinkedList;
  -[IMDoubleLinkedList dealloc](&v5, sel_dealloc);
}

- (void)appendObject:(id)a3
{
  id v4;
  IMDoubleLinkedListNode *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = [IMDoubleLinkedListNode alloc];
  v10 = (id)objc_msgSend_initWithObject_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend_appendLinkedListNode_(self, v8, (uint64_t)v10, v9);
}

- (void)pushObject:(id)a3
{
  id v4;
  IMDoubleLinkedListNode *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = [IMDoubleLinkedListNode alloc];
  v10 = (id)objc_msgSend_initWithObject_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend_pushLinkedListNode_(self, v8, (uint64_t)v10, v9);
}

- (id)popObject
{
  uint64_t v2;
  uint64_t v3;
  IMDoubleLinkedListNode *last;
  void *v6;

  last = self->_last;
  if (last)
  {
    objc_msgSend_object(last, a2, v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend_removeLinkedListNode_(self, a2, (uint64_t)self->_last, v3);
  return v6;
}

- (void)appendLinkedListNode:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void (*v17)(void *);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  IMDoubleLinkedListNode *last;
  uint64_t *p_last;
  const char *v27;
  uint64_t v28;
  IMDoubleLinkedListNode **p_first;
  const char *v30;
  uint64_t v31;
  IMDoubleLinkedListNode *first;
  const char *v33;
  uint64_t v34;
  _OWORD v35[2];
  uint64_t v36;

  v7 = a3;
  if (!v7)
  {
    v35[0] = xmmword_1E2C44478;
    v35[1] = *(_OWORD *)off_1E2C44488;
    v36 = 82;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = IMFileLocationTrimFileName(v35);
    v10 = v36;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)&stru_1E2C46CC8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v8, v14, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), v15, CFSTR("node"), "-[IMDoubleLinkedList appendLinkedListNode:]", v9, v10, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v17)
      v17(v16);
    else
      _IMWarn(CFSTR("ASSERTION FAILED: %@"), v18, v19, v20, v21, v22, v23, v24, (char)v16);

  }
  p_last = (uint64_t *)&self->_last;
  last = self->_last;
  if (last)
  {
    objc_msgSend_setNext_(last, v5, (uint64_t)v7, v6);
    objc_msgSend_setPrev_(v7, v27, *p_last, v28);
    p_first = &self->_last;
  }
  else
  {
    objc_storeStrong((id *)&self->_last, a3);
    first = self->_first;
    if (first)
    {
      objc_msgSend_setNext_(first, v30, *p_last, v31);
      objc_msgSend_setPrev_((void *)*p_last, v33, (uint64_t)self->_first, v34);
      goto LABEL_11;
    }
    p_first = &self->_first;
  }
  objc_storeStrong((id *)p_first, a3);
LABEL_11:
  ++self->_count;

}

- (void)pushLinkedListNode:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void (*v17)(void *);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  IMDoubleLinkedListNode *first;
  uint64_t *p_first;
  const char *v27;
  uint64_t v28;
  IMDoubleLinkedListNode **p_last;
  const char *v30;
  uint64_t v31;
  IMDoubleLinkedListNode *last;
  const char *v33;
  uint64_t v34;
  _OWORD v35[2];
  uint64_t v36;

  v7 = a3;
  if (!v7)
  {
    v35[0] = xmmword_1E2C444A0;
    v35[1] = *(_OWORD *)off_1E2C444B0;
    v36 = 102;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = IMFileLocationTrimFileName(v35);
    v10 = v36;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)&stru_1E2C46CC8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v8, v14, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), v15, CFSTR("node"), "-[IMDoubleLinkedList pushLinkedListNode:]", v9, v10, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v17)
      v17(v16);
    else
      _IMWarn(CFSTR("ASSERTION FAILED: %@"), v18, v19, v20, v21, v22, v23, v24, (char)v16);

  }
  p_first = (uint64_t *)&self->_first;
  first = self->_first;
  if (first)
  {
    objc_msgSend_setPrev_(first, v5, (uint64_t)v7, v6);
    objc_msgSend_setNext_(v7, v27, *p_first, v28);
    p_last = &self->_first;
  }
  else
  {
    objc_storeStrong((id *)&self->_first, a3);
    last = self->_last;
    if (last)
    {
      objc_msgSend_setPrev_(last, v30, *p_first, v31);
      objc_msgSend_setNext_((void *)*p_first, v33, (uint64_t)self->_last, v34);
      goto LABEL_11;
    }
    p_last = &self->_last;
  }
  objc_storeStrong((id *)p_last, a3);
LABEL_11:
  ++self->_count;

}

- (void)removeLinkedListNode:(id)a3
{
  IMDoubleLinkedListNode *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  IMDoubleLinkedListNode *v8;
  IMDoubleLinkedListNode *v9;
  IMDoubleLinkedListNode *first;
  IMDoubleLinkedListNode *v11;
  IMDoubleLinkedListNode *last;
  const char *v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void (*v24)(void *);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD v32[2];
  uint64_t v33;

  v4 = (IMDoubleLinkedListNode *)a3;
  v8 = v4;
  if (v4)
  {
    if (self->_first == v4)
    {
      objc_msgSend_next(v4, v5, v6, v7);
      v9 = (IMDoubleLinkedListNode *)objc_claimAutoreleasedReturnValue();
      first = self->_first;
      self->_first = v9;

    }
    if (self->_last == v8)
    {
      objc_msgSend_prev(v8, v5, v6, v7);
      v11 = (IMDoubleLinkedListNode *)objc_claimAutoreleasedReturnValue();
      last = self->_last;
      self->_last = v11;

    }
    objc_msgSend_removeFromList(v8, v5, v6, v7);
    objc_msgSend_setObject_(v8, v13, 0, v14);
    --self->_count;
  }
  else
  {
    v32[0] = xmmword_1E2C444C8;
    v32[1] = *(_OWORD *)off_1E2C444D8;
    v33 = 122;
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = IMFileLocationTrimFileName(v32);
    v17 = v33;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)&stru_1E2C46CC8, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v15, v21, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), v22, CFSTR("node"), "-[IMDoubleLinkedList removeLinkedListNode:]", v16, v17, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v24)
      v24(v23);
    else
      _IMWarn(CFSTR("ASSERTION FAILED: %@"), v25, v26, v27, v28, v29, v30, v31, (char)v23);

  }
}

- (void)removeAllObjects
{
  IMDoubleLinkedListNode *first;
  IMDoubleLinkedListNode *v4;
  IMDoubleLinkedListNode *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  IMDoubleLinkedListNode *v12;
  IMDoubleLinkedListNode *last;

  first = self->_first;
  if (first)
  {
    v4 = first;
    do
    {
      v5 = v4;
      objc_msgSend_next(v5, v6, v7, v8);
      v4 = (IMDoubleLinkedListNode *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_orphan(v5, v9, v10, v11);
    }
    while (v4);
    v12 = self->_first;
    self->_first = 0;

    last = self->_last;
    self->_last = 0;

    self->_count = 0;
  }
}

- (id)allObjects
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  IMDoubleLinkedListNode *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (self->_count)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v6 = (void *)objc_msgSend_initWithCapacity_(v3, v4, self->_count, v5);
    v7 = self->_first;
    if (v7)
    {
      v11 = v7;
      do
      {
        objc_msgSend_object(v11, v8, v9, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v6, v13, (uint64_t)v12, v14);

        objc_msgSend_next(v11, v15, v16, v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v18;
      }
      while (v18);
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  IMDoubleLinkedListNode *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v8 = self->_first;
  if (v8)
  {
    while (1)
    {
      objc_msgSend_object(v8, v5, v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      if ((id)v9 == v4)
        break;
      v12 = (void *)v9;
      if (objc_msgSend_isEqual_(v4, v10, v9, v11))
        goto LABEL_7;
      objc_msgSend_next(v8, v13, v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v8 = (IMDoubleLinkedListNode *)v16;
      if (!v16)
        goto LABEL_8;
    }
    v12 = v4;
LABEL_7:

    LOBYTE(v8) = 1;
  }
LABEL_8:

  return (char)v8;
}

- (IMDoubleLinkedListNode)first
{
  return (IMDoubleLinkedListNode *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFirst:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (IMDoubleLinkedListNode)last
{
  return (IMDoubleLinkedListNode *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLast:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_last, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end
