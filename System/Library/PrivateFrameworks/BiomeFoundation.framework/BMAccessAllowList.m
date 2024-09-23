@implementation BMAccessAllowList

- (BMAccessAllowList)initWithList:(id)a3
{
  id v5;
  BMAccessAllowList *v6;
  BMAccessAllowList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAccessAllowList;
  v6 = -[BMAccessAllowList init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_allowed, a3);

  return v7;
}

- (BOOL)includesIdentifier:(id)a3 useCase:(id)a4
{
  NSDictionary *allowed;
  id v6;
  void *v7;

  allowed = self->_allowed;
  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](allowed, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(allowed) = objc_msgSend(v7, "containsObject:", v6);

  return (char)allowed;
}

- (BOOL)includesProcess:(id)a3 useCase:(id)a4
{
  NSDictionary *allowed;
  id v6;
  void *v7;
  void *v8;
  char v9;

  allowed = self->_allowed;
  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](allowed, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowed, 0);
}

@end
