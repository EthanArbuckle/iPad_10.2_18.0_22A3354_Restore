@implementation APSURLToken

- (APSURLToken)initWithTokenURL:(id)a3 token:(id)a4
{
  id v7;
  id v8;
  void *v9;
  APSURLToken *v10;
  APSURLToken *v11;
  id *p_isa;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)APSURLToken;
    v11 = -[APSURLToken init](&v14, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_tokenURL, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (APSURLToken)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  APSURLToken *v7;
  APSURLToken *v8;
  id *p_isa;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tok"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v11.receiver = self;
      v11.super_class = (Class)APSURLToken;
      v8 = -[APSURLToken init](&v11, sel_init);
      p_isa = (id *)&v8->super.isa;
      if (v8)
      {
        objc_storeStrong((id *)&v8->_tokenURL, v5);
        objc_storeStrong(p_isa + 2, v6);
      }
      self = p_isa;
      v7 = self;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[APSURLToken tokenURL](self, "tokenURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("url"));

  -[APSURLToken token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("tok"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[APSURLToken tokenURL](self, "tokenURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSURLToken token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<APSURLToken %p>: url: %@ token: %@"), self, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[APSURLToken tokenURL](self, "tokenURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tokenURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[APSURLToken token](self, "token");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "token");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToData:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[APSURLToken tokenURL](self, "tokenURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[APSURLToken token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[APSURLToken tokenURL](self, "tokenURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("url"));

  -[APSURLToken token](self, "token");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tok"));

}

- (APSURLToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  APSURLToken *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tok"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[APSURLToken initWithTokenURL:token:](self, "initWithTokenURL:token:", v5, v6);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  APSURLToken *v4;
  void *v5;
  void *v6;
  APSURLToken *v7;

  v4 = [APSURLToken alloc];
  -[APSURLToken tokenURL](self, "tokenURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSURLToken token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[APSURLToken initWithTokenURL:token:](v4, "initWithTokenURL:token:", v5, v6);

  return v7;
}

- (NSString)tokenURL
{
  return self->_tokenURL;
}

- (void)setTokenURL:(id)a3
{
  objc_storeStrong((id *)&self->_tokenURL, a3);
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_tokenURL, 0);
}

@end
