@implementation GEOPlaceExternalActionWebLinkParams

- (GEOPlaceExternalActionWebLinkParams)initWithWebLinkParams:(id)a3
{
  id *v5;
  id *v6;
  void *v7;
  GEOPlaceExternalActionWebLinkParams *v8;
  GEOPlaceExternalActionWebLinkParams *v9;
  GEOPlaceExternalActionWebLinkParams *v10;
  objc_super v12;

  v5 = (id *)a3;
  v6 = v5;
  if (v5 && (-[GEOPDWebLinkParams url](v5), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOPlaceExternalActionWebLinkParams;
    v8 = -[GEOPlaceExternalActionWebLinkParams init](&v12, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_params, a3);
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)displayName
{
  return -[GEOPDWebLinkParams title]((id *)&self->_params->super.super.isa);
}

- (NSURL)url
{
  NSURL *url;
  void *v4;
  void *v5;
  NSURL *v6;
  NSURL *v7;

  url = self->_url;
  if (!url)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    -[GEOPDWebLinkParams url]((id *)&self->_params->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v7 = self->_url;
    self->_url = v6;

    url = self->_url;
  }
  return url;
}

- (GEOMapItemPhoto)icon
{
  id *v3;
  void *v4;
  GEOMapItemPhoto *photo;
  _GEOPlaceDataPhoto *v6;
  id *v7;
  void *v8;
  GEOMapItemPhoto *v9;
  GEOMapItemPhoto *v10;
  GEOMapItemPhoto *v11;

  -[GEOPDWebLinkParams icon]((id *)&self->_params->super.super.isa);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDIcon image](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    photo = self->_photo;
    if (!photo)
    {
      v6 = [_GEOPlaceDataPhoto alloc];
      -[GEOPDWebLinkParams icon]((id *)&self->_params->super.super.isa);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDIcon image](v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_GEOPlaceDataPhoto initWithPhoto:](v6, "initWithPhoto:", v8);
      v10 = self->_photo;
      self->_photo = v9;

      photo = self->_photo;
    }
    v11 = photo;
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (BOOL)supportsEmbeddedWebBrowser
{
  GEOPDWebLinkParams *params;

  params = self->_params;
  return params && params->_supportsEmbeddedWebBrowser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_params, 0);
}

@end
