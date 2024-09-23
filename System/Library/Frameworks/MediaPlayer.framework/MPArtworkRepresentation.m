@implementation MPArtworkRepresentation

- (BOOL)isImagePrepared
{
  return self->_imagePrepared;
}

- (int64_t)kind
{
  return self->_kind;
}

- (CGSize)representationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_representationSize.width;
  height = self->_representationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (MPArtworkRepresentation)representationWithPreparedImage:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = (_QWORD *)objc_opt_new();
  objc_msgSend(v5, "setKind:", -[MPArtworkRepresentation kind](self, "kind"));
  objc_msgSend(v5, "setImage:", v4);

  -[MPArtworkRepresentation representationSize](self, "representationSize");
  objc_msgSend(v5, "setRepresentationSize:");
  -[MPArtworkRepresentation representationToken](self, "representationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRepresentationToken:", v6);

  objc_msgSend(v5, "setImagePrepared:", 1);
  -[MPArtworkRepresentation visualIdenticalityStringRepresentation](self, "visualIdenticalityStringRepresentation");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v5[5];
  v5[5] = v7;

  return (MPArtworkRepresentation *)v5;
}

+ (id)representationForVisualIdentity:(id)a3 withSize:(CGSize)a4 image:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  MPArtworkRepresentation *v10;
  uint64_t v11;
  NSString *visualIdenticalityStringRepresentation;

  if (a5)
  {
    height = a4.height;
    width = a4.width;
    v8 = a5;
    v9 = a3;
    v10 = objc_alloc_init(MPArtworkRepresentation);
    -[MPArtworkRepresentation setKind:](v10, "setKind:", 0);
    -[MPArtworkRepresentation setImage:](v10, "setImage:", v8);

    -[MPArtworkRepresentation setRepresentationSize:](v10, "setRepresentationSize:", width, height);
    objc_msgSend(v9, "stringRepresentation");
    v11 = objc_claimAutoreleasedReturnValue();

    visualIdenticalityStringRepresentation = v10->_visualIdenticalityStringRepresentation;
    v10->_visualIdenticalityStringRepresentation = (NSString *)v11;

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)setRepresentationSize:(CGSize)a3
{
  self->_representationSize = a3;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setRepresentationToken:(id)a3
{
  objc_storeStrong(&self->_representationToken, a3);
}

- (id)representationToken
{
  return self->_representationToken;
}

- (NSString)visualIdenticalityStringRepresentation
{
  return self->_visualIdenticalityStringRepresentation;
}

- (void)setImagePrepared:(BOOL)a3
{
  self->_imagePrepared = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representationToken, 0);
  objc_storeStrong((id *)&self->_visualIdenticalityStringRepresentation, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (AVAsset)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
  objc_storeStrong((id *)&self->_video, a3);
}

+ (id)representationForVisualIdentity:(id)a3 withSize:(CGSize)a4 video:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  MPArtworkRepresentation *v10;
  uint64_t v11;
  NSString *visualIdenticalityStringRepresentation;

  if (a5)
  {
    height = a4.height;
    width = a4.width;
    v8 = a5;
    v9 = a3;
    v10 = objc_alloc_init(MPArtworkRepresentation);
    -[MPArtworkRepresentation setKind:](v10, "setKind:", 1);
    -[MPArtworkRepresentation setVideo:](v10, "setVideo:", v8);

    -[MPArtworkRepresentation setRepresentationSize:](v10, "setRepresentationSize:", width, height);
    objc_msgSend(v9, "stringRepresentation");
    v11 = objc_claimAutoreleasedReturnValue();

    visualIdenticalityStringRepresentation = v10->_visualIdenticalityStringRepresentation;
    v10->_visualIdenticalityStringRepresentation = (NSString *)v11;

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)representationWithSize:(CGSize)a3 image:(id)a4
{
  return (id)objc_msgSend(a1, "representationForVisualIdentity:withSize:image:", &stru_1E3163D10, a4, a3.width, a3.height);
}

+ (id)representationWithSize:(CGSize)a3 video:(id)a4
{
  return (id)objc_msgSend(a1, "representationForVisualIdentity:withSize:video:", &stru_1E3163D10, a4, a3.width, a3.height);
}

@end
