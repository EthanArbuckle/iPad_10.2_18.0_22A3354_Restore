@implementation _MPStaticArtworkVisualIdenticalityIdentifier

- (BOOL)isEqual:(id)a3
{
  _MPStaticArtworkVisualIdenticalityIdentifier *v4;
  _MPStaticArtworkVisualIdenticalityIdentifier *v5;
  NSString *imageArtworkIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  char v11;
  NSString *videoArtworkIdentifier;
  NSString *v13;
  NSString *v14;
  NSString *v15;

  v4 = (_MPStaticArtworkVisualIdenticalityIdentifier *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      imageArtworkIdentifier = self->_imageArtworkIdentifier;
      v7 = v5->_imageArtworkIdentifier;
      if (imageArtworkIdentifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = imageArtworkIdentifier;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      videoArtworkIdentifier = self->_videoArtworkIdentifier;
      v13 = v5->_videoArtworkIdentifier;
      v14 = videoArtworkIdentifier;
      v15 = v14;
      if (v14 == v13)
        v11 = 1;
      else
        v11 = -[NSString isEqual:](v14, "isEqual:", v13);

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _MPStaticArtworkVisualIdenticalityIdentifier *v4;

  v4 = objc_alloc_init(_MPStaticArtworkVisualIdenticalityIdentifier);
  -[_MPStaticArtworkVisualIdenticalityIdentifier setImageArtworkIdentifier:](v4, "setImageArtworkIdentifier:", self->_imageArtworkIdentifier);
  -[_MPStaticArtworkVisualIdenticalityIdentifier setVideoArtworkIdentifier:](v4, "setVideoArtworkIdentifier:", self->_videoArtworkIdentifier);
  return v4;
}

- (id)stringRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_MPStaticArtworkVisualIdenticalityIdentifier imageArtworkIdentifier](self, "imageArtworkIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[_MPStaticArtworkVisualIdenticalityIdentifier videoArtworkIdentifier](self, "videoArtworkIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("i=%@/v=%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)imageArtworkIdentifier
{
  return self->_imageArtworkIdentifier;
}

- (void)setImageArtworkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)videoArtworkIdentifier
{
  return self->_videoArtworkIdentifier;
}

- (void)setVideoArtworkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_imageArtworkIdentifier, 0);
}

@end
