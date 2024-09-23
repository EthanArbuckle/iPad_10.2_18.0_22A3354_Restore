@implementation NTKGreenfieldPlaceholderImageProvider

+ (id)provider
{
  return +[CLKImageProvider imageProviderWithImageViewCreationHandler:](NTKGreenfieldPlaceholderImageProvider, "imageProviderWithImageViewCreationHandler:", &__block_literal_global_131);
}

NTKGreenfieldPlaceholderView *__49__NTKGreenfieldPlaceholderImageProvider_provider__block_invoke(double a1, double a2)
{
  return -[NTKGreenfieldPlaceholderView initWithFrame:]([NTKGreenfieldPlaceholderView alloc], "initWithFrame:", 0.0, 0.0, a1, a2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  UIImage *appIcon;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "progress");
    if (CLKFloatEqualsFloat())
    {
      appIcon = self->_appIcon;
      objc_msgSend(v5, "appIcon");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = NTKEqualObjects(appIcon, v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKGreenfieldPlaceholderImageProvider;
  v4 = -[CLKImageProvider copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setProgress:", self->_progress);
    objc_msgSend(v5, "setAppIcon:", self->_appIcon);
  }
  return v5;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (void)setAppIcon:(id)a3
{
  objc_storeStrong((id *)&self->_appIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIcon, 0);
}

@end
