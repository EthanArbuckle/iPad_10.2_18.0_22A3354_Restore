@implementation GEOPlaceExternalActionLinkAppClipParams

- (GEOPlaceExternalActionLinkAppClipParams)initWithAppClipParams:(id)a3
{
  id v5;
  GEOPlaceExternalActionLinkAppClipParams *v6;
  GEOPlaceExternalActionLinkAppClipParams *v7;
  GEOPlaceExternalActionLinkAppClipParams *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOPlaceExternalActionLinkAppClipParams;
    v6 = -[GEOPlaceExternalActionLinkAppClipParams init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_appClipParams, a3);
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

  -[GEOPDAppClipParams url]((id *)&self->_appClipParams->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E98]);
    -[GEOPDAppClipParams url]((id *)&self->_appClipParams->super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  }
  else
  {
    v7 = 0;
  }
  return (NSURL *)v7;
}

- (NSString)bundleId
{
  return -[GEOPDAppClipParams bundleId]((id *)&self->_appClipParams->super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipParams, 0);
}

@end
