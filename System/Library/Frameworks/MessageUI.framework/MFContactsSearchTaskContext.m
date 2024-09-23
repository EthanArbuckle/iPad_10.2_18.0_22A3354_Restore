@implementation MFContactsSearchTaskContext

+ (id)contextWithConsumer:(id)a3 text:(id)a4 operations:(id)a5 searchQueries:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_alloc_init((Class)a1);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)v15 + 1, a3);
    v17 = objc_msgSend(v12, "copy");
    v18 = (void *)v16[2];
    v16[2] = v17;

    if (v13)
      v19 = v13;
    else
      v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v20 = (void *)v16[3];
    v16[3] = v19;

    if (v14)
      v21 = v14;
    else
      v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v22 = (void *)v16[4];
    v16[4] = v21;

  }
  return v16;
}

- (BOOL)done
{
  return !-[NSMutableSet count](self->_operations, "count") && -[NSMutableSet count](self->_searchQueries, "count") == 0;
}

- (BOOL)consumerRespondsToCallbacks
{
  char v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_opt_respondsToSelector();
  else
    v2 = 0;
  return v2 & 1;
}

- (MFContactsSearchConsumer)consumer
{
  return self->_consumer;
}

- (NSString)text
{
  return self->_text;
}

- (NSMutableSet)operations
{
  return self->_operations;
}

- (NSMutableSet)searchQueries
{
  return self->_searchQueries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueries, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_consumer, 0);
}

@end
