@implementation SUUICategoryArtworkLoader

- (SUUICategoryArtworkLoader)init
{
  return -[SUUICategoryArtworkLoader initWithArtworkLoader:](self, "initWithArtworkLoader:", 0);
}

- (SUUICategoryArtworkLoader)initWithArtworkLoader:(id)a3
{
  id v5;
  SUUICategoryArtworkLoader *v6;
  uint64_t v7;
  NSMapTable *artworkRequestIDs;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SUUICategoryArtworkLoader;
    v6 = -[SUUICategoryArtworkLoader init](&v10, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      artworkRequestIDs = v6->_artworkRequestIDs;
      v6->_artworkRequestIDs = (NSMapTable *)v7;

      objc_storeStrong((id *)&v6->_loader, a3);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil loader"));

    v6 = 0;
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;
  id location;

  objc_initWeak(&location, a3);
  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 0);
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  v7 = objc_loadWeakRetained(&location);
  -[NSHashTable addObject:](observers, "addObject:", v7);

  objc_destroyWeak(&location);
}

- (id)cachedImageForCategory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSMapTable objectForKey:](self->_artworkRequestIDs, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[SUUIResourceLoader cachedResourceForRequestIdentifier:](self->_loader, "cachedResourceForRequestIdentifier:", objc_msgSend(v4, "unsignedIntegerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)loadImageForCategory:(id)a3 reason:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SUUIArtworkRequest *v14;
  NSMapTable *artworkRequestIDs;
  void *v16;
  id v17;

  v17 = a3;
  -[NSMapTable objectForKey:](self->_artworkRequestIDs, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6
    || !-[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_loader, "trySetReason:forRequestWithIdentifier:", a4, objc_msgSend(v6, "unsignedIntegerValue")))
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = v9;

    if (v10 == 2.0)
      v11 = 100;
    else
      v11 = 50;
    objc_msgSend(v17, "artworkProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "artworkURLForSize:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_alloc_init(SUUIArtworkRequest);
      -[SUUIArtworkRequest setDataConsumer:](v14, "setDataConsumer:", self->_imageDataConsumer);
      -[SUUIArtworkRequest setDelegate:](v14, "setDelegate:", self);
      -[SUUIArtworkRequest setURL:](v14, "setURL:", v13);
      -[SUUIResourceLoader loadResourceWithRequest:reason:](self->_loader, "loadResourceWithRequest:reason:", v14, a4);
      artworkRequestIDs = self->_artworkRequestIDs;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v14, "requestIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](artworkRequestIDs, "setObject:forKey:", v16, v17);

    }
  }

}

- (UIImage)placeholderImage
{
  UIImage *placeholderImage;
  SUUIImageDataConsumer *imageDataConsumer;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  placeholderImage = self->_placeholderImage;
  if (!placeholderImage)
  {
    imageDataConsumer = self->_imageDataConsumer;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIImageDataConsumer imageForColor:](imageDataConsumer, "imageForColor:", v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_placeholderImage;
    self->_placeholderImage = v6;

    placeholderImage = self->_placeholderImage;
  }
  return placeholderImage;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 33.0;
  v3 = 33.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  uint64_t v7;
  NSMapTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMapTable *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(a3, "requestIdentifier");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = self->_artworkRequestIDs;
  v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      -[NSMapTable objectForKey:](self->_artworkRequestIDs, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == objc_msgSend(v14, "unsignedIntegerValue"))
        break;

      if (v10 == ++v12)
      {
        v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v13;

    if (!v15)
      goto LABEL_22;
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v21, "categoryArtworkLoader:didLoadImage:forCategory:", self, v6, v15);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v18);
    }

  }
  else
  {
LABEL_9:
    v15 = v8;
  }

LABEL_22:
}

- (SUUIResourceLoader)artworkLoader
{
  return self->_loader;
}

- (SUUIImageDataConsumer)imageDataConsumer
{
  return self->_imageDataConsumer;
}

- (void)setImageDataConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_imageDataConsumer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_imageDataConsumer, 0);
  objc_storeStrong((id *)&self->_artworkRequestIDs, 0);
}

@end
