@implementation CKMomentSharePlaceholderAsset

+ (CKMomentSharePlaceholderAsset)sharedInstance
{
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_178_1);
  return (CKMomentSharePlaceholderAsset *)(id)sharedInstance__sharedInstance;
}

void __47__CKMomentSharePlaceholderAsset_sharedInstance__block_invoke()
{
  CKMomentSharePlaceholderAsset *v0;
  void *v1;

  v0 = objc_alloc_init(CKMomentSharePlaceholderAsset);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (CKMomentSharePlaceholderAsset)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMomentSharePlaceholderAsset;
  return -[CKMomentSharePlaceholderAsset init](&v3, sel_init);
}

- (Class)defaultImageProviderClass
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Implemented by subclasses"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (int64_t)isContentEqualTo:(id)a3
{
  id v3;
  char isKindOfClass;

  if (!a3)
    return 1;
  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 2;
  else
    return 1;
}

+ (id)placeholderImage
{
  if (placeholderImage_predicate != -1)
    dispatch_once(&placeholderImage_predicate, &__block_literal_global_182_0);
  return (id)placeholderImage__placeholderImage;
}

void __49__CKMomentSharePlaceholderAsset_placeholderImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "px_imageFromSolidColor:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)placeholderImage__placeholderImage;
  placeholderImage__placeholderImage = v0;

}

- (UIImage)placeholderImage
{
  return (UIImage *)objc_msgSend((id)objc_opt_class(), "placeholderImage");
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CKMomentSharePlaceholderAsset size](self, "size");
  PXRectWithAspectRatioFittingRect();
  PXRectNormalize();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CKMomentSharePlaceholderAsset placeholderImage](self, "placeholderImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)aspectRatio
{
  double v2;
  double v3;
  double result;

  -[CKMomentSharePlaceholderAsset size](self, "size");
  result = v2 / v3;
  if (v3 <= 0.0)
    return 1.0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImage, 0);
}

@end
