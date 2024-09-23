@implementation MSMessageTemplateLayout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSMessageTemplateLayout)init
{
  MSMessageTemplateLayout *v2;
  MSMessageTemplateLayout *v3;
  NSString *caption;
  NSString *subcaption;
  NSString *trailingCaption;
  NSString *trailingSubcaption;
  NSString *imageTitle;
  NSString *imageSubtitle;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MSMessageTemplateLayout;
  v2 = -[MSMessageLayout _init](&v11, sel__init);
  v3 = v2;
  if (v2)
  {
    caption = v2->_caption;
    v2->_caption = (NSString *)&stru_1EA25D770;

    subcaption = v3->_subcaption;
    v3->_subcaption = (NSString *)&stru_1EA25D770;

    trailingCaption = v3->_trailingCaption;
    v3->_trailingCaption = (NSString *)&stru_1EA25D770;

    trailingSubcaption = v3->_trailingSubcaption;
    v3->_trailingSubcaption = (NSString *)&stru_1EA25D770;

    imageTitle = v3->_imageTitle;
    v3->_imageTitle = (NSString *)&stru_1EA25D770;

    imageSubtitle = v3->_imageSubtitle;
    v3->_imageSubtitle = (NSString *)&stru_1EA25D770;

  }
  return v3;
}

- (MSMessageTemplateLayout)initWithCoder:(id)a3
{
  id v4;
  MSMessageTemplateLayout *v5;
  uint64_t v6;
  NSString *caption;
  uint64_t v8;
  NSString *subcaption;
  uint64_t v10;
  NSString *trailingCaption;
  uint64_t v12;
  NSString *trailingSubcaption;
  uint64_t v14;
  NSString *imageTitle;
  uint64_t v16;
  NSString *imageSubtitle;
  uint64_t v18;
  NSString *mediaType;
  uint64_t v20;
  NSData *mediaData;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MSMessageTemplateLayout;
  v5 = -[MSMessageLayout _init](&v23, sel__init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caption"));
    v6 = objc_claimAutoreleasedReturnValue();
    caption = v5->_caption;
    v5->_caption = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subcaption"));
    v8 = objc_claimAutoreleasedReturnValue();
    subcaption = v5->_subcaption;
    v5->_subcaption = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trailingCaption"));
    v10 = objc_claimAutoreleasedReturnValue();
    trailingCaption = v5->_trailingCaption;
    v5->_trailingCaption = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trailingSubcaption"));
    v12 = objc_claimAutoreleasedReturnValue();
    trailingSubcaption = v5->_trailingSubcaption;
    v5->_trailingSubcaption = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    imageTitle = v5->_imageTitle;
    v5->_imageTitle = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageSubitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    imageSubtitle = v5->_imageSubtitle;
    v5->_imageSubtitle = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
    v18 = objc_claimAutoreleasedReturnValue();
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaData"));
    v20 = objc_claimAutoreleasedReturnValue();
    mediaData = v5->_mediaData;
    v5->_mediaData = (NSData *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  UIImage *image;
  uint64_t v9;
  NSString *v10;
  NSURL *mediaFileURL;
  NSString *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "encodeObject:forKey:", self->_caption, CFSTR("caption"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_subcaption, CFSTR("subcaption"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_trailingCaption, CFSTR("trailingCaption"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_trailingSubcaption, CFSTR("trailingSubcaption"));
  v4 = self->_mediaData;
  v5 = self->_mediaType;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    image = self->_image;
    if (image)
    {
      -[UIImage __ms_PNGData](image, "__ms_PNGData");
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = (NSString *)(id)*MEMORY[0x1E0CA5C10];
    }
    else
    {
      mediaFileURL = self->_mediaFileURL;
      if (!mediaFileURL)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", mediaFileURL, 8, 0);
      v9 = objc_claimAutoreleasedReturnValue();

      -[NSURL __ms_UTI](self->_mediaFileURL, "__ms_UTI");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;
    v4 = (NSData *)v9;

    v6 = v12;
  }
LABEL_11:
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("mediaType"));
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("mediaData"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_imageTitle, CFSTR("imageTitle"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_imageSubtitle, CFSTR("imageSubitle"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  MSMessageTemplateLayout *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = -[MSMessageTemplateLayout init](+[MSMessageTemplateLayout allocWithZone:](MSMessageTemplateLayout, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_caption, "copyWithZone:", a3);
  -[MSMessageTemplateLayout setCaption:](v5, "setCaption:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_subcaption, "copyWithZone:", a3);
  -[MSMessageTemplateLayout setSubcaption:](v5, "setSubcaption:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_trailingCaption, "copyWithZone:", a3);
  -[MSMessageTemplateLayout setTrailingCaption:](v5, "setTrailingCaption:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_trailingSubcaption, "copyWithZone:", a3);
  -[MSMessageTemplateLayout setTrailingSubcaption:](v5, "setTrailingSubcaption:", v9);

  -[MSMessageTemplateLayout setImage:](v5, "setImage:", self->_image);
  v10 = (void *)-[NSURL copy](self->_mediaFileURL, "copy");
  -[MSMessageTemplateLayout setMediaFileURL:](v5, "setMediaFileURL:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_imageTitle, "copyWithZone:", a3);
  -[MSMessageTemplateLayout setImageTitle:](v5, "setImageTitle:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_imageSubtitle, "copyWithZone:", a3);
  -[MSMessageTemplateLayout setImageSubtitle:](v5, "setImageSubtitle:", v12);

  v13 = (void *)-[NSData copyWithZone:](self->_mediaData, "copyWithZone:", a3);
  -[MSMessageTemplateLayout setMediaData:](v5, "setMediaData:", v13);

  v14 = (void *)-[NSString copyWithZone:](self->_mediaType, "copyWithZone:", a3);
  -[MSMessageTemplateLayout setMediaType:](v5, "setMediaType:", v14);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MSMessageTemplateLayout *v4;
  MSMessageTemplateLayout *v5;
  NSString *caption;
  NSString *v7;
  NSString *subcaption;
  NSString *v9;
  NSString *trailingCaption;
  NSString *v11;
  NSString *trailingSubcaption;
  NSString *v13;
  NSString *imageTitle;
  NSString *v15;
  NSString *imageSubtitle;
  NSString *v17;
  char v18;

  v4 = (MSMessageTemplateLayout *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      caption = self->_caption;
      -[MSMessageTemplateLayout caption](v5, "caption");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (caption == v7 || -[NSString isEqualToString:](caption, "isEqualToString:", v7))
      {
        subcaption = self->_subcaption;
        -[MSMessageTemplateLayout subcaption](v5, "subcaption");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (subcaption == v9 || -[NSString isEqualToString:](subcaption, "isEqualToString:", v9))
        {
          trailingCaption = self->_trailingCaption;
          -[MSMessageTemplateLayout trailingCaption](v5, "trailingCaption");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (trailingCaption == v11 || -[NSString isEqualToString:](trailingCaption, "isEqualToString:", v11))
          {
            trailingSubcaption = self->_trailingSubcaption;
            -[MSMessageTemplateLayout trailingSubcaption](v5, "trailingSubcaption");
            v13 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (trailingSubcaption == v13 || -[NSString isEqualToString:](trailingSubcaption, "isEqualToString:", v13))
            {
              imageTitle = self->_imageTitle;
              -[MSMessageTemplateLayout imageTitle](v5, "imageTitle");
              v15 = (NSString *)objc_claimAutoreleasedReturnValue();
              if (imageTitle == v15 || -[NSString isEqualToString:](imageTitle, "isEqualToString:", v15))
              {
                imageSubtitle = self->_imageSubtitle;
                -[MSMessageTemplateLayout imageSubtitle](v5, "imageSubtitle");
                v17 = (NSString *)objc_claimAutoreleasedReturnValue();
                if (imageSubtitle == v17)
                  v18 = 1;
                else
                  v18 = -[NSString isEqualToString:](imageSubtitle, "isEqualToString:", v17);

              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_caption, "hash");
  v4 = -[NSString hash](self->_subcaption, "hash") ^ v3;
  v5 = -[NSString hash](self->_trailingCaption, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_trailingSubcaption, "hash");
  v7 = -[NSString hash](self->_imageTitle, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_imageSubtitle, "hash");
}

- (void)setMediaFileURL:(NSURL *)mediaFileURL
{
  NSString *mediaType;
  NSData *mediaData;
  void *v6;
  char v7;
  NSURL *v8;
  NSURL *v9;
  NSURL *v10;

  v10 = mediaFileURL;
  mediaType = self->_mediaType;
  self->_mediaType = 0;

  mediaData = self->_mediaData;
  self->_mediaData = 0;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSURL isEqual:](v10, "isEqual:", v6);

  v8 = 0;
  if ((v7 & 1) == 0)
    v8 = v10;
  v9 = self->_mediaFileURL;
  self->_mediaFileURL = v8;

}

- (NSURL)mediaFileURL
{
  NSURL *mediaFileURL;
  void *v4;
  NSURL *v5;
  NSURL *v6;

  mediaFileURL = self->_mediaFileURL;
  if (!mediaFileURL)
  {
    if (self->_mediaData && self->_mediaType)
    {
      +[_MSTempFileManager sharedInstance](_MSTempFileManager, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeTemporaryFileWithData:type:", self->_mediaData, self->_mediaType);
      v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v6 = self->_mediaFileURL;
      self->_mediaFileURL = v5;

      mediaFileURL = self->_mediaFileURL;
    }
    else
    {
      mediaFileURL = 0;
    }
  }
  return mediaFileURL;
}

- (void)setImage:(UIImage *)image
{
  UIImage *v4;
  NSString *mediaType;
  NSData *mediaData;
  UIImage *v7;

  v4 = image;
  mediaType = self->_mediaType;
  self->_mediaType = 0;

  mediaData = self->_mediaData;
  self->_mediaData = 0;

  v7 = self->_image;
  self->_image = v4;

}

- (UIImage)image
{
  NSData *v4;
  NSData *mediaData;
  NSString *v6;
  NSString *mediaType;
  const __CFString *v8;
  UIImage *v9;
  UIImage *image;

  if (!self->_image)
  {
    if (!self->_mediaFileURL || self->_mediaData && self->_mediaType)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    mediaData = self->_mediaData;
    self->_mediaData = v4;

    -[NSURL __ms_UTI](self->_mediaFileURL, "__ms_UTI");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    mediaType = self->_mediaType;
    self->_mediaType = v6;

    if (!self->_image)
    {
LABEL_13:
      if (self->_mediaData)
      {
        v8 = (const __CFString *)self->_mediaType;
        if (v8)
        {
          if (UTTypeConformsTo(v8, (CFStringRef)*MEMORY[0x1E0CA5B90]))
          {
            objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", self->_mediaData);
            v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
            image = self->_image;
            self->_image = v9;

          }
        }
      }
    }
  }
  return self->_image;
}

- (id)_sanitizedCopy
{
  void *v2;

  v2 = (void *)-[MSMessageTemplateLayout copy](self, "copy");
  objc_msgSend(v2, "setCaption:", 0);
  objc_msgSend(v2, "setSubcaption:", 0);
  objc_msgSend(v2, "setTrailingCaption:", 0);
  objc_msgSend(v2, "setTrailingSubcaption:", 0);
  objc_msgSend(v2, "setImageTitle:", 0);
  objc_msgSend(v2, "setImageSubtitle:", 0);
  return v2;
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(NSString *)caption
{
  objc_setProperty_nonatomic_copy(self, a2, caption, 8);
}

- (NSString)subcaption
{
  return self->_subcaption;
}

- (void)setSubcaption:(NSString *)subcaption
{
  objc_setProperty_nonatomic_copy(self, a2, subcaption, 16);
}

- (NSString)trailingCaption
{
  return self->_trailingCaption;
}

- (void)setTrailingCaption:(NSString *)trailingCaption
{
  objc_setProperty_nonatomic_copy(self, a2, trailingCaption, 24);
}

- (NSString)trailingSubcaption
{
  return self->_trailingSubcaption;
}

- (void)setTrailingSubcaption:(NSString *)trailingSubcaption
{
  objc_setProperty_nonatomic_copy(self, a2, trailingSubcaption, 32);
}

- (NSData)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
  objc_storeStrong((id *)&self->_mediaData, a3);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (NSString)imageTitle
{
  return self->_imageTitle;
}

- (void)setImageTitle:(NSString *)imageTitle
{
  objc_setProperty_nonatomic_copy(self, a2, imageTitle, 72);
}

- (NSString)imageSubtitle
{
  return self->_imageSubtitle;
}

- (void)setImageSubtitle:(NSString *)imageSubtitle
{
  objc_setProperty_nonatomic_copy(self, a2, imageSubtitle, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSubtitle, 0);
  objc_storeStrong((id *)&self->_imageTitle, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaFileURL, 0);
  objc_storeStrong((id *)&self->_trailingSubcaption, 0);
  objc_storeStrong((id *)&self->_trailingCaption, 0);
  objc_storeStrong((id *)&self->_subcaption, 0);
  objc_storeStrong((id *)&self->_caption, 0);
}

@end
