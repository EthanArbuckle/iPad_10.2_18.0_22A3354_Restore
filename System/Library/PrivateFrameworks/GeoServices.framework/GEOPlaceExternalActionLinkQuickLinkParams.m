@implementation GEOPlaceExternalActionLinkQuickLinkParams

- (GEOPlaceExternalActionLinkQuickLinkParams)initWithQuickLinkParams:(id)a3
{
  id v5;
  GEOPlaceExternalActionLinkQuickLinkParams *v6;
  GEOPlaceExternalActionLinkQuickLinkParams *v7;
  GEOPlaceExternalActionLinkQuickLinkParams *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOPlaceExternalActionLinkQuickLinkParams;
    v6 = -[GEOPlaceExternalActionLinkQuickLinkParams init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_quickLinkParams, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSURL)url
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  -[GEOPDQuickLinkActionDataParams url]((id *)&self->_quickLinkParams->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E98]);
    -[GEOPDQuickLinkActionDataParams url]((id *)&self->_quickLinkParams->super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  }
  else
  {
    v7 = 0;
  }
  return (NSURL *)v7;
}

- (NSString)appAdamId
{
  return -[GEOPDQuickLinkActionDataParams appAdamId]((id *)&self->_quickLinkParams->super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLinkParams, 0);
}

@end
