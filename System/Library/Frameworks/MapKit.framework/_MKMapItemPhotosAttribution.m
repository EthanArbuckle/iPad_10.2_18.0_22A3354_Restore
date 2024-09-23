@implementation _MKMapItemPhotosAttribution

- (_MKMapItemPhotosAttribution)initWithGEOMapItemAttribution:(id)a3
{
  id v5;
  _MKMapItemPhotosAttribution *v6;
  _MKMapItemPhotosAttribution *v7;
  _MKMapItemPhotosAttribution *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMapItemPhotosAttribution;
  v6 = -[_MKMapItemAttribution initWithGEOMapItemAttribution:](&v10, sel_initWithGEOMapItemAttribution_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoPhotosAttribution, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)addPhotoURLs
{
  return (NSArray *)-[GEOMapItemPhotosAttribution addPhotoURLs](self->_geoPhotosAttribution, "addPhotoURLs");
}

- (id)urlsForPhotoWithIdentifier:(id)a3
{
  return (id)-[GEOMapItemPhotosAttribution urlsForPhotoWithIdentifier:](self->_geoPhotosAttribution, "urlsForPhotoWithIdentifier:", a3);
}

- (BOOL)shouldSuppressPhotoAttribution
{
  return -[GEOMapItemPhotosAttribution shouldSuppressPhotoAttribution](self->_geoPhotosAttribution, "shouldSuppressPhotoAttribution");
}

- (BOOL)shouldHandlePhotosLocally
{
  return -[GEOMapItemPhotosAttribution canShowPhotosLocally](self->_geoPhotosAttribution, "canShowPhotosLocally");
}

- (BOOL)shouldAddPhotosLocally
{
  return -[GEOMapItemPhotosAttribution canAddPhotosLocally](self->_geoPhotosAttribution, "canAddPhotosLocally");
}

- (BOOL)supportsReportingIssue
{
  return -[GEOMapItemPhotosAttribution supportsReportingIssue](self->_geoPhotosAttribution, "supportsReportingIssue");
}

- (BOOL)isUserSubmitted
{
  void *v2;
  void *v3;
  char v4;

  -[_MKMapItemAttribution providerID](self, "providerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GEOConfigGetString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)isBusinessOwned
{
  void *v2;
  void *v3;
  char v4;

  -[_MKMapItemAttribution providerID](self, "providerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GEOConfigGetString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)requiresAttributionInPhotoViewerHeader
{
  return -[GEOMapItemPhotosAttribution requiresAttributionInPhotoViewerHeader](self->_geoPhotosAttribution, "requiresAttributionInPhotoViewerHeader");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoPhotosAttribution, 0);
}

@end
