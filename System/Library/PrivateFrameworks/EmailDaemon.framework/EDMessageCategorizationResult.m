@implementation EDMessageCategorizationResult

- (EDMessageCategorizationResult)init
{
  void *v3;
  EDMessageCategorizationResult *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E110]), "initWithType:state:", 0, 0);
  v4 = -[EDMessageCategorizationResult initWithCategory:metadata:](self, "initWithCategory:metadata:", v3, 0);

  return v4;
}

- (EDMessageCategorizationResult)initWithCategory:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  EDMessageCategorizationResult *v9;
  EDMessageCategorizationResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDMessageCategorizationResult;
  v9 = -[EDMessageCategorizationResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[EDMessageCategorizationResult category](self, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      -[EDMessageCategorizationResult metadata](self, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[EDMessageCategorizationResult category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[EDMessageCategorizationResult metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 33 * v4 + objc_msgSend(v5, "hash") + 1089;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EMCategory type](self->_category, "type");
  EMStringFromCategoryType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMCategory subtype](self->_category, "subtype");
  EMStringFromSubtype();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Category:%@ SubCategory:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (EMCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (MEMessageCategorizationResultMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
