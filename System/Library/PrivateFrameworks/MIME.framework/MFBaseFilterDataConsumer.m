@implementation MFBaseFilterDataConsumer

+ (id)filterWithConsumers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConsumers:", v4);

  return v5;
}

+ (id)filterWithConsumer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConsumer:", v4);

  return v5;
}

- (MFBaseFilterDataConsumer)initWithConsumers:(id)a3
{
  id v4;
  MFBaseFilterDataConsumer *v5;
  uint64_t v6;
  NSMutableArray *consumers;

  v4 = a3;
  v5 = -[MFBaseFilterDataConsumer init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    consumers = v5->_consumers;
    v5->_consumers = (NSMutableArray *)v6;

  }
  return v5;
}

- (MFBaseFilterDataConsumer)initWithConsumer:(id)a3
{
  void *v4;
  MFBaseFilterDataConsumer *v5;
  id v7;

  v7 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v7, 1);
  v5 = -[MFBaseFilterDataConsumer initWithConsumers:](self, "initWithConsumers:", v4);

  return v5;
}

- (int64_t)appendData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v10;
  uint64_t v11;
  MFData *v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (!self->_serialAppend)
  {
    v15 = -[NSMutableArray count](self->_consumers, "count");
    if (v15 < 1)
    {
      v8 = 0;
      goto LABEL_27;
    }
    v8 = 0;
    v16 = v15 + 1;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_consumers, "objectAtIndex:", v16 - 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "appendData:", v4);
      v18 = v17;
      if (v17)
      {
        if (v17 < 0)
        {
          -[NSMutableArray removeObjectAtIndex:](self->_consumers, "removeObjectAtIndex:", v16 - 2);
          v8 = v18;
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        objc_msgSend(v10, "done");
        -[NSMutableArray removeObjectAtIndex:](self->_consumers, "removeObjectAtIndex:", v16 - 2);
      }
      if (!v8)
        v8 = objc_msgSend(v4, "length");

      if ((unint64_t)--v16 <= 1)
        goto LABEL_27;
    }
  }
  v6 = v5;
  v7 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
  v8 = 0;
  while (-[NSMutableArray count](self->_consumers, "count") && v6 != v8)
  {
    -[NSMutableArray objectAtIndex:](self->_consumers, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6 - v8;
    v12 = -[MFData initWithBytesNoCopy:length:freeWhenDone:]([MFData alloc], "initWithBytesNoCopy:length:freeWhenDone:", v7 + v8, v6 - v8, 0);
    v13 = objc_msgSend(v10, "appendData:", v12);
    v14 = v13;
    if (v13)
    {
      if (v13 < 0)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_consumers, "removeObjectAtIndex:", 0);
        v8 = v14;
LABEL_24:

        goto LABEL_26;
      }
      v8 += v13;
      if (v13 < v11)
        goto LABEL_24;
    }
    else
    {
      objc_msgSend(v10, "done");
      -[NSMutableArray removeObjectAtIndex:](self->_consumers, "removeObjectAtIndex:", 0);
    }

  }
LABEL_27:

  return v8;
}

- (void)done
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_consumers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v8 != v5)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "done", (_QWORD)v7);
      if (self->_serialAppend)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)isSerialAppend
{
  return self->_serialAppend;
}

- (void)setSerialAppend:(BOOL)a3
{
  self->_serialAppend = a3;
}

- (NSArray)consumers
{
  return &self->_consumers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumers, 0);
}

@end
