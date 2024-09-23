@implementation CNUIPRLikenessPlaceholderProvider

- (CGImage)_cnui_circularImageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  BOOL v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const void *v16;
  _QWORD v18[4];
  id v19;
  CNUIPRLikenessPlaceholderProvider *v20;
  double v21;
  double v22;
  double v23;

  height = a3.height;
  width = a3.width;
  v8 = -[CNUIPRLikenessPlaceholderProvider isForCompany](self, "isForCompany");
  v9 = (void *)objc_opt_class();
  if (width >= height)
    v10 = height;
  else
    v10 = width;
  if (v8)
    objc_msgSend(v9, "companyImageNameForDiameter:", v10);
  else
    objc_msgSend(v9, "imageNameForDiameter:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("_%@-Circular"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIPRLikenessPlaceholderProvider cache](self, "cache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__CNUIPRLikenessPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke;
  v18[3] = &unk_1EA604D90;
  v15 = v11;
  v19 = v15;
  v20 = self;
  v21 = a4;
  v22 = width;
  v23 = height;
  objc_msgSend(v14, "objectForKey:onCacheMiss:", v13, v18);
  v16 = (const void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v16 = CFAutorelease(v16);

  return (CGImage *)v16;
}

- (BOOL)isForCompany
{
  return self->_isForCompany;
}

- (CNCache)cache
{
  return self->_cache;
}

+ (id)imageNameForDiameter:(double)a3
{
  if (a3 <= 32.0)
    return CFSTR("silhouette-S");
  if (a3 <= 45.0)
    return CFSTR("silhouette-M");
  if (a3 <= 96.0)
    return CFSTR("silhouette-L");
  if (a3 <= 120.0)
    return CFSTR("silhouette-ATV-M");
  if (a3 <= 148.0)
    return CFSTR("silhouette-ATV-L");
  if (a3 <= 180.0)
    return CFSTR("silhouette-ATV-XL");
  if (a3 <= 250.0)
    return CFSTR("silhouette-ATV-XXL");
  return CFSTR("silhouette-EDU-XL");
}

id __70__CNUIPRLikenessPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  id v6;

  +[CNUIImageProvider uncachedImageForResource:template:](CNUIImageProvider, "uncachedImageForResource:template:", *(_QWORD *)(a1 + 32), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "CGImage");
  v4 = *(double *)(a1 + 48);
  if (v4 <= 0.0)
  {
    objc_msgSend(v2, "scale");
    v4 = v5;
  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "renderCircularImageForSilhouetteImage:size:scale:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64), v4);

  return v6;
}

- (CGImage)renderCircularImageForSilhouetteImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5
{
  CGImage *result;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__CNUIPRLikenessPlaceholderProvider_renderCircularImageForSilhouetteImage_size_scale___block_invoke;
  v6[3] = &unk_1EA603988;
  v6[4] = self;
  v6[5] = a3;
  result = CNUICircularImageCreate(v6, a4.width, a4.height, a5);
  if (result)
    return (CGImage *)CFAutorelease(result);
  return result;
}

void __86__CNUIPRLikenessPlaceholderProvider_renderCircularImageForSilhouetteImage_size_scale___block_invoke(uint64_t a1, CGContext *a2, CGColorSpace *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;

  CNUIDrawLikenessPlatterInContext(a2, a3, a4, a5, a6, a7);
  if (objc_msgSend(*(id *)(a1 + 32), "isForCompany"))
  {
    v13 = ceil(a7 * 0.06);
    v14 = a4;
    v15 = a5;
    v16 = a6;
    v17 = a7;
    v18 = v13;
  }
  else
  {
    v13 = 0.0;
    v18 = 0.0;
    v14 = a4;
    v15 = a5;
    v16 = a6;
    v17 = a7;
  }
  v19 = CGRectInset(*(CGRect *)&v14, v13, v18);
  DrawSilhouetteInContext(a2, *(CGImage **)(a1 + 40), 1, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
}

- (CNUIPRLikenessPlaceholderProvider)init
{
  CNUIPRLikenessPlaceholderProvider *v2;
  uint64_t v3;
  CNCache *cache;
  CNUIPRLikenessPlaceholderProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNUIPRLikenessPlaceholderProvider;
  v2 = -[CNUIPRLikenessPlaceholderProvider init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D139B0], "atomicCache");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (CNCache *)v3;

    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

+ (id)companyImageNameForDiameter:(double)a3
{
  if (a3 <= 14.0 || a3 <= 20.0 || a3 <= 32.0)
    return CFSTR("company-silhouette-S");
  if (a3 > 45.0)
    return CFSTR("company-silhouette-L");
  return CFSTR("company-silhouette-M");
}

- (CNUIPRLikenessPlaceholderProvider)initWithContact:(id)a3
{
  id v4;
  CNUIPRLikenessPlaceholderProvider *v5;
  BOOL v6;
  CNUIPRLikenessPlaceholderProvider *v7;

  v4 = a3;
  v5 = -[CNUIPRLikenessPlaceholderProvider init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C96898]))
      v6 = objc_msgSend(v4, "contactType") == 1;
    else
      v6 = 0;
    v5->_isForCompany = v6;
    v7 = v5;
  }

  return v5;
}

- (CGImage)renderRoundedRectImageForSilhouetteImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5
{
  CGImage *result;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__CNUIPRLikenessPlaceholderProvider_renderRoundedRectImageForSilhouetteImage_size_scale___block_invoke;
  v6[3] = &__block_descriptor_40_e72_v56__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16__CGColorSpace__48l;
  v6[4] = a3;
  result = CNUIRoundedRectImageCreate(v6, a4.width, a4.height, a5);
  if (result)
    return (CGImage *)CFAutorelease(result);
  return result;
}

void __89__CNUIPRLikenessPlaceholderProvider_renderRoundedRectImageForSilhouetteImage_size_scale___block_invoke(uint64_t a1, CGContext *a2, CGColorSpace *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGFloat v13;
  CGRect v14;
  CGRect v15;

  CNUIDrawLikenessPlatterInContext(a2, a3, a4, a5, a6, a7);
  v14.origin.x = a4;
  v14.origin.y = a5;
  v14.size.width = a6;
  v14.size.height = a7;
  v13 = ceil(a7 * 0.04);
  v15 = CGRectInset(v14, v13, v13);
  DrawSilhouetteInContext(a2, *(CGImage **)(a1 + 32), 0, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
}

- (CGImage)_cnui_roundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const void *v15;
  _QWORD v17[4];
  id v18;
  CNUIPRLikenessPlaceholderProvider *v19;
  double v20;
  double v21;
  double v22;

  height = a3.height;
  width = a3.width;
  v8 = (void *)objc_opt_class();
  if (width >= height)
    v9 = height;
  else
    v9 = width;
  objc_msgSend(v8, "companyImageNameForDiameter:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("_%@-RoundedRect"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIPRLikenessPlaceholderProvider cache](self, "cache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__CNUIPRLikenessPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke;
  v17[3] = &unk_1EA604D90;
  v14 = v10;
  v18 = v14;
  v19 = self;
  v20 = a4;
  v21 = width;
  v22 = height;
  objc_msgSend(v13, "objectForKey:onCacheMiss:", v12, v17);
  v15 = (const void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v15 = CFAutorelease(v15);

  return (CGImage *)v15;
}

id __73__CNUIPRLikenessPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  id v6;

  +[CNUIImageProvider uncachedImageForResource:template:](CNUIImageProvider, "uncachedImageForResource:template:", *(_QWORD *)(a1 + 32), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "CGImage");
  v4 = *(double *)(a1 + 48);
  if (v4 <= 0.0)
  {
    objc_msgSend(v2, "scale");
    v4 = v5;
  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "renderRoundedRectImageForSilhouetteImage:size:scale:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64), v4);

  return v6;
}

- (id)_cnui_likenessForSize:(CGSize)a3 scale:(double)a4
{
  CGImage *v4;

  v4 = -[CNUIPRLikenessPlaceholderProvider _cnui_circularImageForSize:scale:](self, "_cnui_circularImageForSize:scale:", a3.width, a3.height, a4);
  return (id)objc_msgSend(MEMORY[0x1E0D70A68], "photoWithScope:image:", 2, v4);
}

- (unint64_t)_cnui_likenessType
{
  return 2;
}

- (void)setIsForCompany:(BOOL)a3
{
  self->_isForCompany = a3;
}

@end
