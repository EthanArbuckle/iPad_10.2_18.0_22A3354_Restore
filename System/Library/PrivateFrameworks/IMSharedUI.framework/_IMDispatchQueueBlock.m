@implementation _IMDispatchQueueBlock

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  objc_super v19;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_block(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_priority(self, v9, v10);
  v14 = objc_msgSend_fifo(self, v12, v13);
  v19.receiver = self;
  v19.super_class = (Class)_IMDispatchQueueBlock;
  -[_IMDispatchQueueBlock description](&v19, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v16, (uint64_t)CFSTR("[_IMDispatchQueueBlock block:%@ key:%@ priority:%ld fifo:%ld %@]"), v5, v8, v11, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (_IMDispatchQueueBlock)initWithBlock:(id)a3 key:(id)a4 priority:(int64_t)a5 fifo:(unint64_t)a6
{
  id v10;
  id v11;
  _IMDispatchQueueBlock *v12;
  const char *v13;
  _IMDispatchQueueBlock *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_IMDispatchQueueBlock;
  v12 = -[_IMDispatchQueueBlock init](&v19, sel_init);
  v14 = v12;
  if (v12)
  {
    objc_msgSend_setBlock_(v12, v13, (uint64_t)v10);
    objc_msgSend_setKey_(v14, v15, (uint64_t)v11);
    objc_msgSend_setPriority_(v14, v16, a5);
    objc_msgSend_setFIFO_(v14, v17, a6);
  }

  return v14;
}

- (int64_t)compare:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v4 = a3;
  v7 = objc_msgSend_priority(self, v5, v6);
  v10 = objc_msgSend_priority(v4, v8, v9);
  if (v7 <= v10)
  {
    if (v7 < v10)
    {
      v13 = 1;
    }
    else
    {
      v14 = objc_msgSend_fifo(self, v11, v12);
      v17 = objc_msgSend_fifo(v4, v15, v16);
      if (v14 >= v17)
        v18 = 0;
      else
        v18 = -1;
      if (v14 > v17)
        v13 = 1;
      else
        v13 = v18;
    }
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (void)cancel
{
  objc_msgSend_setBlock_(self, a2, 0);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)fifo
{
  return self->_fifo;
}

- (void)setFIFO:(unint64_t)a3
{
  self->_fifo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
