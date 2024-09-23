@implementation CRKApplicationInfo

- (CRKApplicationInfo)initWithBundleIdentifier:(id)a3 shortVersionString:(id)a4
{
  id v6;
  id v7;
  CRKApplicationInfo *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  NSString *shortVersionString;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKApplicationInfo;
  v8 = -[CRKApplicationInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    shortVersionString = v8->_shortVersionString;
    v8->_shortVersionString = (NSString *)v11;

  }
  return v8;
}

- (CRKApplicationInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRKApplicationInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shortVersionString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CRKApplicationInfo initWithBundleIdentifier:shortVersionString:](self, "initWithBundleIdentifier:shortVersionString:", v5, v6);
  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[CRKApplicationInfo bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("bundleIdentifier"));

  -[CRKApplicationInfo shortVersionString](self, "shortVersionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CRKApplicationInfo shortVersionString](self, "shortVersionString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("shortVersionString"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = (void *)0x24D9C5000;
  if (!objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    v10 = 0;
    goto LABEL_22;
  }
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKApplicationInfo isEqual:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("CRKApplicationInfo.m"), 49, CFSTR("expected %@, got %@"), v6, v3);

  }
  -[CRKApplicationInfo bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "bundleIdentifier"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKApplicationInfo bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v3))
    {
      v10 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v9 = 1;
  }
  else
  {
    v20 = 0;
    v9 = 0;
  }
  -[CRKApplicationInfo shortVersionString](self, "shortVersionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v7, "shortVersionString"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKApplicationInfo shortVersionString](self, "shortVersionString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortVersionString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isEqual:", v13);

    if (v11)
      goto LABEL_17;
  }
  else
  {
    v19 = 0;
    v10 = 1;
  }

LABEL_17:
  if (v9)
    goto LABEL_18;
LABEL_19:
  if (!v8)

LABEL_22:
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CRKApplicationInfo bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKApplicationInfo shortVersionString](self, "shortVersionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (id)bundleIdentifierFromDictionaryRepresentation:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
}

+ (id)bundleIdentifiersFromDictionaryRepresentations:(id)a3
{
  return (id)objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_108);
}

uint64_t __69__CRKApplicationInfo_bundleIdentifiersFromDictionaryRepresentations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
