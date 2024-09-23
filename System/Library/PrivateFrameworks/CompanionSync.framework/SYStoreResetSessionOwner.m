@implementation SYStoreResetSessionOwner

- (SYStoreResetSessionOwner)init
{
  SYStoreResetSessionOwner *v2;
  uint64_t v3;
  NSMutableArray *buffer;
  SYStoreResetSessionOwner *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SYStoreResetSessionOwner;
  v2 = -[SYStoreResetSessionOwner init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    buffer = v2->_buffer;
    v2->_buffer = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)isResetSync
{
  return 1;
}

- (unsigned)_sendBufferedChanges:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  unsigned int bufferedState;
  unint64_t v15;
  NSMutableArray *buffer;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_buffer;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10)))
        {
          v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  -[SYStoreSessionOwner session](self, "session", (_QWORD)v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "state");

  if (v13 == 5)
  {
    bufferedState = 5;
  }
  else
  {
    v15 = -[NSMutableArray count](self->_buffer, "count");
    buffer = self->_buffer;
    if (v11 >= v15)
    {
      -[NSMutableArray removeAllObjects](buffer, "removeAllObjects");
      bufferedState = self->_bufferedState;
    }
    else
    {
      -[NSMutableArray removeObjectsInRange:](buffer, "removeObjectsInRange:", 0, v11);
      bufferedState = 1;
    }
  }

  return bufferedState;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  uint64_t (**v6)(id, void *);
  unsigned int v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (**)(id, void *))a4;
  if (-[NSMutableArray count](self->_buffer, "count"))
  {
    v7 = -[SYStoreResetSessionOwner _sendBufferedChanges:](self, "_sendBufferedChanges:", v6);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    v9 = 3;
    switch((*((uint64_t (**)(void))self->_fetchNextBatch + 2))())
    {
      case 1:
        v9 = 2;
        goto LABEL_6;
      case 2:
        break;
      case 3:
        v9 = 4;
        break;
      case 4:
        v9 = 5;
        break;
      default:
        v9 = 1;
LABEL_6:
        if (objc_msgSend(v8, "count"))
        {
          v21 = v9;
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v23 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
                -[SYStoreSessionOwner store](self, "store");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v15, 0, v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if ((v6[2](v6, v17) & 1) == 0)
                  -[NSMutableArray addObject:](self->_buffer, "addObject:", v17);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            }
            while (v12);
          }

          v9 = v21;
        }
        break;
    }
    -[SYStoreSessionOwner session](self, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "state");

    if (v19 == 5)
      v7 = 5;
    else
      v7 = v9;

  }
  return v7;
}

- (id)fetchNextBatch
{
  return self->_fetchNextBatch;
}

- (void)setFetchNextBatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchNextBatch, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
