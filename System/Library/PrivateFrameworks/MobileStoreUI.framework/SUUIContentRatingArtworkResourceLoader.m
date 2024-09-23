@implementation SUUIContentRatingArtworkResourceLoader

- (SUUIContentRatingArtworkResourceLoader)init
{
  return -[SUUIContentRatingArtworkResourceLoader initWithArtworkLoader:](self, "initWithArtworkLoader:", 0);
}

- (SUUIContentRatingArtworkResourceLoader)initWithArtworkLoader:(id)a3
{
  id v5;
  SUUIContentRatingArtworkResourceLoader *v6;
  uint64_t v7;
  NSMapTable *artworkRequestIDs;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SUUIContentRatingArtworkResourceLoader;
    v6 = -[SUUIContentRatingArtworkResourceLoader init](&v10, sel_init);
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

- (id)cachedImageForContentRating:(id)a3 withClientContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[SUUIContentRatingArtworkResourceLoader _urlForContentRating:clientContext:](self, "_urlForContentRating:clientContext:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_4;
  objc_msgSend(v6, "contentRatingSystemName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("appsBrazil"));

  if (!v9)
    goto LABEL_4;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "contentRank");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("ContentRating-appsBrazil-%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIContentRatingArtworkResourceLoader _loadImage:](self, "_loadImage:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_4:
    -[NSMapTable objectForKey:](self->_artworkRequestIDs, "objectForKey:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      -[SUUIResourceLoader cachedResourceForRequestIdentifier:](self->_loader, "cachedResourceForRequestIdentifier:", objc_msgSend(v14, "unsignedIntegerValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (void)loadImageForContentRating:(id)a3 clientContent:(id)a4 reason:(int64_t)a5
{
  void *v7;
  SUUIArtworkRequest *v8;
  void *v9;
  NSMapTable *artworkRequestIDs;
  void *v11;
  id v12;

  v12 = a3;
  -[SUUIContentRatingArtworkResourceLoader _urlForContentRating:clientContext:](self, "_urlForContentRating:clientContext:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIArtworkRequest setDataConsumer:](v8, "setDataConsumer:", self->_imageDataConsumer);
    -[SUUIArtworkRequest setDelegate:](v8, "setDelegate:", self);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setURL:](v8, "setURL:", v9);

    -[SUUIResourceLoader loadResourceWithRequest:reason:](self->_loader, "loadResourceWithRequest:reason:", v8, a5);
    artworkRequestIDs = self->_artworkRequestIDs;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v8, "requestIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](artworkRequestIDs, "setObject:forKey:", v11, v12);

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

  v2 = 11.0;
  v3 = 11.0;
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
            objc_msgSend(v21, "contentRatingArtworkLoader:didLoadImage:forContentRating:", self, v6, v15);
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

- (id)_urlForContentRating:(id)a3 clientContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v5 = a3;
  objc_msgSend(a4, "URLBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v21 = 0;
    objc_msgSend(v6, "valueForKey:error:", CFSTR("imagesForRatingBadges"), &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "contentRatingSystemName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "contentRank");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = (void *)objc_msgSend(v13, "copy");
          if (objc_msgSend(v14, "count") < 1)
          {
            v9 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "scale");
            v17 = v16;

            if (v17 >= 2.0)
              objc_msgSend(v14, "lastObject");
            else
              objc_msgSend(v14, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v18, "objectForKey:", CFSTR("url"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = (void *)objc_msgSend(v19, "copy");

            }
            else
            {
              v9 = 0;
            }

          }
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_loadImage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
