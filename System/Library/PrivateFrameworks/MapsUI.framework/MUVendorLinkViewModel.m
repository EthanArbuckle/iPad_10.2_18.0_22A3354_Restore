@implementation MUVendorLinkViewModel

- (MUVendorLinkViewModel)initWithPartnerId:(id)a3 linkType:(int)a4 artworkURL:(id)a5 providerName:(id)a6 appAdamId:(id)a7 appShortName:(id)a8 actionName:(id)a9 fallbackSymbolName:(id)a10
{
  id v16;
  id v17;
  MUVendorLinkViewModel *v18;
  MUVendorLinkViewModel *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v16 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)MUVendorLinkViewModel;
  v18 = -[MUVendorLinkViewModel init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_partnerId, a3);
    objc_storeStrong((id *)&v19->_artworkURL, a5);
    objc_storeStrong((id *)&v19->_providerName, a6);
    v19->_linkType = a4;
    objc_storeStrong((id *)&v19->_appAdamId, a7);
    objc_storeStrong((id *)&v19->_appShortName, a8);
    objc_storeStrong((id *)&v19->_actionName, a9);
    objc_storeStrong((id *)&v19->_fallbackSymbolName, a10);
  }

  return v19;
}

- (NSString)uniqueIdentifier
{
  id v3;
  unsigned int v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[MUVendorLinkViewModel linkType](self, "linkType");
  if (v4 > 4)
    v5 = 0;
  else
    v5 = off_1E2E04078[v4];
  objc_msgSend(v3, "addObject:", v5);
  -[MUVendorLinkViewModel providerName](self, "providerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[MUVendorLinkViewModel providerName](self, "providerName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[MUVendorLinkViewModel appAdamId](self, "appAdamId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[MUVendorLinkViewModel appAdamId](self, "appAdamId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[MUVendorLinkViewModel actionName](self, "actionName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    -[MUVendorLinkViewModel actionName](self, "actionName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("-"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MUVendorLinkViewModel uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Unique Identifier: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)linkTypeString
{
  unsigned int v2;

  v2 = -[MUVendorLinkViewModel linkType](self, "linkType") - 1;
  if (v2 > 3)
    return (NSString *)CFSTR("Unknown");
  else
    return &off_1E2E040A0[v2]->isa;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int)a3
{
  self->_linkType = a3;
}

- (NSString)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)appShortName
{
  return self->_appShortName;
}

- (void)setAppShortName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)fallbackSymbolName
{
  return self->_fallbackSymbolName;
}

- (NSString)partnerId
{
  return self->_partnerId;
}

- (void)setPartnerId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partnerId, 0);
  objc_storeStrong((id *)&self->_fallbackSymbolName, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_appShortName, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
}

@end
