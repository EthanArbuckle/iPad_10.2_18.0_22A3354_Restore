@implementation CAMFormattingManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_40);
  return (id)sharedManager_formattingMangaer;
}

void __37__CAMFormattingManager_sharedManager__block_invoke()
{
  CAMFormattingManager *v0;
  void *v1;

  v0 = objc_alloc_init(CAMFormattingManager);
  v1 = (void *)sharedManager_formattingMangaer;
  sharedManager_formattingMangaer = (uint64_t)v0;

}

- (CAMFormattingManager)init
{
  CAMFormattingManager *v2;
  CAMFormattingManager *v3;
  CAMFormattingManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMFormattingManager;
  v2 = -[CAMFormattingManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CAMFormattingManager _commonCAMFormattingManagerInitialization](v2, "_commonCAMFormattingManagerInitialization");
    v4 = v3;
  }

  return v3;
}

- (void)_commonCAMFormattingManagerInitialization
{
  void *v3;
  id v4;

  CAMLocalizedFrameworkString(CFSTR("CAMERA_APPLY_CUSTOM_KERNING"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wantsCustomKerning = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("YES")) == 0;

  CAMLocalizedFrameworkString(CFSTR("CAMERA_SUPPORTS_VERTICAL_TEXT"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_supportsVerticalText = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("YES")) == 0;

}

- (BOOL)wantsCustomKerning
{
  return self->_wantsCustomKerning;
}

- (BOOL)supportsVerticalText
{
  return self->_supportsVerticalText;
}

@end
