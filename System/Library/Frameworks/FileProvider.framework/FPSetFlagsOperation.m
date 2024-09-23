@implementation FPSetFlagsOperation

- (id)replicateForItems:(id)a3
{
  FPSetFlagsOperation *v4;
  void *v5;
  FPSetFlagsOperation *v6;

  v4 = [FPSetFlagsOperation alloc];
  -[FPTransformOperation items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FPSetFlagsOperation initWithItems:flags:](v4, "initWithItems:flags:", v5, self->_flags);

  return v6;
}

- (FPSetFlagsOperation)initWithItems:(id)a3 flags:(unint64_t)a4
{
  FPSetFlagsOperation *v5;
  FPSetFlagsOperation *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FPSetFlagsOperation;
  v5 = -[FPTransformOperation initWithItemsOfDifferentProviders:action:](&v8, sel_initWithItemsOfDifferentProviders_action_, a3, 0);
  v6 = v5;
  if (v5)
  {
    v5->_flags = a4;
    -[FPActionOperation setSetupRemoteOperationService:](v5, "setSetupRemoteOperationService:", 1);
  }
  return v6;
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(a3, "setFileSystemFlags:", self->_flags, a4);
  return 256;
}

- (id)fp_prettyDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t flags;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FPTransformOperation items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FPAbbreviatedArrayDescription(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  flags = self->_flags;
  v9 = 101;
  if ((flags & 0x10) == 0)
    v9 = 45;
  v10 = 104;
  if ((flags & 8) == 0)
    v10 = 45;
  v16 = v10;
  v17 = v9;
  v11 = 120;
  if ((flags & 1) == 0)
    v11 = 45;
  v12 = 119;
  if ((flags & 4) == 0)
    v12 = 45;
  v13 = 114;
  if ((self->_flags & 2) == 0)
    v13 = 45;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("set flags %@ to %c%c%c%c%c"), v6, v13, v12, v11, v16, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
