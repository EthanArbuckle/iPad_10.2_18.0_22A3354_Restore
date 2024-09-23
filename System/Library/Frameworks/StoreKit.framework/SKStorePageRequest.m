@implementation SKStorePageRequest

- (SKStorePageRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  SKStorePageRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *productParameters;
  void *v10;
  uint64_t v11;
  NSURL *productURL;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SKStorePageRequest;
  v5 = -[SKStorePageRequest init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("0"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_pageStyle = objc_msgSend(v6, "integerValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "copy");
      productParameters = v5->_productParameters;
      v5->_productParameters = (NSDictionary *)v8;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("2"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v10);
      productURL = v5->_productURL;
      v5->_productURL = (NSURL *)v11;

    }
  }

  return v5;
}

- (id)copyXPCEncoding
{
  id v3;
  void *v4;
  NSDictionary *productParameters;
  NSURL *productURL;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_pageStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("0"));

  productParameters = self->_productParameters;
  if (productParameters)
    objc_msgSend(v3, "setObject:forKey:", productParameters, CFSTR("1"));
  productURL = self->_productURL;
  if (productURL)
  {
    -[NSURL absoluteString](productURL, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("2"));

  }
  return v3;
}

- (int64_t)productPageStyle
{
  return self->_pageStyle;
}

- (void)setProductPageStyle:(int64_t)a3
{
  self->_pageStyle = a3;
}

- (NSDictionary)productParameters
{
  return self->_productParameters;
}

- (void)setProductParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (void)setProductURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productParameters, 0);
}

@end
