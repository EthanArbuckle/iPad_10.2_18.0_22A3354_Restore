@implementation _GEOPlaceDataPhoto

- (_GEOPlaceDataPhoto)initWithCaptionedPhoto:(id)a3 attribution:(id)a4
{
  id v7;
  _GEOPlaceDataPhoto *v8;
  _GEOPlaceDataPhoto *v9;
  _GEOPlaceDataPhoto *v10;

  v7 = a4;
  v8 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](self, "initWithCaptionedPhoto:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attribution, a4);
    v10 = v9;
  }

  return v9;
}

- (_GEOPlaceDataPhoto)initWithCaptionedPhoto:(id)a3
{
  id *v5;
  _GEOPlaceDataPhoto *v6;
  _GEOPlaceDataPhoto *v7;
  GEOPhotoInfoSource *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  GEOPhotoInfoSource *photoInfoSource;
  _GEOPlaceDataPhoto *v13;
  objc_super v15;

  v5 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)_GEOPlaceDataPhoto;
  v6 = -[_GEOPlaceDataPhoto init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_captionedPhoto, a3);
    v8 = [GEOPhotoInfoSource alloc];
    -[GEOPDCaptionedPhoto photo](v5);
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPhoto photoVersions](v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEOPhotoInfoSource initWithPhotoContent:](v8, "initWithPhotoContent:", v10);
    photoInfoSource = v7->_photoInfoSource;
    v7->_photoInfoSource = (GEOPhotoInfoSource *)v11;

    v13 = v7;
  }

  return v7;
}

- (_GEOPlaceDataPhoto)initWithPhoto:(id)a3 attribution:(id)a4
{
  id v7;
  _GEOPlaceDataPhoto *v8;
  _GEOPlaceDataPhoto *v9;
  _GEOPlaceDataPhoto *v10;

  v7 = a4;
  v8 = -[_GEOPlaceDataPhoto initWithPhoto:](self, "initWithPhoto:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attribution, a4);
    v10 = v9;
  }

  return v9;
}

- (_GEOPlaceDataPhoto)initWithPhoto:(id)a3
{
  id *v5;
  _GEOPlaceDataPhoto *v6;
  _GEOPlaceDataPhoto *v7;
  GEOPhotoInfoSource *v8;
  void *v9;
  uint64_t v10;
  GEOPhotoInfoSource *photoInfoSource;
  _GEOPlaceDataPhoto *v12;
  objc_super v14;

  v5 = (id *)a3;
  v14.receiver = self;
  v14.super_class = (Class)_GEOPlaceDataPhoto;
  v6 = -[_GEOPlaceDataPhoto init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photo, a3);
    v8 = [GEOPhotoInfoSource alloc];
    -[GEOPDPhoto photoVersions](v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOPhotoInfoSource initWithPhotoContent:](v8, "initWithPhotoContent:", v9);
    photoInfoSource = v7->_photoInfoSource;
    v7->_photoInfoSource = (GEOPhotoInfoSource *)v10;

    v12 = v7;
  }

  return v7;
}

- (NSString)author
{
  return -[GEOPDCaptionedPhoto author]((id *)&self->_captionedPhoto->super.super.isa);
}

- (NSString)caption
{
  return -[GEOPDCaptionedPhoto caption]((id *)&self->_captionedPhoto->super.super.isa);
}

- (NSString)licenseDescription
{
  return -[GEOPDCaptionedPhoto licenseDescription]((id *)&self->_captionedPhoto->super.super.isa);
}

- (NSURL)licenseURL
{
  GEOPDCaptionedPhoto *captionedPhoto;
  void *v4;
  void *v5;
  void *v6;

  captionedPhoto = self->_captionedPhoto;
  if (captionedPhoto
    && (-[GEOPDCaptionedPhoto _readLicenseUrl]((uint64_t)self->_captionedPhoto), captionedPhoto->_licenseUrl))
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    -[GEOPDCaptionedPhoto licenseUrl]((id *)&self->_captionedPhoto->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSURL *)v6;
}

- (NSDate)dateCreated
{
  GEOPDCaptionedPhoto *captionedPhoto;
  void *v3;
  id v5;
  GEOPDCaptionedPhoto *v6;
  double dateAdded;

  captionedPhoto = self->_captionedPhoto;
  if (captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D68]);
    v6 = self->_captionedPhoto;
    if (v6)
      dateAdded = v6->_dateAdded;
    else
      dateAdded = 0.0;
    v3 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:", dateAdded);
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (BOOL)displayFullScreenPhotoGallery
{
  GEOPDCaptionedPhoto *captionedPhoto;

  captionedPhoto = self->_captionedPhoto;
  if (!captionedPhoto)
    return 0;
  if (captionedPhoto->_displayFullScreenPhotoGallery)
    return 1;
  return captionedPhoto->_displayFullPhotoInline;
}

- (BOOL)useGallery
{
  GEOPDCaptionedPhoto *captionedPhoto;

  captionedPhoto = self->_captionedPhoto;
  return captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 0x40) != 0 && captionedPhoto->_useGallery;
}

- (NSString)uid
{
  GEOPDCaptionedPhoto *captionedPhoto;
  id *v4;
  void *v5;

  captionedPhoto = self->_captionedPhoto;
  if (captionedPhoto)
  {
    -[GEOPDCaptionedPhoto photo]((id *)&captionedPhoto->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPhoto photoId](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GEOPDPhoto photoId]((id *)&self->_photo->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (id)largestPhoto
{
  return -[GEOPhotoInfoSource largestPhoto](self->_photoInfoSource, "largestPhoto");
}

- (id)bestPhotoForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  double height;
  double width;
  void *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  +[GEOMapItemPhotoOptions defaultPhotoOptionsWithAllowSmaller:](GEOMapItemPhotoOptions, "defaultPhotoOptionsWithAllowSmaller:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GEOPlaceDataPhoto bestPhotoForSize:options:](self, "bestPhotoForSize:options:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)bestPhotoForFrameSize:(CGSize)a3 displayScale:(double)a4 options:(id)a5
{
  double v5;

  v5 = fmax(a4, 1.0);
  return -[_GEOPlaceDataPhoto bestPhotoForSize:options:](self, "bestPhotoForSize:options:", a5, a3.width * v5, a3.height * v5);
}

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint8_t v10[16];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (v7)
  {
    -[GEOPhotoInfoSource bestPhotoForSize:options:](self->_photoInfoSource, "bestPhotoForSize:options:", v7, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: options != ((void *)0)", v10, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (double)sizeRatio
{
  double result;

  -[GEOPhotoInfoSource sizeRatio](self->_photoInfoSource, "sizeRatio");
  return result;
}

- (BOOL)highQuality
{
  GEOPDCaptionedPhoto *captionedPhoto;

  captionedPhoto = self->_captionedPhoto;
  return captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 8) != 0 && captionedPhoto->_highQuality;
}

- (BOOL)businessProvided
{
  GEOPDCaptionedPhoto *captionedPhoto;

  captionedPhoto = self->_captionedPhoto;
  return captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 0x10) != 0 && captionedPhoto->_isBusinessOwned;
}

- (NSString)backgroundJoeColor
{
  id *v2;
  void *v3;

  -[GEOPDCaptionedPhoto joeColor]((id *)&self->_captionedPhoto->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDJoeColor backgroundColor](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isBackgroundJoeColorCurated
{
  _BYTE *v2;
  BOOL v3;

  -[GEOPDCaptionedPhoto joeColor]((id *)&self->_captionedPhoto->super.super.isa);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[76] != 0;
  else
    v3 = 0;

  return v3;
}

- (GEOMapItemPhotosAttribution)attribution
{
  return self->_attribution;
}

- (BOOL)needsObfuscationWhenRenderedInFullScreen
{
  GEOPDCaptionedPhoto *captionedPhoto;

  captionedPhoto = self->_captionedPhoto;
  return captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 0x20) != 0 && captionedPhoto->_obfuscateFullScreenPhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_photoInfoSource, 0);
  objc_storeStrong((id *)&self->_captionedPhoto, 0);
  objc_storeStrong((id *)&self->_photo, 0);
}

@end
