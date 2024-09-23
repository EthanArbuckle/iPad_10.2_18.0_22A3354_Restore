@implementation PHImageDisplaySpec

- (CGSize)requestSizeFromFullSizedWidth:(int64_t)a3 height:(int64_t)a4 resizeMode:(int64_t)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  double width;
  double height;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;
  CGRect v28;

  if (a3 && a4 && self->_targetSize.width > 0.0 && self->_targetSize.height > 0.0)
  {
    -[PHImageDisplaySpec targetSize](self, "targetSize");
    v10 = v9;
    v12 = v11;
    v13 = -[PHImageDisplaySpec contentMode](self, "contentMode");
    -[PHImageDisplaySpec normalizedCropRect](self, "normalizedCropRect");
    width = v28.size.width;
    height = v28.size.height;
    v16 = CGRectEqualToRect(v28, *MEMORY[0x1E0C9D648]);
    v17 = (double)a4;
    v18 = (double)a3;
    if (v16)
    {
      v19 = v10 / v12;
      v20 = v18 / v17;
      if (v13 == 1 && a5 == 2)
        v20 = v10 / v12;
      if (v13 == 1)
      {
        if (v20 > v19)
        {
LABEL_14:
          v10 = v12 * v20;
LABEL_24:
          v22 = round(v10);
          v23 = round(v12);
          goto LABEL_29;
        }
      }
      else
      {
        if (v13)
        {
          v10 = *MEMORY[0x1E0C9D820];
          v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          goto LABEL_24;
        }
        if (v20 <= v19)
          goto LABEL_14;
      }
      v12 = v10 / v20;
      goto LABEL_24;
    }
    v24 = v10 / (width * v18);
    v25 = v12 / (height * v17);
    if (v13 == 1)
    {
      if (v24 >= v25)
        v26 = v10 / (width * v18);
      else
        v26 = v12 / (height * v17);
    }
    else
    {
      v26 = 0.0;
      if (!v13)
      {
        if (v24 >= v25)
          v26 = v12 / (height * v17);
        else
          v26 = v10 / (width * v18);
      }
    }
    v22 = v26 * v18;
    v23 = v26 * v17;
  }
  else
  {
    v22 = *MEMORY[0x1E0C9D820];
    v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
LABEL_29:
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGRect)normalizedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedCropRect.origin.x;
  y = self->_normalizedCropRect.origin.y;
  width = self->_normalizedCropRect.size.width;
  height = self->_normalizedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)fallbackTargetSizeIfRequestedSizeNotLocallyAvailable
{
  double width;
  double height;
  CGSize result;

  width = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.width;
  height = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:(CGSize)a3
{
  self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable = a3;
}

- (PHImageDisplaySpec)initWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 normalizedCropRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  PHImageDisplaySpec *v12;
  PHImageDisplaySpec *v13;
  double v14;
  double v15;
  NSObject *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;
  NSSize v25;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PHImageDisplaySpec;
  v12 = -[PHImageDisplaySpec init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PHImageDisplaySpec setNormalizedCropRect:](v12, "setNormalizedCropRect:", x, y, width, height);
    v13->_contentMode = a4;
    if (v11 <= 0.0 || v10 <= 0.0)
    {
      v14 = *MEMORY[0x1E0C9D820];
      v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if ((v11 != *MEMORY[0x1E0C9D820] || v10 != v15) && (v11 != -1.0 || v10 != -1.0))
      {
        PLImageManagerGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v25.width = v11;
          v25.height = v10;
          NSStringFromSize(v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v19;
          _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "Invalid target size specified for image request (%{public}@, defaulting to max size", buf, 0xCu);

        }
      }
    }
    else
    {
      v14 = v11;
      v15 = v10;
    }
    v13->_targetSize.width = v14;
    v13->_targetSize.height = v15;
  }
  return v13;
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  NSObject *v11;
  void *v12;
  char v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;
  NSRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  self->_normalizedCropRect.origin.x = PHSanitizeNormalizedCropRect(&v13, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_normalizedCropRect.origin.y = v8;
  self->_normalizedCropRect.size.width = v9;
  self->_normalizedCropRect.size.height = v10;
  if (v13)
  {
    PLImageManagerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      NSStringFromRect(v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "Invalid crop rect specified for image request (%{public}@, will attempt to fix if possible, otherwise will ignore crop rect", buf, 0xCu);

    }
  }
}

- (BOOL)hasExplicitCrop
{
  return !CGRectEqualToRect(self->_normalizedCropRect, *MEMORY[0x1E0C9D648]);
}

- (PHImageDisplaySpec)init
{
  return -[PHImageDisplaySpec initWithTargetSize:](self, "initWithTargetSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (PHImageDisplaySpec)initWithTargetSize:(CGSize)a3
{
  return -[PHImageDisplaySpec initWithTargetSize:contentMode:](self, "initWithTargetSize:contentMode:", 0, a3.width, a3.height);
}

- (PHImageDisplaySpec)initWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4
{
  return -[PHImageDisplaySpec initWithTargetSize:contentMode:normalizedCropRect:](self, "initWithTargetSize:contentMode:normalizedCropRect:", a4, a3.width, a3.height, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t contentMode;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  DCIM_NSStringFromCGSize();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  contentMode = self->_contentMode;
  v7 = CFSTR("fit");
  if (contentMode)
    v7 = 0;
  if (contentMode == 1)
    v8 = CFSTR("fill");
  else
    v8 = v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("size: %@, cm: %@"), v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], self->_normalizedCropRect))
  {
    DCIM_NSStringFromCGRect();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(", crop: %@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImageDisplaySpec shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)requestSizeFromFullSizedWidth:(int64_t)a3 height:(int64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  -[PHImageDisplaySpec requestSizeFromFullSizedWidth:height:resizeMode:](self, "requestSizeFromFullSizedWidth:height:resizeMode:", a3, a4, 1);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

@end
