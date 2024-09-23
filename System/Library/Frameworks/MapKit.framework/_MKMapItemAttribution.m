@implementation _MKMapItemAttribution

+ (id)attributionFromEncyclopedicInfo:(id)a3
{
  id v3;
  _MKMapItemAttribution *v4;
  void *v5;
  _MKMapItemAttribution *v6;

  v3 = a3;
  v4 = [_MKMapItemAttribution alloc];
  objc_msgSend(v3, "encyclopedicAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_MKMapItemAttribution initWithGEOMapItemAttribution:](v4, "initWithGEOMapItemAttribution:", v5);
  return v6;
}

- (_MKMapItemAttribution)initWithGEOMapItemAttribution:(id)a3
{
  id v5;
  _MKMapItemAttribution *v6;
  _MKMapItemAttribution *v7;
  _MKMapItemAttribution *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMapItemAttribution;
  v6 = -[_MKMapItemAttribution init](&v10, sel_init);
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_geoAttribution, a3);
    v8 = v7;
  }

  return v8;
}

- (NSString)providerID
{
  return (NSString *)-[GEOMapItemAttribution providerID](self->_geoAttribution, "providerID");
}

- (NSString)providerName
{
  return (NSString *)-[GEOMapItemAttribution providerName](self->_geoAttribution, "providerName");
}

- (NSString)captionDisplayName
{
  return (NSString *)-[GEOMapItemAttribution captionDisplayName](self->_geoAttribution, "captionDisplayName");
}

- (NSArray)attributionURLs
{
  return (NSArray *)-[GEOMapItemAttribution attributionURLs](self->_geoAttribution, "attributionURLs");
}

- (NSArray)attributionApps
{
  return (NSArray *)-[GEOMapItemAttribution attributionApps](self->_geoAttribution, "attributionApps");
}

- (BOOL)shouldOpenInAppStore
{
  return -[GEOMapItemAttribution shouldOpenInAppStore](self->_geoAttribution, "shouldOpenInAppStore");
}

- (id)providerImageAtPath:(id)a3 scale:(double)a4 isTemplate:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = a5;
  v7 = a3;
  if (v7)
  {
    +[_MKMapItemAttributionProviderLogoImageCache sharedInstance](_MKMapItemAttributionProviderLogoImageCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v7);
      if (v11)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:scale:", v11, a4);
        v13 = v12;
        if (v5)
        {
          objc_msgSend(v12, "imageWithRenderingMode:", 2);
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v14;
        }
        +[_MKMapItemAttributionProviderLogoImageCache sharedInstance](_MKMapItemAttributionProviderLogoImageCache, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setImage:forKey:", v13, v7);

        v10 = v13;
      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)providerLogoImageForScale:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v8;

  -[GEOMapItemAttribution providerLogoPathForScale:](self->_geoAttribution, "providerLogoPathForScale:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3 > 2.0 && v5 == 0)
    -[_MKMapItemAttribution providerLogoImageForScale:](self, "providerLogoImageForScale:");
  else
    -[_MKMapItemAttribution providerImageAtPath:scale:isTemplate:](self, "providerImageAtPath:scale:isTemplate:", v5, 0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)providerSnippetLogoImageForScale:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v8;

  -[GEOMapItemAttribution providerSnippetLogoPathForScale:](self->_geoAttribution, "providerSnippetLogoPathForScale:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3 > 2.0 && v5 == 0)
    -[_MKMapItemAttribution providerSnippetLogoImageForScale:](self, "providerSnippetLogoImageForScale:");
  else
    -[_MKMapItemAttribution providerImageAtPath:scale:isTemplate:](self, "providerImageAtPath:scale:isTemplate:", v5, 1, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)requiresAttributionInCallout
{
  return -[GEOMapItemAttribution requiresAttributionInCallout](self->_geoAttribution, "requiresAttributionInCallout");
}

- (BOOL)requiresAttributionInDeveloperPlaceCard
{
  return -[GEOMapItemAttribution requiresAttributionInDeveloperPlaceCard](self->_geoAttribution, "requiresAttributionInDeveloperPlaceCard");
}

- (NSString)appAdamID
{
  return (NSString *)-[GEOMapItemAttribution appAdamID](self->_geoAttribution, "appAdamID");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoAttribution, 0);
}

@end
