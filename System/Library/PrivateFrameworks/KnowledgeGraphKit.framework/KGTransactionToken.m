@implementation KGTransactionToken

- (id)initForGraph:(id)a3 withString:(id)a4
{
  id v6;
  id v7;
  KGTransactionToken *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  KGTransactionToken *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)KGTransactionToken;
  v8 = -[KGTransactionToken init](&v20, sel_init);
  v9 = v6;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(":"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") != 2)
  {

LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

  objc_msgSend(v9, "graphIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (v15)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

  }
  else
  {
    v17 = -1;
  }

  if (v17 < 0)
    goto LABEL_8;
  objc_storeStrong((id *)&v8->_stringRepresentation, a4);
  v8->_transactionSequenceNumber = v17;
  v18 = v8;
LABEL_9:

  return v18;
}

- (id)initForGraph:(id)a3 transactionSequence:(unint64_t)a4
{
  id v6;
  KGTransactionToken *v7;
  void *v8;
  uint64_t v9;
  NSString *stringRepresentation;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)KGTransactionToken;
  v7 = -[KGTransactionToken init](&v12, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "graphIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), v8, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    stringRepresentation = v7->_stringRepresentation;
    v7->_stringRepresentation = (NSString *)v9;

    v7->_transactionSequenceNumber = a4;
  }

  return v7;
}

- (id)initForGraphIdentifier:(id)a3 transactionSequence:(unint64_t)a4
{
  id v6;
  KGTransactionToken *v7;
  uint64_t v8;
  NSString *stringRepresentation;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KGTransactionToken;
  v7 = -[KGTransactionToken init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    stringRepresentation = v7->_stringRepresentation;
    v7->_stringRepresentation = (NSString *)v8;

    v7->_transactionSequenceNumber = a4;
  }

  return v7;
}

- (BOOL)isEqualToToken:(id)a3
{
  NSString *stringRepresentation;
  void *v4;

  stringRepresentation = self->_stringRepresentation;
  objc_msgSend(a3, "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(stringRepresentation) = -[NSString isEqualToString:](stringRepresentation, "isEqualToString:", v4);

  return (char)stringRepresentation;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (unint64_t)transactionSequenceNumber
{
  return self->_transactionSequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

@end
