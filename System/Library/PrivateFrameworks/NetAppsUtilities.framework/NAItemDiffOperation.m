@implementation NAItemDiffOperation

- (NAItemDiffOperation)initWithOperationType:(unint64_t)a3 item:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  NAItemDiffOperation *v14;
  NAItemDiffOperation *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NAItemDiffOperation;
  v14 = -[NAItemDiffOperation init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong(&v14->_item, a4);
    objc_storeStrong((id *)&v15->_fromIndexPath, a5);
    objc_storeStrong((id *)&v15->_toIndexPath, a6);
  }

  return v15;
}

+ (id)insertOperationWithItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOperationType:item:fromIndexPath:toIndexPath:", 1, v7, 0, v6);

  return v8;
}

+ (id)deleteOperationWithItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOperationType:item:fromIndexPath:toIndexPath:", 2, v7, v6, 0);

  return v8;
}

+ (id)moveOperationWithItem:(id)a3 fromIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOperationType:item:fromIndexPath:toIndexPath:", 3, v10, v9, v8);

  return v11;
}

+ (id)reloadOperationWithItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOperationType:item:fromIndexPath:toIndexPath:", 0, v7, v6, v6);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NAItemDiffOperation *v4;
  NAItemDiffOperation *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v4 = (NAItemDiffOperation *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NAItemDiffOperation type](self, "type");
      if (v6 != -[NAItemDiffOperation type](v5, "type"))
      {
        v15 = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[NAItemDiffOperation item](self, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NAItemDiffOperation item](v5, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqual:", v8))
      {
        v15 = 0;
LABEL_23:

        goto LABEL_24;
      }
      -[NAItemDiffOperation fromIndexPath](self, "fromIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NAItemDiffOperation fromIndexPath](v5, "fromIndexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {

      }
      else
      {
        if (!v11)
        {
          v15 = 0;
          v18 = v12;
LABEL_21:

          goto LABEL_22;
        }
        v14 = objc_msgSend(v11, "isEqual:", v12);

        if (!v14)
        {
          v15 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      -[NAItemDiffOperation toIndexPath](self, "toIndexPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NAItemDiffOperation toIndexPath](v5, "toIndexPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      v19 = v17;
      if (v18 == v19)
      {
        v15 = 1;
      }
      else if (v18)
      {
        v15 = objc_msgSend(v18, "isEqual:", v19);
      }
      else
      {
        v15 = 0;
      }

      goto LABEL_21;
    }
    v15 = 0;
  }
LABEL_25:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[NAItemDiffOperation type](self, "type");
  -[NAItemDiffOperation item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[NAItemDiffOperation fromIndexPath](self, "fromIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[NAItemDiffOperation toIndexPath](self, "toIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = ((v7 << 8) ^ (v5 << 16) ^ objc_msgSend(v8, "hash")) + v3;

  return v9;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NAItemDiffOperation _operationDescriptionWithVerboseType:](self, "_operationDescriptionWithVerboseType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)operationDescription
{
  return (NSString *)-[NAItemDiffOperation _operationDescriptionWithVerboseType:](self, "_operationDescriptionWithVerboseType:", 1);
}

- (id)_operationDescriptionWithVerboseType:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v3 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__NAItemDiffOperation__operationDescriptionWithVerboseType___block_invoke;
  v12[3] = &unk_1E6228020;
  v12[4] = self;
  __60__NAItemDiffOperation__operationDescriptionWithVerboseType___block_invoke((uint64_t)v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NAItemDiffOperation type](self, "type");
  if (v6 <= 3)
  {
    v7 = off_1E6228898[v6];
    if (!v3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v7 = CFSTR("(unknown operation type)");
  if (v3)
  {
LABEL_5:
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR(" item"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[NAItemDiffOperation item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@ \"%@\"), v7, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __60__NAItemDiffOperation__operationDescriptionWithVerboseType___block_invoke(uint64_t a1)
{
  void *v1;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v3 < 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "toIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v5 = v9;
    _NAStandardIndexPathDescription(v9);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "fromIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v3 == 3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "fromIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _NAStandardIndexPathDescription(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "toIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _NAStandardIndexPathDescription(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ -> %@"), v6, v8);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  }
  return v1;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)item
{
  return self->_item;
}

- (NSIndexPath)fromIndexPath
{
  return self->_fromIndexPath;
}

- (NSIndexPath)toIndexPath
{
  return self->_toIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toIndexPath, 0);
  objc_storeStrong((id *)&self->_fromIndexPath, 0);
  objc_storeStrong(&self->_item, 0);
}

@end
