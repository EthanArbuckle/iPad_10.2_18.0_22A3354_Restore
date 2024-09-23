@implementation SYStoreDeltaSessionOwner

- (SYStoreDeltaSessionOwner)initWithChanges:(id)a3
{
  id v4;
  SYStoreDeltaSessionOwner *v5;
  uint64_t v6;
  NSArray *changes;
  SYStoreDeltaSessionOwner *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SYStoreDeltaSessionOwner;
  v5 = -[SYStoreDeltaSessionOwner init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    changes = v5->_changes;
    v5->_changes = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)changeCount
{
  return -[NSArray count](self->_changes, "count");
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t (**v8)(id, void *);
  unint64_t currentIdx;
  NSUInteger v10;
  unint64_t v11;
  NSUInteger v12;
  void *v13;
  char v14;
  unsigned int v15;

  v7 = a3;
  v8 = (uint64_t (**)(id, void *))a4;
  currentIdx = self->_currentIdx;
  if (currentIdx >= -[NSArray count](self->_changes, "count"))
  {
    v15 = 2;
  }
  else
  {
    v10 = -[NSArray count](self->_changes, "count");
    v11 = self->_currentIdx;
    if (v11 < v10)
    {
      v12 = v10;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_changes, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v8[2](v8, v13);

        if ((v14 & 1) == 0)
          break;
        v11 = self->_currentIdx + 1;
        self->_currentIdx = v11;
        if (v11 >= v12)
          goto LABEL_11;
      }
      if (objc_msgSend(v7, "state") == 5)
      {
        v15 = 5;
        goto LABEL_14;
      }
      v11 = self->_currentIdx;
    }
LABEL_11:
    if (v11 < -[NSArray count](self->_changes, "count"))
      v15 = 1;
    else
      v15 = 2;
  }
LABEL_14:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
