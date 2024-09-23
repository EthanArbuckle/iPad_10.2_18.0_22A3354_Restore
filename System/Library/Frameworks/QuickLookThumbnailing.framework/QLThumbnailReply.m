@implementation QLThumbnailReply

- (QLThumbnailReply)init
{
  QLThumbnailReply *v2;
  uint64_t v3;
  QLThumbnailMetadata *metadata;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLThumbnailReply;
  v2 = -[QLThumbnailReply init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    metadata = v2->_metadata;
    v2->_metadata = (QLThumbnailMetadata *)v3;

    -[QLThumbnailMetadata setIconFlavor:](v2->_metadata, "setIconFlavor:", 0x7FFFFFFFLL);
    -[QLThumbnailMetadata setInlinePreviewMode:](v2->_metadata, "setInlinePreviewMode:", 1);
  }
  return v2;
}

+ (QLThumbnailReply)replyWithContextSize:(CGSize)contextSize drawingBlock:(void *)drawingBlock
{
  double height;
  double width;
  void *v6;
  void *v7;

  height = contextSize.height;
  width = contextSize.width;
  v6 = drawingBlock;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDrawInContextBlock:", v6);

  objc_msgSend(v7, "setContextSize:", width, height);
  objc_msgSend(v7, "setType:", 0);
  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithContextSize:(CGSize)contextSize currentContextDrawingBlock:(void *)drawingBlock
{
  double height;
  double width;
  void *v6;
  void *v7;

  height = contextSize.height;
  width = contextSize.width;
  v6 = drawingBlock;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDrawingBlock:", v6);

  objc_msgSend(v7, "setContextSize:", width, height);
  objc_msgSend(v7, "setType:", 1);
  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithImageFileURL:(NSURL *)fileURL
{
  NSURL *v3;
  void *v4;
  QLThumbnailItem *v5;

  v3 = fileURL;
  v4 = (void *)objc_opt_new();
  v5 = -[QLThumbnailItem initWithURL:]([QLThumbnailItem alloc], "initWithURL:", v3);

  objc_msgSend(v4, "setItem:", v5);
  objc_msgSend(v4, "setType:", 3);
  return (QLThumbnailReply *)v4;
}

+ (QLThumbnailReply)replyWithFileURL:(id)a3 contentType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  QLThumbnailItem *v9;
  QLThumbnailItem *v10;
  void *v11;
  QLThumbnailItem *v12;
  QLThumbnailItem *v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
  v9 = [QLThumbnailItem alloc];
  v10 = v9;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithSecurityScopedURL:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[QLThumbnailItem initWithURLWrapper:parentDirectoryWrapper:contentType:](v10, "initWithURLWrapper:parentDirectoryWrapper:contentType:", v11, 0, v6);

    objc_msgSend(v7, "setItem:", v12);
    objc_msgSend(v5, "stopAccessingSecurityScopedResource");
  }
  else
  {
    v13 = -[QLThumbnailItem initWithURL:contentType:](v9, "initWithURL:contentType:", v5, v6);

    objc_msgSend(v7, "setItem:", v13);
  }
  objc_msgSend(v7, "setType:", 3);

  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithData:(id)a3 contentType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  QLThumbnailItem *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = -[QLThumbnailItem initWithData:contentType:]([QLThumbnailItem alloc], "initWithData:contentType:", v6, v5);

  objc_msgSend(v7, "setItem:", v8);
  objc_msgSend(v7, "setType:", 3);
  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithContextSize:(CGSize)a3 ioSurfaceBlock:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setIoSurfaceBlock:", v6);

  objc_msgSend(v7, "setContextSize:", width, height);
  objc_msgSend(v7, "setType:", 4);
  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithContextSize:(CGSize)a3 ioSurfaceAsyncBlock:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setIoSurfaceAsyncBlock:", v6);

  objc_msgSend(v7, "setContextSize:", width, height);
  objc_msgSend(v7, "setType:", 4);
  return (QLThumbnailReply *)v7;
}

+ (QLThumbnailReply)replyWithImages:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setImages:", v3);

  objc_msgSend(v4, "setType:", 5);
  return (QLThumbnailReply *)v4;
}

+ (QLThumbnailReply)replyWithImageRenderer:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setRendererBlock:", v3);

  objc_msgSend(v4, "setType:", 6);
  return (QLThumbnailReply *)v4;
}

- (NSString)extensionBadge
{
  return -[QLThumbnailMetadata extensionBadge](self->_metadata, "extensionBadge");
}

- (int)iconFlavor
{
  return -[QLThumbnailMetadata iconFlavor](self->_metadata, "iconFlavor");
}

- (BOOL)isLowQuality
{
  return -[QLThumbnailMetadata isLowQuality](self->_metadata, "isLowQuality");
}

- (int)inlinePreviewMode
{
  return -[QLThumbnailMetadata inlinePreviewMode](self->_metadata, "inlinePreviewMode");
}

- (void)setExtensionBadge:(NSString *)extensionBadge
{
  -[QLThumbnailMetadata setExtensionBadge:](self->_metadata, "setExtensionBadge:", extensionBadge);
}

- (void)setInlinePreviewMode:(int)a3
{
  -[QLThumbnailMetadata setInlinePreviewMode:](self->_metadata, "setInlinePreviewMode:", *(_QWORD *)&a3);
}

- (void)setIconFlavor:(int)a3
{
  -[QLThumbnailMetadata setIconFlavor:](self->_metadata, "setIconFlavor:", *(_QWORD *)&a3);
}

- (void)setIsLowQuality:(BOOL)a3
{
  -[QLThumbnailMetadata setIsLowQuality:](self->_metadata, "setIsLowQuality:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("t"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bitmapImages, CFSTR("b"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ioSurface, CFSTR("sf"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_item, CFSTR("it"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("m"));

}

- (QLThumbnailReply)initWithCoder:(id)a3
{
  id v3;
  QLThumbnailReply *v4;
  uint64_t v5;
  NSArray *bitmapImages;
  uint64_t v7;
  IOSurface *ioSurface;
  uint64_t v9;
  QLThumbnailItem *item;
  uint64_t v11;
  QLThumbnailMetadata *metadata;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)QLThumbnailReply;
  v3 = a3;
  v4 = -[QLThumbnailReply init](&v14, sel_init);
  v4->_type = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("t"), v14.receiver, v14.super_class);
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("b"));
  v5 = objc_claimAutoreleasedReturnValue();
  bitmapImages = v4->_bitmapImages;
  v4->_bitmapImages = (NSArray *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sf"));
  v7 = objc_claimAutoreleasedReturnValue();
  ioSurface = v4->_ioSurface;
  v4->_ioSurface = (IOSurface *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("it"));
  v9 = objc_claimAutoreleasedReturnValue();
  item = v4->_item;
  v4->_item = (QLThumbnailItem *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("m"));
  v11 = objc_claimAutoreleasedReturnValue();

  metadata = v4->_metadata;
  v4->_metadata = (QLThumbnailMetadata *)v11;

  return v4;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> type:%lu"), objc_opt_class(), self, self->_type);
}

- (CGSize)contextSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contextSize.width;
  height = self->_contextSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContextSize:(CGSize)a3
{
  self->_contextSize = a3;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  self->_colorSpace = a3;
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)drawingBlock
{
  return self->_drawingBlock;
}

- (void)setDrawingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)drawInContextBlock
{
  return self->_drawInContextBlock;
}

- (void)setDrawInContextBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)ioSurfaceBlock
{
  return self->_ioSurfaceBlock;
}

- (void)setIoSurfaceBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)ioSurfaceAsyncBlock
{
  return self->_ioSurfaceAsyncBlock;
}

- (void)setIoSurfaceAsyncBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)rendererBlock
{
  return self->_rendererBlock;
}

- (void)setRendererBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (QLThumbnailItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSArray)bitmapImages
{
  return self->_bitmapImages;
}

- (void)setBitmapImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)setIoSurface:(id)a3
{
  objc_storeStrong((id *)&self->_ioSurface, a3);
}

- (QLThumbnailMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_ioSurface, 0);
  objc_storeStrong((id *)&self->_bitmapImages, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong(&self->_rendererBlock, 0);
  objc_storeStrong(&self->_ioSurfaceAsyncBlock, 0);
  objc_storeStrong(&self->_ioSurfaceBlock, 0);
  objc_storeStrong(&self->_drawInContextBlock, 0);
  objc_storeStrong(&self->_drawingBlock, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
