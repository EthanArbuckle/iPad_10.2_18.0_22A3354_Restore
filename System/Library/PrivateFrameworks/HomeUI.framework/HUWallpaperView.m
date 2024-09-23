@implementation HUWallpaperView

- (HUWallpaperView)initWithFrame:(CGRect)a3
{
  HUWallpaperView *v3;
  HUWallpaperView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUWallpaperView;
  v3 = -[HUWallpaperView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUWallpaperView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v4;
}

- (void)populateWallpaper:(id)a3 withAnimation:(BOOL)a4 onlyIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  HUWallpaperView *v18;
  uint64_t v19;

  v5 = a5;
  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (-[HUWallpaperView disableWallpaperUpdate](self, "disableWallpaperUpdate"))
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "wallpaper update is currently disabled because an animation is in progress, wallpaper:%@ for view:%@", (uint8_t *)&v15, 0x16u);
    }

  }
  else
  {
    if (v5)
    {
      -[HUWallpaperView currentLayer](self, "currentLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

        goto LABEL_14;
      }
      -[HUWallpaperView currentImage](self, "currentImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperView traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wallpaperObjectForWallpaper:currentUserInterfaceStyle:", v8, objc_msgSend(v13, "userInterfaceStyle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUWallpaperView setContentMode:](self, "setContentMode:", 2 * (objc_msgSend(v8, "type") != 2));
      -[HUWallpaperView setCurrentImage:withAnimation:](self, "setCurrentImage:withAnimation:", v14, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[HUWallpaperView setCurrentLayer:withAnimation:](self, "setCurrentLayer:withAnimation:", v14, v6);
    }

  }
LABEL_14:

}

- (void)setCurrentImage:(id)a3 withAnimation:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  void *v8;
  double v9;
  _QWORD v10[4];
  UIImage *v11;
  id v12;
  id location;

  v4 = a4;
  v7 = (UIImage *)a3;
  if (self->_currentImage != v7)
  {
    objc_storeStrong((id *)&self->_currentImage, a3);
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0CEABB0];
    if (v4)
      v9 = 2.0;
    else
      v9 = 0.0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__HUWallpaperView_setCurrentImage_withAnimation___block_invoke;
    v10[3] = &unk_1E6F50A68;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", self, 5242880, v10, 0, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (id)refreshWallpaperForHomeKitObject:(id)a3 withAnimation:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  HUWallpaperView *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[HUWallpaperView disableWallpaperUpdate](self, "disableWallpaperUpdate"))
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "wallpaper update is currently disabled because an animation is in progress, hkObject:%@ for view:%@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUWallpaperView setHkObject:](self, "setHkObject:", v6);
    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wallpaperForHomeKitObject:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__HUWallpaperView_refreshWallpaperForHomeKitObject_withAnimation___block_invoke;
    v12[3] = &unk_1E6F52098;
    objc_copyWeak(&v13, (id *)buf);
    v14 = a4;
    objc_msgSend(v10, "flatMap:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v13);

    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (BOOL)disableWallpaperUpdate
{
  return self->_disableWallpaperUpdate;
}

- (void)setHkObject:(id)a3
{
  objc_storeStrong((id *)&self->_hkObject, a3);
}

id __66__HUWallpaperView_refreshWallpaperForHomeKitObject_withAnimation___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setWallpaper:", v4);
  objc_msgSend(WeakRetained, "populateWallpaper:withAnimation:onlyIfNeeded:", v4, *(unsigned __int8 *)(a1 + 40), 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaper, a3);
}

void __49__HUWallpaperView_setCurrentImage_withAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperlayer");

  objc_msgSend(WeakRetained, "setImage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCurrentLayer:", 0);

}

- (void)setCurrentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayer, a3);
}

- (CAGradientLayer)currentLayer
{
  return self->_currentLayer;
}

- (void)setCurrentLayer:(id)a3 withAnimation:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  char v10;
  CAGradientLayer *v11;
  void *v12;
  double v13;
  CAGradientLayer *v14;
  _QWORD v15[4];
  id v16;
  CAGradientLayer *v17;
  id v18;
  id location;

  v4 = a4;
  v7 = a3;
  -[CAGradientLayer colors](self->_currentLayer, "colors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    v11 = self->_currentLayer;
    -[HUWallpaperView frame](self, "frame");
    objc_msgSend(v7, "setFrame:");
    objc_storeStrong((id *)&self->_currentLayer, a3);
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x1E0CEABB0];
    if (v4)
      v13 = 2.0;
    else
      v13 = 0.0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__HUWallpaperView_setCurrentLayer_withAnimation___block_invoke;
    v15[3] = &unk_1E6F4C7A8;
    objc_copyWeak(&v18, &location);
    v16 = v7;
    v14 = v11;
    v17 = v14;
    objc_msgSend(v12, "transitionWithView:duration:options:animations:completion:", self, 5242880, v15, 0, v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

void __49__HUWallpaperView_setCurrentLayer_withAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setImage:", 0);
  objc_msgSend(WeakRetained, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSublayer:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperlayer");
  objc_msgSend(WeakRetained, "setCurrentImage:", 0);

}

- (HFWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setDisableWallpaperUpdate:(BOOL)a3
{
  self->_disableWallpaperUpdate = a3;
}

- (HFHomeKitObject)hkObject
{
  return self->_hkObject;
}

- (UIImage)currentImage
{
  return self->_currentImage;
}

- (void)setCurrentImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayer, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_hkObject, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
}

@end
