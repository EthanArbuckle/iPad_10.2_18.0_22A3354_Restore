@implementation CNContainerIdentifiersPredicate

- (CNContainerIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  CNContainerIdentifiersPredicate *v6;
  uint64_t v7;
  NSArray *identifiers;
  CNContainerIdentifiersPredicate *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier IN %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CNContainerIdentifiersPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v11, sel_initWithPredicate_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    identifiers = v6->_identifiers;
    v6->_identifiers = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)cn_topLevelFilter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNContainerIdentifiersPredicate identifiers](self, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3880];
  if (v3)
  {
    -[CNContainerIdentifiersPredicate identifiers](self, "identifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateWithFormat:", CFSTR("identifier IN %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)cn_persistenceFilterRequest
{
  return 0;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
