@implementation LNContentType

- (LNContentType)initWithContentType:(id)a3
{
  id v5;
  LNContentType *v6;
  LNContentType *v7;
  LNContentType *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNContentType;
  v6 = -[LNContentType init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentType, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNContentType contentType](self, "contentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNContentType *v4;
  LNContentType *v5;
  LNContentType *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNContentType *)a3;
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
      -[LNContentType contentType](self, "contentType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNContentType contentType](v6, "contentType");
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

- (LNContentType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNContentType *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LNContentType initWithContentType:](self, "initWithContentType:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNContentType contentType](self, "contentType");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contentType"));

}

- (NSString)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
