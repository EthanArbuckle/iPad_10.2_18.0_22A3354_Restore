@implementation MRNowPlayingArtworkImage

- (MRNowPlayingArtworkImage)initWithImageData:(id)a3 mimeType:(id)a4
{
  id v6;
  id v7;
  MRNowPlayingArtworkImage *v8;
  uint64_t v9;
  NSData *imageData;
  uint64_t v11;
  NSString *mimeType;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRNowPlayingArtworkImage;
  v8 = -[MRNowPlayingArtworkImage init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    imageData = v8->_imageData;
    v8->_imageData = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    mimeType = v8->_mimeType;
    v8->_mimeType = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *imageData;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    imageData = self->_imageData;
    objc_msgSend(v4, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSData isEqualToData:](imageData, "isEqualToData:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unsigned)type
{
  return 1;
}

- (BOOL)hasArtworkData
{
  return -[NSData length](self->_imageData, "length") != 0;
}

- (id)copyImageData
{
  return (id)-[NSData copy](self->_imageData, "copy");
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *StringRepresentation;
  void *v6;
  void *v7;
  __CFString *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  StringRepresentation = (void *)MRDataCreateStringRepresentation(self->_imageData);
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:%p %@\n"), v4, self, StringRepresentation);

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "shouldLogArtwork"))
  {
    v8 = (__CFString *)MRCreateASCIIRepresentationFromImageData((const __CFData *)self->_imageData);
    objc_msgSend(v6, "appendFormat:", CFSTR("%@\n"), v8);

  }
  return v6;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
