@implementation CATActiveIDSServiceConnectionContentClose

- (CATActiveIDSServiceConnectionContentClose)init
{
  return -[CATActiveIDSServiceConnectionContentClose initWithError:](self, "initWithError:", 0);
}

- (CATActiveIDSServiceConnectionContentClose)initWithError:(id)a3
{
  id v5;
  CATActiveIDSServiceConnectionContentClose *v6;
  CATActiveIDSServiceConnectionContentClose *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATActiveIDSServiceConnectionContentClose;
  v6 = -[CATActiveIDSServiceConnectionContentClose init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

- (int64_t)contentType
{
  return 4;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[CATActiveIDSServiceConnectionContentClose error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cat_dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Error"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
}

+ (id)instanceWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Error"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "cat_errorValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithError:", v7);
  return v8;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
