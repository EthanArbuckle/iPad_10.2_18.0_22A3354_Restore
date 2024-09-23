@implementation LNPropertyQueryRequestType

- (LNPropertyQueryRequestType)initWithPropertyQuery:(id)a3 sortingOptions:(id)a4 maximumResultCount:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  LNPropertyQueryRequestType *v13;
  LNPropertyQueryRequestType *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LNPropertyQueryRequestType;
  v12 = -[LNQueryRequestTypeBase _init](&v16, sel__init);
  v13 = (LNPropertyQueryRequestType *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong((id *)&v13->_sortingOptions, a4);
    objc_storeStrong((id *)&v13->_maximumResultCount, a5);
    v14 = v13;
  }

  return v13;
}

- (id)description
{
  return CFSTR("PropertyIdentifier");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNPropertyQueryRequestType propertyQuery](self, "propertyQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("propertyQuery"));

  -[LNPropertyQueryRequestType sortingOptions](self, "sortingOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sortingOptions"));

  -[LNPropertyQueryRequestType maximumResultCount](self, "maximumResultCount");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("maximumResultCount"));

}

- (LNPropertyQueryRequestType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  LNPropertyQueryRequestType *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyQuery"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sortingOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumResultCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LNPropertyQueryRequestType initWithPropertyQuery:sortingOptions:maximumResultCount:](self, "initWithPropertyQuery:sortingOptions:maximumResultCount:", v5, v9, v10);
  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[LNPropertyQuery hash](self->_propertyQuery, "hash");
  v4 = -[NSArray hash](self->_sortingOptions, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_maximumResultCount, "hash");
}

- (BOOL)isEqual:(id)a3
{
  LNPropertyQueryRequestType *v4;
  LNPropertyQueryRequestType *v5;
  LNPropertyQueryRequestType *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (LNPropertyQueryRequestType *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[LNPropertyQueryRequestType propertyQuery](self, "propertyQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNPropertyQueryRequestType propertyQuery](v6, "propertyQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[LNPropertyQueryRequestType sortingOptions](self, "sortingOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNPropertyQueryRequestType sortingOptions](v6, "sortingOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqualToArray:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[LNPropertyQueryRequestType maximumResultCount](self, "maximumResultCount");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNPropertyQueryRequestType maximumResultCount](v6, "maximumResultCount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqual:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (LNPropertyQuery)propertyQuery
{
  return self->_propertyQuery;
}

- (NSArray)sortingOptions
{
  return self->_sortingOptions;
}

- (NSNumber)maximumResultCount
{
  return self->_maximumResultCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumResultCount, 0);
  objc_storeStrong((id *)&self->_sortingOptions, 0);
  objc_storeStrong((id *)&self->_propertyQuery, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
