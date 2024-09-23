@implementation CRKURLResources

- (CRKURLResources)init
{
  return -[CRKURLResources initWithResources:](self, "initWithResources:", MEMORY[0x24BDBD1B8]);
}

- (CRKURLResources)initWithResources:(id)a3
{
  id v4;
  CRKURLResources *v5;
  uint64_t v6;
  NSMutableDictionary *resources;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKURLResources;
  v5 = -[CRKURLResources init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    resources = v5->_resources;
    v5->_resources = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (id)underlyingResources
{
  void *v2;
  void *v3;

  -[CRKURLResources resources](self, "resources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSNumber)isDirectory
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  -[CRKURLResources resources](self, "resources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBCC60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSNumber)documentIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  -[CRKURLResources resources](self, "resources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBCBF8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSDate)lastModificationDate
{
  void *v2;
  void *v3;
  void *v4;
  NSDate *v5;

  -[CRKURLResources resources](self, "resources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBCBE0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (unint64_t)size
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  -[CRKURLResources resources](self, "resources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBCC48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "unsignedLongValue");
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRKURLResources *v4;
  void *v5;
  CRKURLResources *v6;

  v4 = [CRKURLResources alloc];
  -[CRKURLResources resources](self, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKURLResources initWithResources:](v4, "initWithResources:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRKMutableURLResources *v4;
  void *v5;
  CRKMutableURLResources *v6;

  v4 = [CRKMutableURLResources alloc];
  -[CRKURLResources resources](self, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKURLResources initWithResources:](v4, "initWithResources:", v5);

  return v6;
}

- (id)immutableResources
{
  return (id)-[CRKURLResources copy](self, "copy");
}

- (id)mutableResources
{
  return (id)-[CRKURLResources mutableCopy](self, "mutableCopy");
}

- (NSMutableDictionary)resources
{
  return self->_resources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
}

@end
