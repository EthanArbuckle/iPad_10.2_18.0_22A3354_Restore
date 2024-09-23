@implementation MTRAsyncWorkItem

- (MTRAsyncWorkItem)initWithQueue:(id)a3
{
  id v5;
  MTRAsyncWorkItem *v6;
  MTRAsyncWorkItem *v7;
  unint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTRAsyncWorkItem;
  v6 = -[MTRAsyncWorkItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    do
      v8 = __ldaxr(&qword_256157910);
    while (__stlxr(v8 + 1, &qword_256157910));
    v6->_uniqueID = v8;
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_state = 0;
  }

  return v7;
}

- (void)setReadyHandler:(id)a3
{
  void *v4;
  id readyHandler;

  v4 = (void *)MEMORY[0x23493EEA8](a3, a2);
  readyHandler = self->_readyHandler;
  self->_readyHandler = v4;

}

- (void)setCancelHandler:(id)a3
{
  void *v4;
  id cancelHandler;

  v4 = (void *)MEMORY[0x23493EEA8](a3, a2);
  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = v4;

}

- (void)setBatchingID:(unint64_t)a3 data:(id)a4 handler:(id)a5
{
  id v8;
  void *v9;
  id batchingHandler;
  id v11;

  self->_batchingID = a3;
  objc_storeStrong(&self->_batchableData, a4);
  v11 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x23493EEA8]();

  batchingHandler = self->_batchingHandler;
  self->_batchingHandler = v9;

}

- (void)setDuplicateTypeID:(unint64_t)a3 handler:(id)a4
{
  void *v5;
  id duplicateCheckHandler;

  self->_duplicateTypeID = a3;
  v5 = (void *)MEMORY[0x23493EEA8](a4, a2);
  duplicateCheckHandler = self->_duplicateCheckHandler;
  self->_duplicateCheckHandler = v5;

}

- (id)description
{
  unint64_t state;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;

  state = self->_state;
  if (state >= 3)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = objc_opt_class();
    v11 = self->_state;
    v12 = v11 >= 3;
    v13 = v11 - 3;
    if (!v12)
      v13 = 0;
    objc_msgSend_stringWithFormat_(v8, v10, (uint64_t)CFSTR("<%@ %llu running retry: %ld>"), v9, self->_uniqueID, v13);
  }
  else
  {
    v4 = off_2505022C0[state];
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("<%@ %llu %@>"), v6, self->_uniqueID, v4);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (id)readyHandler
{
  return self->_readyHandler;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (unint64_t)batchingID
{
  return self->_batchingID;
}

- (id)batchableData
{
  return self->_batchableData;
}

- (id)batchingHandler
{
  return self->_batchingHandler;
}

- (unint64_t)duplicateTypeID
{
  return self->_duplicateTypeID;
}

- (id)duplicateCheckHandler
{
  return self->_duplicateCheckHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_duplicateCheckHandler, 0);
  objc_storeStrong(&self->_batchingHandler, 0);
  objc_storeStrong(&self->_batchableData, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_readyHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
