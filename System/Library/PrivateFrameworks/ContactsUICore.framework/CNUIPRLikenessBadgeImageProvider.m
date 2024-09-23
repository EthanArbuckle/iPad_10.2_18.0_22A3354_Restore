@implementation CNUIPRLikenessBadgeImageProvider

- (CNUIPRLikenessBadgeImageProvider)initWithBadge:(id)a3
{
  id v4;
  CNUIPRLikenessBadgeImageProvider *v5;
  uint64_t v6;
  CNCache *cache;
  uint64_t v8;
  NSData *badgeImageData;
  uint64_t v10;
  UIImage *badgeImage;
  CNUIPRLikenessBadgeImageProvider *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUIPRLikenessBadgeImageProvider;
  v5 = -[CNUIPRLikenessBadgeImageProvider init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D139B0], "atomicCache");
    v6 = objc_claimAutoreleasedReturnValue();
    cache = v5->_cache;
    v5->_cache = (CNCache *)v6;

    objc_msgSend(v4, "imageData");
    v8 = objc_claimAutoreleasedReturnValue();
    badgeImageData = v5->_badgeImageData;
    v5->_badgeImageData = (NSData *)v8;

    v5->_badgeType = objc_msgSend(v4, "badgeType");
    objc_msgSend(v4, "image");
    v10 = objc_claimAutoreleasedReturnValue();
    badgeImage = v5->_badgeImage;
    v5->_badgeImage = (UIImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (CGImage)badgeCGImage
{
  void *v3;
  void *v4;
  CGImage *v5;
  CGImage *v6;

  -[CNUIPRLikenessBadgeImageProvider badgeImage](self, "badgeImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNUIPRLikenessBadgeImageProvider badgeImage](self, "badgeImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (CGImage *)imageRefFromImage(v4);
  }
  else
  {
    -[CNUIPRLikenessBadgeImageProvider badgeImageData](self, "badgeImageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[CNUIPRLikenessPhotoProvider cgImageFromData:](CNUIPRLikenessPhotoProvider, "cgImageFromData:", v4);
  }
  v6 = v5;

  return v6;
}

- (CGImage)_cnui_imageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  _QWORD v14[8];

  height = a3.height;
  width = a3.width;
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSize(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-Thumbnail"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIPRLikenessBadgeImageProvider cache](self, "cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__CNUIPRLikenessBadgeImageProvider__cnui_imageForSize_scale___block_invoke;
  v14[3] = &unk_1EA603938;
  v14[4] = self;
  *(CGFloat *)&v14[5] = width;
  *(CGFloat *)&v14[6] = height;
  *(double *)&v14[7] = a4;
  objc_msgSend(v11, "objectForKey:onCacheMiss:", v10, v14);
  v12 = (const void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v12 = CFAutorelease(v12);

  return (CGImage *)v12;
}

id __61__CNUIPRLikenessBadgeImageProvider__cnui_imageForSize_scale___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "badgeType");
  if (v2 >= 2)
  {
    if (v2 == 2)
      v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "renderRoundedRectImageForSize:scale:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
    else
      v3 = 0;
  }
  else
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "renderCircularImageForSize:scale:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  return v3;
}

- (CGImage)renderRoundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  CGImage *result;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__CNUIPRLikenessBadgeImageProvider_renderRoundedRectImageForSize_scale___block_invoke;
  v5[3] = &unk_1EA603960;
  v5[4] = self;
  result = CNUIRoundedRectImageCreate(v5, a3.width, a3.height, a4);
  if (result)
    return (CGImage *)CFAutorelease(result);
  return result;
}

void __72__CNUIPRLikenessBadgeImageProvider_renderRoundedRectImageForSize_scale___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  const void *v11;
  CGImage *v12;
  CGRect v13;
  CGRect v14;

  v11 = (const void *)objc_msgSend(*(id *)(a1 + 32), "badgeCGImage");
  if (v11)
  {
    v12 = (CGImage *)CFRetain(v11);
    v13.origin.x = a3;
    v13.origin.y = a4;
    v13.size.width = a5;
    v13.size.height = a6;
    CGContextDrawImage(a2, v13, v12);
    if (v12)
      CFRelease(v12);
  }
  else
  {
    v14.origin.x = a3;
    v14.origin.y = a4;
    v14.size.width = a5;
    v14.size.height = a6;
    CGContextDrawImage(a2, v14, 0);
  }
}

- (CGImage)renderCircularImageForSize:(CGSize)a3 scale:(double)a4
{
  CGImage *result;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__CNUIPRLikenessBadgeImageProvider_renderCircularImageForSize_scale___block_invoke;
  v5[3] = &unk_1EA603988;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  result = CNUICircularImageCreate(v5, a3.width, a3.height, a4);
  if (result)
    return (CGImage *)CFAutorelease(result);
  return result;
}

void __69__CNUIPRLikenessBadgeImageProvider_renderCircularImageForSize_scale___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGColor *SRGB;
  const void *v13;
  CGImage *v14;
  CGFloat MidX;
  CGFloat MidY;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGContextSetFillColorWithColor(a2, SRGB);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGContextFillRect(a2, v17);
  v13 = (const void *)objc_msgSend(*(id *)(a1 + 32), "badgeCGImage");
  if (v13)
    v14 = (CGImage *)CFRetain(v13);
  else
    v14 = 0;
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.width = a5;
  v18.size.height = a6;
  CGContextDrawImage(a2, v18, v14);
  CGContextSetLineWidth(a2, ceil(a5 * 0.04 * *(double *)(a1 + 40)));
  CGContextSetStrokeColorWithColor(a2, SRGB);
  v19.origin.x = a3;
  v19.origin.y = a4;
  v19.size.width = a5;
  v19.size.height = a6;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = a3;
  v20.origin.y = a4;
  v20.size.width = a5;
  v20.size.height = a6;
  MidY = CGRectGetMidY(v20);
  CGContextAddArc(a2, MidX, MidY, a5 * 0.5, 0.0, 6.28318531, 1);
  CGContextStrokePath(a2);
  if (v14)
    CFRelease(v14);
  if (SRGB)
    CFRelease(SRGB);
}

- (unint64_t)_cnui_likenessType
{
  return 2;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_badgeType = a3;
}

- (CNCache)cache
{
  return self->_cache;
}

- (NSData)badgeImageData
{
  return self->_badgeImageData;
}

- (void)setBadgeImageData:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageData, a3);
}

- (UIImage)badgeImage
{
  return self->_badgeImage;
}

- (void)setBadgeImage:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImage, 0);
  objc_storeStrong((id *)&self->_badgeImageData, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
