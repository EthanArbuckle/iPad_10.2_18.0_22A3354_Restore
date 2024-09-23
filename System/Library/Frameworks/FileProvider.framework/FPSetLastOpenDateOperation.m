@implementation FPSetLastOpenDateOperation

- (id)replicateForItems:(id)a3
{
  id v4;
  FPSetLastOpenDateOperation *v5;

  v4 = a3;
  v5 = -[FPSetLastOpenDateOperation initWithItems:date:]([FPSetLastOpenDateOperation alloc], "initWithItems:date:", v4, self->_date);

  return v5;
}

- (FPSetLastOpenDateOperation)initWithItems:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  FPSetLastOpenDateOperation *v9;
  FPSetLastOpenDateOperation *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FPSetLastOpenDateOperation;
  v9 = -[FPTransformOperation initWithItemsOfDifferentProviders:action:](&v13, sel_initWithItemsOfDifferentProviders_action_, v7, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_items, a3);
    v11 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_date, v11);
    if (!v8)

    -[FPActionOperation setSetupRemoteOperationService:](v10, "setSetupRemoteOperationService:", 1);
  }

  return v10;
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(a3, "setLastUsedDate:", self->_date, a4);
  return 8;
}

- (id)fp_prettyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FPTransformOperation items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FPAbbreviatedArrayDescription(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("set last used date %@ to %@"), v6, self->_date);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
