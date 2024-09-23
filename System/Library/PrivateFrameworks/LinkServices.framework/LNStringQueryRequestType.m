@implementation LNStringQueryRequestType

- (LNStringQueryRequestType)initWithQueryString:(id)a3
{
  id v5;
  id *v6;
  LNStringQueryRequestType *v7;
  LNStringQueryRequestType *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNStringQueryRequestType;
  v6 = -[LNQueryRequestTypeBase _init](&v10, sel__init);
  v7 = (LNStringQueryRequestType *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  return CFSTR("StringQuery");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNStringQueryRequestType queryString](self, "queryString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("queryString"));

}

- (LNStringQueryRequestType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNStringQueryRequestType *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LNStringQueryRequestType initWithQueryString:](self, "initWithQueryString:", v5);
  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_queryString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  LNStringQueryRequestType *v4;
  LNStringQueryRequestType *v5;
  LNStringQueryRequestType *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNStringQueryRequestType *)a3;
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
      -[LNStringQueryRequestType queryString](self, "queryString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNStringQueryRequestType queryString](v6, "queryString");
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
          v12 = objc_msgSend(v9, "isEqualToString:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
