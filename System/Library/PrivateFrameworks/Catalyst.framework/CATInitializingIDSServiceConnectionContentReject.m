@implementation CATInitializingIDSServiceConnectionContentReject

- (CATInitializingIDSServiceConnectionContentReject)initWithConnectionIdentifier:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  CATInitializingIDSServiceConnectionContentReject *v9;
  CATInitializingIDSServiceConnectionContentReject *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATInitializingIDSServiceConnectionContentReject;
  v9 = -[CATInitializingIDSServiceConnectionContentReject init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectionIdentifier, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (int64_t)contentType
{
  return 3;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[CATInitializingIDSServiceConnectionContentReject connectionIdentifier](self, "connectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ConnectionIdenfitier"));

  -[CATInitializingIDSServiceConnectionContentReject error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cat_dictionaryValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Error"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v8;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "cat_errorValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cat_uuidForKey:", CFSTR("ConnectionIdenfitier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConnectionIdentifier:error:", v9, v8);
  else
    v10 = 0;

  return v10;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
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
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
}

@end
