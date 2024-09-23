@implementation SUUISwooshArtworkLoader

- (SUUISwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4
{
  id v7;
  id v8;
  SUUISwooshArtworkLoader *v9;
  SUUISwooshArtworkLoader *v10;
  uint64_t v11;
  NSMapTable *artworkRequestIDs;
  NSMutableIndexSet *v13;
  NSMutableIndexSet *outstandingRequestIDs;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SUUISwooshArtworkLoader;
  v9 = -[SUUISwooshArtworkLoader init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_artworkLoader, a3);
    objc_storeStrong((id *)&v10->_swooshViewController, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    artworkRequestIDs = v10->_artworkRequestIDs;
    v10->_artworkRequestIDs = (NSMapTable *)v11;

    v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    outstandingRequestIDs = v10->_outstandingRequestIDs;
    v10->_outstandingRequestIDs = v13;

  }
  return v10;
}

- (unint64_t)artworkRequestIdentifierForObject:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMapTable objectForKey:](self->_artworkRequestIDs, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)cachedImageForObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSMapTable objectForKey:](self->_artworkRequestIDs, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[SUUIResourceLoader cachedResourceForRequestIdentifier:](self->_artworkLoader, "cachedResourceForRequestIdentifier:", objc_msgSend(v4, "unsignedIntegerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)deprioritizePendingImageLoads
{
  NSMutableIndexSet *outstandingRequestIDs;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  outstandingRequestIDs = self->_outstandingRequestIDs;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SUUISwooshArtworkLoader_deprioritizePendingImageLoads__block_invoke;
  v4[3] = &unk_2511F5390;
  v4[4] = self;
  v4[5] = &v5;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](outstandingRequestIDs, "enumerateIndexesUsingBlock:", v4);
  if (v6[5])
    -[NSMutableIndexSet removeIndexes:](self->_outstandingRequestIDs, "removeIndexes:");
  _Block_object_dispose(&v5, 8);

}

uint64_t __56__SUUISwooshArtworkLoader_deprioritizePendingImageLoads__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "trySetReason:forRequestWithIdentifier:", 0, a2);
  if ((result & 1) == 0)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    return objc_msgSend(v5, "addIndex:", a2);
  }
  return result;
}

- (BOOL)loadImageForObject:(id)a3 URL:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  SUUIArtworkRequest *v13;
  uint64_t v14;
  NSMapTable *artworkRequestIDs;
  void *v16;

  v8 = a3;
  v9 = a4;
  -[NSMapTable objectForKey:](self->_artworkRequestIDs, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10
    && -[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_artworkLoader, "trySetReason:forRequestWithIdentifier:", a5, objc_msgSend(v10, "unsignedIntegerValue")))
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    v13 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIArtworkRequest setDataConsumer:](v13, "setDataConsumer:", self->_imageDataConsumer);
    -[SUUIArtworkRequest setDelegate:](v13, "setDelegate:", self);
    -[SUUIArtworkRequest setURL:](v13, "setURL:", v9);
    v12 = -[SUUIResourceLoader loadResourceWithRequest:reason:](self->_artworkLoader, "loadResourceWithRequest:reason:", v13, 1);
    if (v12)
    {
      v14 = -[SUUIResourceRequest requestIdentifier](v13, "requestIdentifier");
      -[NSMutableIndexSet addIndex:](self->_outstandingRequestIDs, "addIndex:", v14);
      artworkRequestIDs = self->_artworkRequestIDs;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](artworkRequestIDs, "setObject:forKey:", v16, v8);

    }
  }

  return v12;
}

- (BOOL)loadImageForObject:(id)a3 artworkRequest:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMapTable *artworkRequestIDs;
  void *v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  -[NSMapTable objectForKey:](self->_artworkRequestIDs, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10
    && -[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_artworkLoader, "trySetReason:forRequestWithIdentifier:", a5, objc_msgSend(v10, "unsignedIntegerValue"))|| (objc_msgSend(v9, "setDelegate:", self), !-[SUUIResourceLoader loadResourceWithRequest:reason:](self->_artworkLoader, "loadResourceWithRequest:reason:", v9, 1)))
  {
    v15 = 0;
  }
  else
  {
    v12 = objc_msgSend(v9, "requestIdentifier");
    -[NSMutableIndexSet addIndex:](self->_outstandingRequestIDs, "addIndex:", v12);
    artworkRequestIDs = self->_artworkRequestIDs;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](artworkRequestIDs, "setObject:forKey:", v14, v8);

    v15 = 1;
  }

  return v15;
}

- (UIImage)placeholderImage
{
  UIImage *placeholderImage;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  placeholderImage = self->_placeholderImage;
  if (!placeholderImage)
  {
    -[SUUISwooshArtworkLoader imageDataConsumer](self, "imageDataConsumer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageForColor:", v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_placeholderImage;
    self->_placeholderImage = v6;

    placeholderImage = self->_placeholderImage;
  }
  return placeholderImage;
}

- (void)setImageDataConsumer:(id)a3
{
  SUUIImageDataConsumer *v5;
  UIImage *placeholderImage;
  SUUIImageDataConsumer *v7;

  v5 = (SUUIImageDataConsumer *)a3;
  if (self->_imageDataConsumer != v5)
  {
    placeholderImage = self->_placeholderImage;
    self->_placeholderImage = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_imageDataConsumer, a3);
    v5 = v7;
  }

}

- (void)setPlaceholderColorWithColorScheme:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  UIImage *v10;
  UIImage *placeholderImage;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    switch(objc_msgSend(v4, "schemeStyle"))
    {
      case 0:
      case 2:
        v5 = (void *)MEMORY[0x24BEBD4B8];
        v6 = 0.2;
        v7 = 0.0;
        goto LABEL_6;
      case 1:
      case 3:
        v5 = (void *)MEMORY[0x24BEBD4B8];
        v6 = 0.2;
        v7 = 1.0;
        goto LABEL_6;
      default:
        v8 = 0;
        break;
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x24BEBD4B8];
    v7 = 0.8;
    v6 = 1.0;
LABEL_6:
    objc_msgSend(v5, "colorWithWhite:alpha:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUUISwooshArtworkLoader imageDataConsumer](self, "imageDataConsumer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageForColor:", v8);
  v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
  placeholderImage = self->_placeholderImage;
  self->_placeholderImage = v10;

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  NSMutableIndexSet *outstandingRequestIDs;
  id v7;
  id v8;

  outstandingRequestIDs = self->_outstandingRequestIDs;
  v7 = a4;
  v8 = a3;
  -[NSMutableIndexSet removeIndex:](outstandingRequestIDs, "removeIndex:", objc_msgSend(v8, "requestIdentifier"));
  -[SUUISwooshArtworkLoader setImage:forRequest:](self, "setImage:forRequest:", v7, v8);

  objc_msgSend(v8, "setDelegate:", 0);
}

- (SUUIResourceLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (SUUIImageDataConsumer)imageDataConsumer
{
  return self->_imageDataConsumer;
}

- (SUUISwooshViewController)swooshViewController
{
  return self->_swooshViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_outstandingRequestIDs, 0);
  objc_storeStrong((id *)&self->_imageDataConsumer, 0);
  objc_storeStrong((id *)&self->_artworkRequestIDs, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end
