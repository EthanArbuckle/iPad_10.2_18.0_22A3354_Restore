@implementation NUPagingBlueprintItem

- (NUPagingBlueprintItem)initWithPage:(id)a3
{
  id v5;
  NUPagingBlueprintItem *v6;
  NUPagingBlueprintItem *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NUPagingBlueprintItem;
  v6 = -[NUPagingBlueprintItem init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_page, a3);
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

  }
  return v7;
}

- (NUPagingBlueprintItem)initWithPageID:(id)a3
{
  id v4;
  NUPagingBlueprintItem *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUPagingBlueprintItem;
  v5 = -[NUPagingBlueprintItem init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NUPagingBlueprintItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (NUPagingBlueprintItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NUPagingBlueprintItem identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPagingBlueprintItem identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NUPagingBlueprintItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NUPage)page
{
  return self->_page;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_page, 0);
}

@end
