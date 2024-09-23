@implementation HFWallpaperEditCollectionBuilder

- (HFWallpaperEditCollectionBuilder)initWithHomeKitObject:(id)a3 namedWallpaperCollectionType:(int64_t)a4
{
  id v7;
  HFWallpaperEditCollectionBuilder *v8;
  HFWallpaperEditCollectionBuilder *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFWallpaperEditCollectionBuilder;
  v8 = -[HFWallpaperEditCollectionBuilder init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_hkObject, a3);
    v9->_namedWallpaperCollectionType = a4;
  }

  return v9;
}

- (HFWallpaperEditCollectionBuilder)initWithHomeKitObject:(id)a3
{
  id v5;
  HFWallpaperEditCollectionBuilder *v6;
  HFWallpaperEditCollectionBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFWallpaperEditCollectionBuilder;
  v6 = -[HFWallpaperEditCollectionBuilder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_hkObject, a3);

  return v7;
}

- (id)description
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[HFWallpaperEditCollectionBuilder namedWallpaperCollectionType](self, "namedWallpaperCollectionType");
  v4 = CFSTR("room");
  if (!v3)
    v4 = CFSTR("home");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = v4;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFWallpaperEditCollectionBuilder updatedEditCollection](self, "updatedEditCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, type = %@, editCollection = %@>"), v8, self, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setHkObject:(id)a3
{
  HFHomeKitObject **p_hkObject;
  char v6;
  void *v7;
  HFHomeKitObject *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_hkObject = &self->_hkObject;
  v6 = -[HFHomeKitObject isEqual:](self->_hkObject, "isEqual:", v10);
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    v8 = *p_hkObject;
    if (*p_hkObject)
    {
      -[HFWallpaperEditCollectionBuilder initialEditCollectionFuture](self, "initialEditCollectionFuture");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancel");

      -[HFWallpaperEditCollectionBuilder setInitialEditCollectionFuture:](self, "setInitialEditCollectionFuture:", 0);
    }
    -[HFWallpaperEditCollectionBuilder setHkObjectNewlyCreated:](self, "setHkObjectNewlyCreated:", v8 == 0);
    objc_storeStrong((id *)&self->_hkObject, a3);
    v7 = v10;
  }

}

- (id)wallpaperEditCollectionFuture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFWallpaperEditCollectionBuilder updatedEditCollection](self, "updatedEditCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D519C0];
    -[HFWallpaperEditCollectionBuilder updatedEditCollection](self, "updatedEditCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFWallpaperEditCollectionBuilder initialEditCollectionFuture](self, "initialEditCollectionFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setWallpaper:(id)a3 image:(id)a4
{
  id v5;

  -[HFWallpaperEditCollectionBuilder editCollectionForWallpaper:image:](self, "editCollectionForWallpaper:image:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HFWallpaperEditCollectionBuilder setUpdatedEditCollection:](self, "setUpdatedEditCollection:", v5);

}

- (id)commitWallpaper
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HFWallpaperEditCollectionBuilder initialEditCollectionFuture](self, "initialEditCollectionFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HFWallpaperEditCollectionBuilder_commitWallpaper__block_invoke;
  v6[3] = &unk_1EA734510;
  v6[4] = self;
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __51__HFWallpaperEditCollectionBuilder_commitWallpaper__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hkObjectNewlyCreated") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "updatedEditCollection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "wallpaper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "updatedEditCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wallpaper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "updatedEditCollection");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = v3;
      v13 = v12;

      +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "wallpaper");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "originalImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "hkObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWallpaper:image:forHomeKitObject:", v15, v16, v17);

      objc_msgSend(*(id *)(a1 + 32), "setInitialEditCollectionFuture:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setHkObjectNewlyCreated:", 0);
    }
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NAFuture)initialEditCollectionFuture
{
  void *v3;
  void *v4;
  NAFuture *v5;
  NAFuture *initialEditCollectionFuture;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NAFuture *v13;
  NAFuture *v14;
  _QWORD v16[4];
  id v17;
  id location;

  if (!self->_initialEditCollectionFuture)
  {
    -[HFWallpaperEditCollectionBuilder hkObject](self, "hkObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_initWeak(&location, self);
      v4 = (void *)MEMORY[0x1E0D519C0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __63__HFWallpaperEditCollectionBuilder_initialEditCollectionFuture__block_invoke;
      v16[3] = &unk_1EA729F60;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v4, "lazyFutureWithBlock:", v16);
      v5 = (NAFuture *)objc_claimAutoreleasedReturnValue();
      initialEditCollectionFuture = self->_initialEditCollectionFuture;
      self->_initialEditCollectionFuture = v5;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "defaultWallpaperForCollectionType:", -[HFWallpaperEditCollectionBuilder namedWallpaperCollectionType](self, "namedWallpaperCollectionType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "wallpaperImageForWallpaper:variant:", v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0D519C0];
      -[HFWallpaperEditCollectionBuilder editCollectionForWallpaper:image:](self, "editCollectionForWallpaper:image:", v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "futureWithResult:", v12);
      v13 = (NAFuture *)objc_claimAutoreleasedReturnValue();
      v14 = self->_initialEditCollectionFuture;
      self->_initialEditCollectionFuture = v13;

    }
  }
  return self->_initialEditCollectionFuture;
}

void __63__HFWallpaperEditCollectionBuilder_initialEditCollectionFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hkObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaperForHomeKitObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "flatMap:", &__block_literal_global_109);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v10, "addCompletionBlock:", v8);
}

id __63__HFWallpaperEditCollectionBuilder_initialEditCollectionFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HFWallpaperEditCollection *v7;
  void *v8;

  v2 = a2;
  +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaperImageForWallpaper:variant:", v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperImageForWallpaper:variant:", v2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HFWallpaperEditCollection initWithWallpaper:originalImage:processedImage:]([HFWallpaperEditCollection alloc], "initWithWallpaper:originalImage:processedImage:", v2, v4, v6);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)editCollectionForWallpaper:(id)a3 image:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HFWallpaperEditCollection *v9;

  v5 = a4;
  v6 = a3;
  +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateProcessedImageFromWallpaper:originalImage:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HFWallpaperEditCollection initWithWallpaper:originalImage:processedImage:]([HFWallpaperEditCollection alloc], "initWithWallpaper:originalImage:processedImage:", v6, v5, v8);
  return v9;
}

- (HFHomeKitObject)hkObject
{
  return self->_hkObject;
}

- (int64_t)namedWallpaperCollectionType
{
  return self->_namedWallpaperCollectionType;
}

- (void)setNamedWallpaperCollectionType:(int64_t)a3
{
  self->_namedWallpaperCollectionType = a3;
}

- (BOOL)hkObjectNewlyCreated
{
  return self->_hkObjectNewlyCreated;
}

- (void)setHkObjectNewlyCreated:(BOOL)a3
{
  self->_hkObjectNewlyCreated = a3;
}

- (void)setInitialEditCollectionFuture:(id)a3
{
  objc_storeStrong((id *)&self->_initialEditCollectionFuture, a3);
}

- (HFWallpaperEditCollection)updatedEditCollection
{
  return self->_updatedEditCollection;
}

- (void)setUpdatedEditCollection:(id)a3
{
  objc_storeStrong((id *)&self->_updatedEditCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedEditCollection, 0);
  objc_storeStrong((id *)&self->_initialEditCollectionFuture, 0);
  objc_storeStrong((id *)&self->_hkObject, 0);
}

@end
