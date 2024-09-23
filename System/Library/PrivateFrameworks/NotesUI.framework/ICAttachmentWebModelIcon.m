@implementation ICAttachmentWebModelIcon

- (ICAttachmentWebModelIcon)initWithURL:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  ICAttachmentWebModelIcon *v8;
  ICAttachmentWebModelIcon *v9;
  objc_super v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICAttachmentWebModelIcon;
  v8 = -[ICAttachmentWebModelIcon init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ICAttachmentWebModelIcon setUrl:](v8, "setUrl:", v7);
    -[ICAttachmentWebModelIcon setSize:](v9, "setSize:", width, height);
  }

  return v9;
}

- (ICAttachmentWebModelIcon)initWithImageURL:(id)a3
{
  ICAttachmentWebModelIcon *v3;
  ICAttachmentWebModelIcon *v4;

  v3 = -[ICAttachmentWebModelIcon initWithURL:withSize:](self, "initWithURL:withSize:", a3, 0.0, 0.0);
  v4 = v3;
  if (v3)
    -[ICAttachmentWebModelIcon setScaleImageToIconSize:](v3, "setScaleImageToIconSize:", 1);
  return v4;
}

- (ICAttachmentWebModelIcon)initWithFallbackURL:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  ICAttachmentWebModelIcon *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  ICAttachmentWebModelIcon *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)ICAttachmentWebModelIcon;
    v8 = -[ICAttachmentWebModelIcon init](&v16, sel_init);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v7, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (width == 60.0 && height == 60.0)
      {
        objc_msgSend(v9, "setPath:", CFSTR("/apple-touch-icon.png"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/apple-touch-icon%.0fx%.0f.png"), *(_QWORD *)&width, *(_QWORD *)&height);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPath:", v13);

      }
      objc_msgSend(v10, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentWebModelIcon setUrl:](v8, "setUrl:", v14);

      -[ICAttachmentWebModelIcon setSize:](v8, "setSize:", width, height);
    }
    self = v8;
    v12 = self;
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICAttachmentWebModelIcon initWithFallbackURL:withSize:].cold.1(v11);

    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)ICAttachmentWebModelIcon;
  -[ICAttachmentWebModelIcon description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentWebModelIcon size](self, "size");
  v6 = v5;
  -[ICAttachmentWebModelIcon size](self, "size");
  v8 = v7;
  -[ICAttachmentWebModelIcon url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %.0fx%.0f %@"), v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)scaleImageToIconSize
{
  return self->_scaleImageToIconSize;
}

- (void)setScaleImageToIconSize:(BOOL)a3
{
  self->_scaleImageToIconSize = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithFallbackURL:(os_log_t)log withSize:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ICAttachmentWebModelIcon initWithFallbackURL:withSize:]";
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "nil URL passed to %s", (uint8_t *)&v1, 0xCu);
}

@end
