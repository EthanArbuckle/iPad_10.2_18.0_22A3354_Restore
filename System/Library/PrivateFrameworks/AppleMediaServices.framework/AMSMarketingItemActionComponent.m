@implementation AMSMarketingItemActionComponent

- (AMSMarketingItemActionComponent)initWithDictionary:(id)a3
{
  id v5;
  AMSMarketingItemActionComponent *v6;
  AMSMarketingItemActionComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMarketingItemActionComponent;
  v6 = -[AMSMarketingItemActionComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawValues, a3);

  return v7;
}

- (NSString)description
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemActionComponent rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E254FFA0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSURL)artworkURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[AMSMarketingItemActionComponent rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E25582C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
    goto LABEL_5;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (NSURL *)v5;
}

- (NSDictionary)rawValues
{
  return self->_rawValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawValues, 0);
}

@end
