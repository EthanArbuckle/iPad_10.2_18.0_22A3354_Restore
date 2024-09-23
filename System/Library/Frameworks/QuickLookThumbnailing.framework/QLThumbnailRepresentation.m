@implementation QLThumbnailRepresentation

- (QLThumbnailRepresentation)initWithThumbnailType:(int64_t)a3 iconFlavor:(int)a4 CGImage:(CGImage *)a5 scale:(double)a6 contentRect:(CGRect)a7 generatedProperties:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  QLThumbnailRepresentation *v19;
  QLThumbnailRepresentation *v20;
  uint64_t v21;
  NSArray *images;
  objc_super v24;
  _QWORD v25[2];

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v25[1] = *MEMORY[0x1E0C80C00];
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)QLThumbnailRepresentation;
  v19 = -[QLThumbnailRepresentation init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    if (a5)
    {
      v25[0] = a5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v21 = objc_claimAutoreleasedReturnValue();
      images = v20->_images;
      v20->_images = (NSArray *)v21;
    }
    else
    {
      images = v19->_images;
      v19->_images = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    v20->_scale = a6;
    v20->_flavor = a4;
    v20->_contentRect.origin.x = x;
    v20->_contentRect.origin.y = y;
    v20->_contentRect.size.width = width;
    v20->_contentRect.size.height = height;
    objc_storeStrong((id *)&v20->_generatedProperties, a8);
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedProperties, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_UIImageThumbnail, 0);
  objc_storeStrong((id *)&self->_NSImage, 0);
}

- (UIImage)UIImage
{
  UIImage *UIImageThumbnail;
  UIImage *v4;
  UIImage *v5;

  UIImageThumbnail = self->_UIImageThumbnail;
  if (!UIImageThumbnail)
  {
    v4 = (UIImage *)objc_msgSend(objc_alloc((Class)QLTImageClassWithError(0)), "initWithCGImage:scale:orientation:", -[QLThumbnailRepresentation CGImage](self, "CGImage"), 0, self->_scale);
    v5 = self->_UIImageThumbnail;
    self->_UIImageThumbnail = v4;

    UIImageThumbnail = self->_UIImageThumbnail;
  }
  return UIImageThumbnail;
}

- (QLThumbnailRepresentation)initWithThumbnailType:(int64_t)a3 iconFlavor:(int)a4 images:(id)a5 scale:(double)a6 contentRect:(CGRect)a7 generatedProperties:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  QLThumbnailRepresentation *v20;
  QLThumbnailRepresentation *v21;
  objc_super v23;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18 = a5;
  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)QLThumbnailRepresentation;
  v20 = -[QLThumbnailRepresentation init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_type = a3;
    objc_storeStrong((id *)&v20->_images, a5);
    v21->_scale = a6;
    v21->_flavor = a4;
    v21->_contentRect.origin.x = x;
    v21->_contentRect.origin.y = y;
    v21->_contentRect.size.width = width;
    v21->_contentRect.size.height = height;
    objc_storeStrong((id *)&v21->_generatedProperties, a8);
  }

  return v21;
}

- (CGImageRef)CGImage
{
  void *v2;

  -[NSArray firstObject](self->_images, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (CGImageRef)v2;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  QLThumbnailRepresentationType v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[QLThumbnailRepresentation type](self, "type");
  v7 = CFSTR("Icon");
  if (v6 == QLThumbnailRepresentationTypeLowQualityThumbnail)
    v7 = CFSTR("LowQualityThumbnail");
  if (v6 == QLThumbnailRepresentationTypeThumbnail)
    v7 = CFSTR("Thumbnail");
  v8 = v7;
  if (-[NSArray count](self->_images, "count") <= 1)
  {
    v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p type: %@%@; properties=%@>"),
                    v5,
                    self,
                    v8,
                    &stru_1E5D7DA98,
                    self->_generatedProperties);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("; %lu images"),
      -[NSArray count](self->_images, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p type: %@%@; properties=%@>"),
                    v5,
                    self,
                    v8,
                    v9,
                    self->_generatedProperties);

  }
  return v10;
}

- (QLThumbnailRepresentationType)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSImage)NSImage
{
  return self->_NSImage;
}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  self->_contentRect = a3;
}

- (UIImage)UIImageThumbnail
{
  return self->_UIImageThumbnail;
}

- (void)setUIImageThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_UIImageThumbnail, a3);
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int)flavor
{
  return self->_flavor;
}

- (void)setFlavor:(int)a3
{
  self->_flavor = a3;
}

- (QLThumbnailMetadata)generatedProperties
{
  return (QLThumbnailMetadata *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGeneratedProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

@end
