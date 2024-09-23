@implementation ICAttachmentPreviewImageLoader

- (ICAttachmentPreviewImageLoader)initWithOriginalImage:(id)a3 orientedImage:(id)a4 data:(id)a5 scale:(double)a6 previewImageURLs:(id)a7 delayLoadingURLs:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  ICAttachmentPreviewImageLoader *v19;
  ICAttachmentPreviewImageLoader *v20;
  void *v21;
  objc_super v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ICAttachmentPreviewImageLoader;
  v19 = -[ICAttachmentPreviewImageLoader init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_image, a3);
    objc_storeStrong((id *)&v20->_originalImage, a3);
    objc_storeStrong((id *)&v20->_orientedImage, a4);
    objc_storeStrong((id *)&v20->_data, a5);
    v20->_scale = a6;
    objc_storeStrong((id *)&v20->_previewImageURLs, a7);
    v20->_delayLoadingURLs = a8;
    if (!a8)
    {
      -[ICAttachmentPreviewImageLoader data](v20, "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        -[ICAttachmentPreviewImageLoader loadData](v20, "loadData");
    }
  }

  return v20;
}

- (void)loadData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICAttachmentPreviewImageLoader previewImageURLs](self, "previewImageURLs", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentPreviewImageLoader setData:](self, "setData:", v8);

      -[ICAttachmentPreviewImageLoader data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSArray)previewImageURLs
{
  return self->_previewImageURLs;
}

- (id)loadImage
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;

  -[ICAttachmentPreviewImageLoader image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[ICAttachmentPreviewImageLoader delayLoadingURLs](self, "delayLoadingURLs"))
    {
      -[ICAttachmentPreviewImageLoader data](self, "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        -[ICAttachmentPreviewImageLoader loadData](self, "loadData");
    }
    -[ICAttachmentPreviewImageLoader data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.data", "-[ICAttachmentPreviewImageLoader loadImage]", 1, 0, CFSTR("No preview image data to load"));
    -[ICAttachmentPreviewImageLoader data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0DC3870];
      -[ICAttachmentPreviewImageLoader data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentPreviewImageLoader scale](self, "scale");
      objc_msgSend(v8, "imageWithData:scale:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentPreviewImageLoader setImage:](self, "setImage:", v10);

    }
    else
    {
      v11 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ICAttachmentPreviewImageLoader loadImage].cold.1(self, v11);

      v12 = objc_alloc_init(MEMORY[0x1E0DC3870]);
      -[ICAttachmentPreviewImageLoader setImage:](self, "setImage:", v12);

    }
    -[ICAttachmentPreviewImageLoader image](self, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ICAttachmentPreviewImageLoader imageDidLoadBlock](self, "imageDidLoadBlock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[ICAttachmentPreviewImageLoader imageDidLoadBlock](self, "imageDidLoadBlock");
        v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[ICAttachmentPreviewImageLoader image](self, "image");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v15)[2](v15, v16, 0);

      }
    }
  }
  -[ICAttachmentPreviewImageLoader image](self, "image");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIImage)image
{
  return self->_image;
}

- (NSData)data
{
  return self->_data;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (double)scale
{
  return self->_scale;
}

- (id)loadOrientedImage
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;

  -[ICAttachmentPreviewImageLoader orientedImage](self, "orientedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[ICAttachmentPreviewImageLoader loadImage](self, "loadImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[ICAttachmentPreviewImageLoader imageOrientation](self, "imageOrientation");
      if (v5)
      {
        v6 = v5;
        v7 = objc_alloc(MEMORY[0x1E0DC3870]);
        v8 = objc_msgSend(v4, "ic_CGImage");
        objc_msgSend(v4, "scale");
        v9 = objc_msgSend(v7, "initWithCGImage:scale:orientation:", v8, v6);

        v4 = (void *)v9;
      }
    }
    -[ICAttachmentPreviewImageLoader setOrientedImage:](self, "setOrientedImage:", v4);
    -[ICAttachmentPreviewImageLoader orientedImage](self, "orientedImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ICAttachmentPreviewImageLoader imageDidLoadBlock](self, "imageDidLoadBlock");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[ICAttachmentPreviewImageLoader imageDidLoadBlock](self, "imageDidLoadBlock");
        v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[ICAttachmentPreviewImageLoader orientedImage](self, "orientedImage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v13, 1);

      }
    }

  }
  return -[ICAttachmentPreviewImageLoader orientedImage](self, "orientedImage");
}

- (UIImage)orientedImage
{
  return self->_orientedImage;
}

- (id)imageDidLoadBlock
{
  return self->_imageDidLoadBlock;
}

- (void)setOrientedImage:(id)a3
{
  objc_storeStrong((id *)&self->_orientedImage, a3);
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (BOOL)delayLoadingURLs
{
  return self->_delayLoadingURLs;
}

- (BOOL)canLoadImage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ICAttachmentPreviewImageLoader originalImage](self, "originalImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return 1;
  }
  -[ICAttachmentPreviewImageLoader data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICAttachmentPreviewImageLoader previewImageURLs](self, "previewImageURLs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

        if ((v13 & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  return 0;
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (void)setImageDidLoadBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImageURLs, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_orientedImage, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_imageDidLoadBlock, 0);
}

+ (id)orientedImage:(id)a3 withBackground:(int)a4
{
  __int128 v4;
  _OWORD v6[3];
  _OWORD v7[2];
  __int128 v8;

  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v4;
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v6[0] = v7[0];
  v6[1] = v4;
  v6[2] = v8;
  objc_msgSend(a1, "orientedImage:withTransform:background:backgroundTransform:", a3, v7, *(_QWORD *)&a4, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)orientedImage:(id)a3 withTransform:(CGAffineTransform *)a4 background:(int)a5 backgroundTransform:(CGAffineTransform *)a6
{
  id v8;
  __int128 v9;
  BOOL IsIdentity;
  uint64_t v11;
  CGImage *v12;
  __int128 v13;
  __int128 v14;
  CGFloat v15;
  CGFloat v16;
  double Width;
  double Height;
  __int128 v19;
  CGFloat v20;
  double v21;
  double v22;
  double x;
  double y;
  CGFloat v25;
  CGFloat v26;
  CGContext *v27;
  CGContext *v28;
  CGColorSpace *ColorSpace;
  CGColor *v30;
  id v31;
  __int128 v32;
  CGImage *v33;
  CGImage *Image;
  uint64_t v35;
  CGAffineTransform v37;
  CGAffineTransform transform;
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&transform.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&transform.c = v9;
    *(_OWORD *)&transform.tx = *(_OWORD *)&a4->tx;
    IsIdentity = CGAffineTransformIsIdentity(&transform);
    if (a5 || !IsIdentity)
    {
      v11 = objc_msgSend(v8, "ic_CGImage");
      if (v11)
      {
        v12 = (CGImage *)v11;
        v13 = *(_OWORD *)&a4->c;
        *(_OWORD *)&v37.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&v37.c = v13;
        *(_OWORD *)&v37.tx = *(_OWORD *)&a4->tx;
        CGAffineTransformInvert(&transform, &v37);
        v14 = *(_OWORD *)&transform.c;
        *(_OWORD *)&a4->a = *(_OWORD *)&transform.a;
        *(_OWORD *)&a4->c = v14;
        *(_OWORD *)&a4->tx = *(_OWORD *)&transform.tx;
        v15 = *MEMORY[0x1E0C9D538];
        v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        Width = (double)CGImageGetWidth(v12);
        Height = (double)CGImageGetHeight(v12);
        v19 = *(_OWORD *)&a4->c;
        *(_OWORD *)&transform.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&transform.c = v19;
        *(_OWORD *)&transform.tx = *(_OWORD *)&a4->tx;
        v20 = v15;
        *(CGFloat *)&v19 = v16;
        v21 = Width;
        v22 = Height;
        v40 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v19 - 8), &transform);
        x = v40.origin.x;
        y = v40.origin.y;
        v25 = v40.size.width;
        v26 = v40.size.height;
        v27 = (CGContext *)TSUCreateRGBABitmapContext();
        if (v27)
        {
          v28 = v27;
          if (a5 == 2)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "ic_attachmentBackgroundColor");
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            CGContextSetFillColorWithColor(v28, (CGColorRef)objc_msgSend(v31, "CGColor"));
            v42.origin.x = 0.0;
            v42.origin.y = 0.0;
            v42.size.width = v25;
            v42.size.height = v26;
            CGContextFillRect(v28, v42);

          }
          else if (a5 == 1)
          {
            *(_OWORD *)&transform.a = xmmword_1ACA58BD8;
            *(_OWORD *)&transform.c = unk_1ACA58BE8;
            ColorSpace = CGBitmapContextGetColorSpace(v27);
            v30 = CGColorCreate(ColorSpace, &transform.a);
            CGContextSetFillColorWithColor(v28, v30);
            v41.origin.x = 0.0;
            v41.origin.y = 0.0;
            v41.size.width = v25;
            v41.size.height = v26;
            CGContextFillRect(v28, v41);
            CGColorRelease(v30);
          }
          CGContextTranslateCTM(v28, -x, -y);
          v32 = *(_OWORD *)&a4->c;
          *(_OWORD *)&transform.a = *(_OWORD *)&a4->a;
          *(_OWORD *)&transform.c = v32;
          *(_OWORD *)&transform.tx = *(_OWORD *)&a4->tx;
          CGContextConcatCTM(v28, &transform);
          v33 = (CGImage *)objc_msgSend(v8, "ic_CGImage");
          v43.origin.x = v15;
          v43.origin.y = v16;
          v43.size.width = Width;
          v43.size.height = Height;
          CGContextDrawImage(v28, v43, v33);
          Image = CGBitmapContextCreateImage(v28);
          CGContextRelease(v28);
          if (Image)
          {
            v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", Image);
            CGImageRelease(Image);

            v8 = (id)v35;
          }
        }
      }
    }
  }
  return v8;
}

- (void)setOriginalImage:(id)a3
{
  objc_storeStrong((id *)&self->_originalImage, a3);
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setPreviewImageURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setDelayLoadingURLs:(BOOL)a3
{
  self->_delayLoadingURLs = a3;
}

- (void)loadImage
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "previewImageURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "unable to retrieve preview image %@", (uint8_t *)&v4, 0xCu);

}

@end
