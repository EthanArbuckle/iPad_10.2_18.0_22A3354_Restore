@implementation BMSQLColumn

- (NSString)name
{
  return self->_name;
}

- (id)extractBlock
{
  return self->_extractBlock;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extractBlock, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BMSQLColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 extractBlock:(id)a6
{
  id v11;
  id v12;
  BMSQLColumn *v13;
  BMSQLColumn *v14;
  void *v15;
  id extractBlock;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMSQLColumn;
  v13 = -[BMSQLColumn init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_dataType = a4;
    v14->_requestOnly = a5;
    v15 = _Block_copy(v12);
    extractBlock = v14->_extractBlock;
    v14->_extractBlock = v15;

  }
  return v14;
}

- (BMSQLColumn)initWithName:(id)a3 dataType:(int64_t)a4
{
  return -[BMSQLColumn initWithName:dataType:requestOnly:extractBlock:](self, "initWithName:dataType:requestOnly:extractBlock:", a3, a4, 0, &__block_literal_global_81);
}

uint64_t __37__BMSQLColumn_initWithName_dataType___block_invoke()
{
  return 0;
}

- (id)description
{
  id v3;
  uint64_t v4;
  NSString *name;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  name = self->_name;
  BMSQLDataTypeToString(self->_dataType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requestOnly);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> name: %@, datatype: %@, request only: %@"), v4, self, name, v6, v7);

  return v8;
}

- (unint64_t)hash
{
  return self->_dataType ^ self->_requestOnly ^ -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int64_t dataType;
  int requestOnly;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSQLColumn name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7)
      && (dataType = self->_dataType, dataType == objc_msgSend(v5, "dataType")))
    {
      requestOnly = self->_requestOnly;
      v10 = requestOnly == objc_msgSend(v5, "requestOnly");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)requestOnly
{
  return self->_requestOnly;
}

@end
