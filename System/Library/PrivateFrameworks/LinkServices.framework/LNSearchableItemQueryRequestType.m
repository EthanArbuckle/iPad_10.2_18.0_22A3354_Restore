@implementation LNSearchableItemQueryRequestType

- (LNSearchableItemQueryRequestType)initWithSearchableItems:(id)a3
{
  id v6;
  id *v7;
  LNSearchableItemQueryRequestType *v8;
  LNSearchableItemQueryRequestType *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryRequestConfiguration.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNSearchableItemQueryRequestType;
  v7 = -[LNQueryRequestTypeBase _init](&v12, sel__init);
  v8 = (LNSearchableItemQueryRequestType *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

- (id)description
{
  return CFSTR("SearchableItemQuery");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNSearchableItemQueryRequestType items](self, "items");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("items"));

}

- (LNSearchableItemQueryRequestType)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  LNSearchableItemQueryRequestType *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("items"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[LNSearchableItemQueryRequestType initWithSearchableItems:](self, "initWithSearchableItems:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_items, "hash");
}

- (BOOL)isEqual:(id)a3
{
  LNSearchableItemQueryRequestType *v4;
  LNSearchableItemQueryRequestType *v5;
  LNSearchableItemQueryRequestType *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNSearchableItemQueryRequestType *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNSearchableItemQueryRequestType items](self, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNSearchableItemQueryRequestType items](v6, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqualToArray:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
