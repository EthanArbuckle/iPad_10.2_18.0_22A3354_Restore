@implementation MPMediaItemArtwork

- (MPMediaItemArtwork)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("image must be non-nil"));

  return 0;
}

- (MPMediaItemArtwork)initWithImage:(UIImage *)image
{
  UIImage *v4;
  UIImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  MPMediaItemArtwork *v10;
  _QWORD v12[4];
  UIImage *v13;

  v4 = image;
  v5 = v4;
  if (v4)
  {
    -[UIImage size](v4, "size");
    v7 = v6;
    v9 = v8;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36__MPMediaItemArtwork_initWithImage___block_invoke;
    v12[3] = &unk_1E3155CD0;
    v13 = v5;
    self = -[MPMediaItemArtwork initWithBoundsSize:requestHandler:](self, "initWithBoundsSize:requestHandler:", v12, v7, v9);

    v10 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("image must be non-nil"));
    v10 = 0;
  }

  return v10;
}

- (MPMediaItemArtwork)initWithBoundsSize:(CGSize)boundsSize requestHandler:(void *)requestHandler
{
  CGFloat height;
  CGFloat width;
  void *v7;
  MPMediaItemArtwork *v8;
  MPMediaItemArtwork *v9;
  uint64_t v10;
  id v11;
  MPMediaItemArtwork *v12;
  objc_super v14;

  height = boundsSize.height;
  width = boundsSize.width;
  v7 = requestHandler;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)MPMediaItemArtwork;
    v8 = -[MPMediaItemArtwork init](&v14, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_bounds.width = width;
      v8->_bounds.height = height;
      v10 = MEMORY[0x19403A810](v7);
      v11 = v9->_requestHandler;
      v9->_requestHandler = (id)v10;

    }
    self = v9;
    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("requestHandler must be non-nil"));
    v12 = 0;
  }

  return v12;
}

- (UIImage)imageWithSize:(CGSize)size
{
  double width;
  double height;

  width = self->_bounds.width;
  height = self->_bounds.height;
  if ((*MEMORY[0x1E0C9D820] != width || *(double *)(MEMORY[0x1E0C9D820] + 8) != height)
    && (size.height > height || size.width > width))
  {
    size = self->_bounds;
  }
  return (UIImage *)(*((uint64_t (**)(__n128, __n128))self->_requestHandler + 2))((__n128)size, *(__n128 *)&size.height);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double width;
  double height;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  width = self->_bounds.width;
  height = self->_bounds.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)jpegDataWithSize:(CGSize)a3
{
  UIImage *v3;
  void *v4;

  -[MPMediaItemArtwork imageWithSize:](self, "imageWithSize:", a3.width, a3.height);
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(v3, *MEMORY[0x1E0D4CF38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pngDataWithSize:(CGSize)a3
{
  UIImage *v3;
  void *v4;

  -[MPMediaItemArtwork imageWithSize:](self, "imageWithSize:", a3.width, a3.height);
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestHandler, 0);
}

id __36__MPMediaItemArtwork_initWithImage___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
