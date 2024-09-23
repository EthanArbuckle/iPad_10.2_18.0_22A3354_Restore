@implementation ISImageBagIcon

- (ISImageBagIcon)initWithImages:(id)a3
{
  return -[ISImageBagIcon initWithImages:decorations:](self, "initWithImages:decorations:", a3, MEMORY[0x1E0C9AA60]);
}

- (ISImageBagIcon)initWithImages:(id)a3 decorations:(id)a4
{
  id v7;
  id v8;
  ISImageBagIcon *v9;
  uint64_t v10;
  ISImageCache *imageCache;
  uint64_t v12;
  NSArray *decorations;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ISImageBagIcon;
  v9 = -[ISIcon _init](&v15, sel__init);
  if (v9)
  {
    v10 = objc_opt_new();
    imageCache = v9->_imageCache;
    v9->_imageCache = (ISImageCache *)v10;

    objc_storeStrong((id *)&v9->_images, a3);
    v12 = objc_msgSend(v8, "copy");
    decorations = v9->_decorations;
    v9->_decorations = (NSArray *)v12;

  }
  return v9;
}

- (ISImageBagIcon)initWithImageBag:(id)a3
{
  id v4;
  ISImageBagIcon *v5;
  uint64_t v6;
  ISImageCache *imageCache;
  uint64_t v8;
  NSArray *images;
  NSArray *decorations;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ISImageBagIcon;
  v5 = -[ISIcon _init](&v12, sel__init);
  if (v5)
  {
    v6 = objc_opt_new();
    imageCache = v5->_imageCache;
    v5->_imageCache = (ISImageCache *)v6;

    objc_msgSend(v4, "images");
    v8 = objc_claimAutoreleasedReturnValue();
    images = v5->_images;
    v5->_images = (NSArray *)v8;

    decorations = v5->_decorations;
    v5->_decorations = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v5;
}

- (id)_generateImageWithDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ISCompositor *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint8_t v25[8];
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D3A7C8]);
  -[ISImageBagIcon images](self, "images");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithImages:", v6);

  -[ISImageBagIcon images](self, "images");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    if (v7)
    {
LABEL_3:
      +[ISRecipeFactory factoryWithDescriptor:](ISRecipeFactory, "factoryWithDescriptor:", v4);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
        -[NSObject recipe](v10, "recipe");
      else
        -[NSObject genericTaggedRecipe](v10, "genericTaggedRecipe");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(ISCompositor);
      if (objc_msgSend(v4, "shape") == 5 || objc_msgSend(v4, "shape") == 6)
        -[ISCompositor setRenderingMode:](v17, "setRenderingMode:", 2);
      v26 = CFSTR("kISPrimaryResourceKey");
      v27[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISCompositor addElementWithRecipe:resources:](v17, "addElementWithRecipe:resources:", v16, v18);

      objc_msgSend(v4, "size");
      v20 = v19;
      v22 = v21;
      objc_msgSend(v4, "scale");
      -[ISCompositor imageForSize:scale:](v17, "imageForSize:scale:", v20, v22, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }
  else
  {
    _ISDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1AA928000, v12, OS_LOG_TYPE_DEFAULT, "No images provided. Attempting to fallback to default assets", v25, 2u);
    }

    +[ISStaticResources sharedInstance](ISStaticResources, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fallbackResourceForHint:descriptor:referenceObj:", 0, v4, self);
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v14;
    if (v14)
      goto LABEL_3;
  }
  _ISDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[ISImageBagIcon _generateImageWithDescriptor:].cold.1((uint64_t)self, v11);
  v15 = 0;
LABEL_16:

  return v15;
}

- (void)_prepareImagesForImageDescriptors:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copy");
        -[ISImageCache imageForDescriptor:](self->_imageCache, "imageForDescriptor:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (!v10
          || ((objc_msgSend(v10, "size"), v13 = v12, v15 = v14, objc_msgSend(v9, "size"), v13 == v17)
            ? (v18 = v15 == v16)
            : (v18 = 0),
              !v18))
        {
          -[ISImageBagIcon _generateImageWithDescriptor:](self, "_generateImageWithDescriptor:", v9);
          v19 = objc_claimAutoreleasedReturnValue();

          -[ISImageCache setImage:forDescriptor:](self->_imageCache, "setImage:forDescriptor:", v19, v9);
          v11 = (void *)v19;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

}

- (id)imageForImageDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ISImageCache imageForDescriptor:](self->_imageCache, "imageForDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || ((objc_msgSend(v5, "size"), v8 = v7, v10 = v9, objc_msgSend(v4, "size"), v8 == v12)
      ? (v13 = v10 == v11)
      : (v13 = 0),
        !v13))
  {
    v17[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISIcon prepareImagesForImageDescriptors:](self, "prepareImagesForImageDescriptors:", v14);

    -[ISImageCache imageForDescriptor:](self->_imageCache, "imageForDescriptor:", v4);
    v15 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v15;
  }

  return v6;
}

- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = (void (**)(id, void *))a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISIcon prepareImagesForImageDescriptors:](self, "prepareImagesForImageDescriptors:", v9, v11, v12);

  -[ISImageBagIcon imageForImageDescriptor:](self, "imageForImageDescriptor:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
}

- (NSArray)images
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (id)decorations
{
  return self->_decorations;
}

- (ISImageCache)imageCache
{
  return (ISImageCache *)objc_getProperty(self, a2, 40, 1);
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

- (void)_generateImageWithDescriptor:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AA928000, a2, OS_LOG_TYPE_ERROR, "Unable to create icon! Failed to create resource for %@", (uint8_t *)&v2, 0xCu);
}

@end
