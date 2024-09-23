@implementation AXSSRingBuffer

- (AXSSRingBuffer)initWithSize:(int64_t)a3
{
  AXSSRingBuffer *v4;
  AXSSRingBuffer *v5;
  uint64_t v6;
  NSMutableArray *storage;
  uint64_t v8;
  NSLock *lock;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXSSRingBuffer;
  v4 = -[AXSSRingBuffer init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_size = a3;
    v6 = objc_opt_new();
    storage = v5->_storage;
    v5->_storage = (NSMutableArray *)v6;

    v5->_lastEntryIndex = -1;
    v8 = objc_opt_new();
    lock = v5->_lock;
    v5->_lock = (NSLock *)v8;

  }
  return v5;
}

- (AXSSRingBuffer)init
{
  return -[AXSSRingBuffer initWithSize:](self, "initWithSize:", 10);
}

- (int64_t)addObject:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    -[AXSSRingBuffer lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    v6 = -[AXSSRingBuffer lastEntryIndex](self, "lastEntryIndex");
    if (v6 + 1 < -[AXSSRingBuffer size](self, "size"))
      v7 = v6 + 1;
    else
      v7 = 0;
    -[AXSSRingBuffer storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[AXSSRingBuffer storage](self, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7 == v9)
    {
      objc_msgSend(v10, "addObject:", v4);
    }
    else
    {
      v12 = objc_msgSend(v10, "count");

      if (v7 >= v12)
      {
LABEL_11:
        -[AXSSRingBuffer setLastEntryIndex:](self, "setLastEntryIndex:", v7);
        -[AXSSRingBuffer lock](self, "lock");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unlock");

        goto LABEL_12;
      }
      -[AXSSRingBuffer storage](self, "storage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v7, v4);
    }

    goto LABEL_11;
  }
  v7 = -1;
LABEL_12:

  return v7;
}

- (id)objectAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[AXSSRingBuffer lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (a3 < 0
    || (-[AXSSRingBuffer storage](self, "storage"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7 <= a3))
  {
    v9 = 0;
  }
  else
  {
    -[AXSSRingBuffer storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AXSSRingBuffer lock](self, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  return v9;
}

- (int64_t)currentFilledSize
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  -[AXSSRingBuffer lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[AXSSRingBuffer storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[AXSSRingBuffer lock](self, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return v5;
}

- (void)clear
{
  void *v3;
  void *v4;
  id v5;

  -[AXSSRingBuffer lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_opt_new();
  -[AXSSRingBuffer setStorage:](self, "setStorage:", v4);

  -[AXSSRingBuffer setLastEntryIndex:](self, "setLastEntryIndex:", -1);
  -[AXSSRingBuffer lock](self, "lock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXSSRingBuffer;
  -[AXSSRingBuffer description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AXSSRingBuffer lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = -[AXSSRingBuffer size](self, "size");
  -[AXSSRingBuffer storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = -[AXSSRingBuffer lastEntryIndex](self, "lastEntryIndex");
  -[AXSSRingBuffer storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Size:%li filledSize:%li, latestEntry:%li, contents: %@"), v6, v8, v9, v10);

  -[AXSSRingBuffer lock](self, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

  return v4;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (NSMutableArray)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (int64_t)lastEntryIndex
{
  return self->_lastEntryIndex;
}

- (void)setLastEntryIndex:(int64_t)a3
{
  self->_lastEntryIndex = a3;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
