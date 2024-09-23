@implementation GEOPlaceExternalActionLinkExtensionParams

- (GEOPlaceExternalActionLinkExtensionParams)initWithExtensionParams:(id)a3 attributionMap:(id)a4
{
  id *v7;
  id v8;
  void *v9;
  void *v10;
  GEOPlaceExternalActionLinkExtensionParams *v11;
  id *p_isa;
  GEOPlaceExternalActionLinkExtensionParams *v13;
  objc_super v15;

  v7 = (id *)a3;
  v8 = a4;
  if (v7
    && (-[GEOPDExtensionParams vendorId](v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "objectForKey:", v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOPlaceExternalActionLinkExtensionParams;
    v11 = -[GEOPlaceExternalActionLinkExtensionParams init](&v15, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_extensionParams, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)vendorId
{
  return -[GEOPDExtensionParams vendorId]((id *)&self->_extensionParams->super.super.isa);
}

- (NSString)externalItemId
{
  return -[GEOPDExtensionParams externalItemId]((id *)&self->_extensionParams->super.super.isa);
}

- (unint64_t)featureType
{
  return 1;
}

- (GEOAttributionApp)attributionApp
{
  NSMapTable *attributionMap;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  attributionMap = self->_attributionMap;
  -[GEOPDExtensionParams vendorId]((id *)&self->_extensionParams->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](attributionMap, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "attributionApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (GEOAttributionApp *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_extensionParams, 0);
}

@end
