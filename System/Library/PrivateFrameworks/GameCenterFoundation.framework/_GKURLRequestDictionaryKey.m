@implementation _GKURLRequestDictionaryKey

- (_GKURLRequestDictionaryKey)initWithRequest:(id)a3
{
  id v4;
  _GKURLRequestDictionaryKey *v5;
  uint64_t v6;
  NSURLRequest *request;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GKURLRequestDictionaryKey;
  v5 = -[_GKURLRequestDictionaryKey init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    request = v5->_request;
    v5->_request = (NSURLRequest *)v6;

  }
  return v5;
}

+ (id)keyWithRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  -[NSURLRequest URL](self->_request, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@ %@"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLRequest URL](self->_request, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      -[NSURLRequest HTTPMethod](self->_request, "HTTPMethod");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURLRequest HTTPMethod](self->_request, "HTTPMethod");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10 || objc_msgSend(v9, "isEqual:", v10))
      {
        objc_msgSend(v5, "allHTTPHeaderFields");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURLRequest allHTTPHeaderFields](self->_request, "allHTTPHeaderFields");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v12 || objc_msgSend(v11, "isEqual:", v12))
        {
          objc_msgSend(v5, "HTTPBody");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURLRequest HTTPBody](self->_request, "HTTPBody");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v13 == v14 || objc_msgSend(v13, "isEqual:", v14);

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSURLRequest URL](self->_request, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
