@implementation CNUIPRLikenessPhotoProvider

- (CGImage)_cnui_imageForSize:(CGSize)a3 scale:(double)a4
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  CNCache *cache;
  const void *v11;
  CGImage *v12;
  _QWORD v14[7];

  v5 = a3.width * a4;
  v6 = a3.height * a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSize(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-Thumbnail"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    cache = self->_cache;
  else
    cache = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__CNUIPRLikenessPhotoProvider__cnui_imageForSize_scale___block_invoke;
  v14[3] = &unk_1EA605630;
  v14[4] = self;
  *(double *)&v14[5] = v5;
  *(double *)&v14[6] = v6;
  -[CNCache objectForKey:onCacheMiss:](cache, "objectForKey:onCacheMiss:", v9, v14);
  v11 = (const void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = (CGImage *)CFAutorelease(v11);
  else
    v12 = 0;

  return v12;
}

- (CNUIPRLikenessPhotoProvider)initWithPhotoData:(id)a3 fingerprint:(id)a4
{
  id v6;
  id v7;
  CNUIPRLikenessPhotoProvider *v8;
  uint64_t v9;
  CNCache *cache;
  void *v11;
  void *v12;
  CNUIPRLikenessPhotoProvider *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUIPRLikenessPhotoProvider;
  v8 = -[CNUIPRLikenessPhotoProvider init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D139B0], "atomicCache");
    v9 = objc_claimAutoreleasedReturnValue();
    cache = v8->_cache;
    v8->_cache = (CNCache *)v9;

    _safeImageDataType(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = v6;
    else
      v12 = 0;
    objc_storeStrong((id *)&v8->_originalPhotoData, v12);

    objc_storeStrong((id *)&v8->_likenessFingerprint, a4);
    v13 = v8;
  }

  return v8;
}

id __56__CNUIPRLikenessPhotoProvider__cnui_imageForSize_scale___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "originalPhotoData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "cgThumbnailFromData:maxSize:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v4;
}

- (NSData)originalPhotoData
{
  return self->_originalPhotoData;
}

+ (CGImage)cgThumbnailFromData:(id)a3 maxSize:(CGSize)a4
{
  _QWORD v5[4];
  CGSize v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__CNUIPRLikenessPhotoProvider_cgThumbnailFromData_maxSize___block_invoke;
  v5[3] = &__block_descriptor_48_e34___CGImage__16__0__CGImageSource__8l;
  v6 = a4;
  return (CGImage *)_cgProcessSafeImageSourceFromData(a3, v5);
}

CGImageRef __59__CNUIPRLikenessPhotoProvider_cgThumbnailFromData_maxSize___block_invoke(uint64_t a1, CGImageSource *a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  const __CFDictionary *v7;
  CGImageRef ThumbnailAtIndex;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CBD178];
  v11[0] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0CBD2A0];
  v10[0] = v3;
  v10[1] = v4;
  v5 = *(double *)(a1 + 32);
  if (v5 < *(double *)(a1 + 40))
    v5 = *(double *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a2, 0, v7);
  return ThumbnailAtIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likenessFingerprint, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_originalPhotoData, 0);
}

+ (CGImage)cgImageFromData:(id)a3
{
  return (CGImage *)_cgProcessSafeImageSourceFromData(a3, &__block_literal_global_75);
}

CGImageRef __47__CNUIPRLikenessPhotoProvider_cgImageFromData___block_invoke(int a1, CGImageSourceRef isrc)
{
  return CGImageSourceCreateImageAtIndex(isrc, 0, 0);
}

- (id)_cnui_likenessForSize:(CGSize)a3 scale:(double)a4
{
  CGImage *v4;

  v4 = -[CNUIPRLikenessPhotoProvider _cnui_circularImageForSize:scale:](self, "_cnui_circularImageForSize:scale:", a3.width, a3.height, a4);
  return (id)objc_msgSend(MEMORY[0x1E0D70A68], "photoWithImage:", v4);
}

- (unint64_t)_cnui_likenessType
{
  return 2;
}

- (CGImage)_cnui_image
{
  void *v3;
  void *v4;
  CGImage *v5;

  v3 = (void *)objc_opt_class();
  -[CNUIPRLikenessPhotoProvider originalPhotoData](self, "originalPhotoData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (CGImage *)objc_msgSend(v3, "cgImageFromData:", v4);

  return v5;
}

- (CGImage)_cnui_circularImageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  void *v9;
  void *v10;
  CNCache *cache;
  const void *v12;
  CGImage *v13;
  _QWORD v15[8];

  height = a3.height;
  width = a3.width;
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSize(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-Circular"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    cache = self->_cache;
  else
    cache = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__CNUIPRLikenessPhotoProvider__cnui_circularImageForSize_scale___block_invoke;
  v15[3] = &unk_1EA603938;
  v15[4] = self;
  *(CGFloat *)&v15[5] = width;
  *(CGFloat *)&v15[6] = height;
  *(double *)&v15[7] = a4;
  -[CNCache objectForKey:onCacheMiss:](cache, "objectForKey:onCacheMiss:", v10, v15);
  v12 = (const void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = (CGImage *)CFAutorelease(v12);
  else
    v13 = 0;

  return v13;
}

CFTypeRef __64__CNUIPRLikenessPhotoProvider__cnui_circularImageForSize_scale___block_invoke(uint64_t a1)
{
  return -[CNUIPRLikenessPhotoProvider renderCircularImageForSize:scale:](*(void **)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (CFTypeRef)renderCircularImageForSize:(double)a3 scale:(double)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  CGImageRef v10;
  CFTypeRef v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  if (!a1)
    return 0;
  objc_msgSend(a1, "originalPhotoData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__CNUIPRLikenessPhotoProvider_renderCircularImageForSize_scale___block_invoke;
  v13[3] = &unk_1EA605658;
  v9 = v7;
  v14 = v9;
  v15 = v8;
  v10 = CNUICircularImageCreate(v13, a2, a3, a4);
  if (v10)
    v11 = CFAutorelease(v10);
  else
    v11 = 0;

  return v11;
}

- (CGImage)_cnui_roundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  void *v9;
  void *v10;
  CNCache *cache;
  const void *v12;
  CGImage *v13;
  _QWORD v15[8];

  height = a3.height;
  width = a3.width;
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSize(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-RoundedRect"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    cache = self->_cache;
  else
    cache = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__CNUIPRLikenessPhotoProvider__cnui_roundedRectImageForSize_scale___block_invoke;
  v15[3] = &unk_1EA603938;
  v15[4] = self;
  *(CGFloat *)&v15[5] = width;
  *(CGFloat *)&v15[6] = height;
  *(double *)&v15[7] = a4;
  -[CNCache objectForKey:onCacheMiss:](cache, "objectForKey:onCacheMiss:", v10, v15);
  v12 = (const void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = (CGImage *)CFAutorelease(v12);
  else
    v13 = 0;

  return v13;
}

CFTypeRef __67__CNUIPRLikenessPhotoProvider__cnui_roundedRectImageForSize_scale___block_invoke(uint64_t a1)
{
  return -[CNUIPRLikenessPhotoProvider renderRoundedRectImageForSize:scale:](*(void **)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (CFTypeRef)renderRoundedRectImageForSize:(double)a3 scale:(double)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  CGImageRef v10;
  CFTypeRef v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  if (!a1)
    return 0;
  objc_msgSend(a1, "originalPhotoData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__CNUIPRLikenessPhotoProvider_renderRoundedRectImageForSize_scale___block_invoke;
  v13[3] = &unk_1EA605658;
  v9 = v7;
  v14 = v9;
  v15 = v8;
  v10 = CNUIRoundedRectImageCreate(v13, a2, a3, a4);
  if (v10)
    v11 = CFAutorelease(v10);
  else
    v11 = 0;

  return v11;
}

void __64__CNUIPRLikenessPhotoProvider_renderCircularImageForSize_scale___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  const void *v11;
  CGImage *v12;
  CGImage *v13;
  CGRect v14;

  if (*(_QWORD *)(a1 + 32))
  {
    v11 = (const void *)objc_msgSend(*(id *)(a1 + 40), "cgImageFromData:");
    if (v11)
    {
      v12 = (CGImage *)CFRetain(v11);
      if (v12)
      {
        v13 = v12;
        v14.origin.x = a3;
        v14.origin.y = a4;
        v14.size.width = a5;
        v14.size.height = a6;
        CGContextDrawImage(a2, v14, v12);
        CFRelease(v13);
      }
    }
  }
}

void __67__CNUIPRLikenessPhotoProvider_renderRoundedRectImageForSize_scale___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  const void *v11;
  CGImage *v12;
  CGImage *v13;
  CGRect v14;

  if (*(_QWORD *)(a1 + 32))
  {
    v11 = (const void *)objc_msgSend(*(id *)(a1 + 40), "cgImageFromData:");
    if (v11)
    {
      v12 = (CGImage *)CFRetain(v11);
      if (v12)
      {
        v13 = v12;
        v14.origin.x = a3;
        v14.origin.y = a4;
        v14.size.width = a5;
        v14.size.height = a6;
        CGContextDrawImage(a2, v14, v12);
        CFRelease(v13);
      }
    }
  }
}

- (NSString)likenessFingerprint
{
  return self->_likenessFingerprint;
}

@end
