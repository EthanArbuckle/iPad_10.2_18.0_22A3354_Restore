@implementation MKMapItemPhoto

- (MKMapItemPhoto)initWithGeoMapItemPhoto:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  MKMapItemPhoto *v12;
  MKMapItemPhoto *v13;
  uint64_t v14;
  NSString *title;
  _MKMapItemPhotosAttribution *v16;
  void *v17;
  uint64_t v18;
  _MKMapItemPhotosAttribution *attribution;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MKMapItemPhoto;
  v12 = -[MKMapItemPhoto init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_geoMapItemPhoto, a3);
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    objc_storeStrong((id *)&v13->_subtitle, a5);
    v16 = [_MKMapItemPhotosAttribution alloc];
    objc_msgSend(v9, "attribution");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[_MKMapItemPhotosAttribution initWithGEOMapItemAttribution:](v16, "initWithGEOMapItemAttribution:", v17);
    attribution = v13->_attribution;
    v13->_attribution = (_MKMapItemPhotosAttribution *)v18;

    v13->_photoStyle = 0;
  }

  return v13;
}

- (MKMapItemPhoto)initWithPictureItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MKMapItemPhoto *v9;

  v4 = a3;
  objc_msgSend(v4, "photo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v4, "secondaryText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MKMapItemPhoto initWithGeoMapItemPhoto:title:subtitle:](self, "initWithGeoMapItemPhoto:title:subtitle:", v5, v6, v8);

  }
  else
  {
    v9 = -[MKMapItemPhoto initWithGeoMapItemPhoto:title:subtitle:](self, "initWithGeoMapItemPhoto:title:subtitle:", v5, v6, 0);
  }

  if (v9)
    v9->_photoStyle = 1;

  return v9;
}

- (MKMapItemPhoto)initWithGeoMapItemPhoto:(id)a3
{
  return -[MKMapItemPhoto initWithGeoMapItemPhoto:title:subtitle:](self, "initWithGeoMapItemPhoto:title:subtitle:", a3, 0, 0);
}

- (MKMapItemPhoto)initWithGeoMapItemPhoto:(id)a3 fallbackTitle:(id)a4
{
  return -[MKMapItemPhoto initWithGeoMapItemPhoto:title:subtitle:](self, "initWithGeoMapItemPhoto:title:subtitle:", a3, a4, 0);
}

- (NSString)license
{
  return (NSString *)-[GEOMapItemPhoto licenseDescription](self->_geoMapItemPhoto, "licenseDescription");
}

- (NSURL)largestPhotoURL
{
  void *v2;
  void *v3;

  -[GEOMapItemPhoto largestPhoto](self->_geoMapItemPhoto, "largestPhoto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)photoID
{
  return (NSString *)-[GEOMapItemPhoto uid](self->_geoMapItemPhoto, "uid");
}

- (BOOL)useGallery
{
  return -[GEOMapItemPhoto useGallery](self->_geoMapItemPhoto, "useGallery");
}

- (int64_t)format
{
  double v2;

  -[GEOMapItemPhoto sizeRatio](self->_geoMapItemPhoto, "sizeRatio");
  if (v2 < 1.0)
    return 1;
  else
    return 2 * (v2 > 1.0);
}

- (id)urlForBestPhotoForSize:(CGSize)a3
{
  void *v3;
  void *v4;

  -[GEOMapItemPhoto bestPhotoForSize:allowSmaller:](self->_geoMapItemPhoto, "bestPhotoForSize:allowSmaller:", 1, a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)displayFullScreenPhotoGallery
{
  return -[GEOMapItemPhoto displayFullScreenPhotoGallery](self->_geoMapItemPhoto, "displayFullScreenPhotoGallery");
}

- (BOOL)needsObfuscationWhenRenderedInFullScreen
{
  return -[GEOMapItemPhoto needsObfuscationWhenRenderedInFullScreen](self->_geoMapItemPhoto, "needsObfuscationWhenRenderedInFullScreen");
}

- (int64_t)photoStyle
{
  return self->_photoStyle;
}

- (_MKMapItemPhotosAttribution)attribution
{
  return self->_attribution;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GEOMapItemPhoto)geoMapItemPhoto
{
  return self->_geoMapItemPhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItemPhoto, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

@end
