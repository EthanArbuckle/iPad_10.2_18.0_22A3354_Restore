@implementation CKPluginImageCacheKey

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v5 = objc_msgSend(v4, "integerIdentifier"),
        v5 == -[CKPluginImageCacheKey integerIdentifier](self, "integerIdentifier")))
  {
    objc_msgSend(v4, "stringIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPluginImageCacheKey stringIdentifier](self, "stringIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[CKPluginImageCacheKey integerIdentifier](self, "integerIdentifier");
  -[CKPluginImageCacheKey stringIdentifier](self, "stringIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)stringIdentifier
{
  return self->_stringIdentifier;
}

- (int64_t)integerIdentifier
{
  return self->_integerIdentifier;
}

+ (id)keyWithStringIdentifier:(id)a3 integerIdentifier:(int64_t)a4
{
  id v5;
  CKPluginImageCacheKey *v6;

  v5 = a3;
  v6 = -[CKPluginImageCacheKey initWithStringIdentifier:integerIdentifier:]([CKPluginImageCacheKey alloc], "initWithStringIdentifier:integerIdentifier:", v5, a4);

  return v6;
}

- (CKPluginImageCacheKey)initWithStringIdentifier:(id)a3 integerIdentifier:(int64_t)a4
{
  id v7;
  CKPluginImageCacheKey *v8;
  CKPluginImageCacheKey *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKPluginImageCacheKey;
  v8 = -[CKPluginImageCacheKey init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_stringIdentifier, a3);
    v9->_integerIdentifier = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKPluginImageCacheKey stringIdentifier](self, "stringIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %ld"), v4, -[CKPluginImageCacheKey integerIdentifier](self, "integerIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setStringIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stringIdentifier, a3);
}

- (void)setIntegerIdentifier:(int64_t)a3
{
  self->_integerIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringIdentifier, 0);
}

@end
