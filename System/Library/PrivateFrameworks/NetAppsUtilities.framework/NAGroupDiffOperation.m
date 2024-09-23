@implementation NAGroupDiffOperation

- (NAGroupDiffOperation)initWithOperationType:(unint64_t)a3 group:(id)a4 fromIndex:(id)a5 toIndex:(id)a6
{
  id v11;
  id v12;
  id v13;
  NAGroupDiffOperation *v14;
  NAGroupDiffOperation *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NAGroupDiffOperation;
  v14 = -[NAGroupDiffOperation init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_group, a4);
    objc_storeStrong((id *)&v15->_fromIndex, a5);
    objc_storeStrong((id *)&v15->_toIndex, a6);
  }

  return v15;
}

+ (id)insertOperationWithGroup:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithOperationType:group:fromIndex:toIndex:", 1, v6, 0, v8);

  return v9;
}

+ (id)deleteOperationWithGroup:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithOperationType:group:fromIndex:toIndex:", 2, v6, v8, 0);

  return v9;
}

+ (id)moveOperationWithGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithOperationType:group:fromIndex:toIndex:", 3, v8, v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  NAGroupDiffOperation *v4;
  NAGroupDiffOperation *v5;
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

  v4 = (NAGroupDiffOperation *)a3;
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
      v6 = -[NAGroupDiffOperation type](self, "type");
      if (v6 != -[NAGroupDiffOperation type](v5, "type"))
      {
        v15 = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[NAGroupDiffOperation group](self, "group");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NAGroupDiffOperation group](v5, "group");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqual:", v8))
      {
        v15 = 0;
LABEL_23:

        goto LABEL_24;
      }
      -[NAGroupDiffOperation fromIndex](self, "fromIndex");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NAGroupDiffOperation fromIndex](v5, "fromIndex");
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
      -[NAGroupDiffOperation toIndex](self, "toIndex");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NAGroupDiffOperation toIndex](v5, "toIndex");
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

  v3 = -[NAGroupDiffOperation type](self, "type");
  -[NAGroupDiffOperation group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[NAGroupDiffOperation fromIndex](self, "fromIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[NAGroupDiffOperation toIndex](self, "toIndex");
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
  -[NAGroupDiffOperation _operationDescriptionWithVerboseType:](self, "_operationDescriptionWithVerboseType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)operationDescription
{
  return (NSString *)-[NAGroupDiffOperation _operationDescriptionWithVerboseType:](self, "_operationDescriptionWithVerboseType:", 1);
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
  void *v11;
  _QWORD v13[5];

  v3 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__NAGroupDiffOperation__operationDescriptionWithVerboseType___block_invoke;
  v13[3] = &unk_1E6228878;
  v13[4] = self;
  __61__NAGroupDiffOperation__operationDescriptionWithVerboseType___block_invoke((uint64_t)v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NAGroupDiffOperation type](self, "type");
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
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR(" group"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[NAGroupDiffOperation group](self, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@ \"%@\"), v7, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __61__NAGroupDiffOperation__operationDescriptionWithVerboseType___block_invoke(uint64_t a1)
{
  void *v1;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v3 < 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "toIndex");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v1 = (void *)v7;
    return v1;
  }
  if (v3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "fromIndex");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v3 == 3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "fromIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "toIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ -> %@"), v5, v6);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (unint64_t)type
{
  return self->_type;
}

- (NADiffableItemGroup)group
{
  return self->_group;
}

- (NSNumber)fromIndex
{
  return self->_fromIndex;
}

- (NSNumber)toIndex
{
  return self->_toIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toIndex, 0);
  objc_storeStrong((id *)&self->_fromIndex, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
