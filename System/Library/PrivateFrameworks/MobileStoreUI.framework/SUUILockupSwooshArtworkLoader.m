@implementation SUUILockupSwooshArtworkLoader

- (SUUILockupSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4
{
  id v6;
  SUUILockupSwooshArtworkLoader *v7;
  uint64_t v8;
  SUUIItemArtworkContext *context;
  uint64_t v10;
  SUUIVideoImageDataConsumer *videoImageConsumer;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUILockupSwooshArtworkLoader;
  v7 = -[SUUISwooshArtworkLoader initWithArtworkLoader:swoosh:](&v13, sel_initWithArtworkLoader_swoosh_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "artworkContext");
    v8 = objc_claimAutoreleasedReturnValue();
    context = v7->_context;
    v7->_context = (SUUIItemArtworkContext *)v8;

    objc_msgSend(v6, "videoImageConsumer");
    v10 = objc_claimAutoreleasedReturnValue();
    videoImageConsumer = v7->_videoImageConsumer;
    v7->_videoImageConsumer = (SUUIVideoImageDataConsumer *)v10;

  }
  return v7;
}

- (BOOL)loadImageForItem:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  SUUIArtworkRequest *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[SUUIItemArtworkContext URLForItem:](self->_context, "URLForItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIItemArtworkContext dataConsumerForItem:](self->_context, "dataConsumerForItem:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setDataConsumer:](v8, "setDataConsumer:", v9);

    -[SUUIArtworkRequest setURL:](v8, "setURL:", v7);
    v10 = -[SUUISwooshArtworkLoader loadImageForObject:artworkRequest:reason:](self, "loadImageForObject:artworkRequest:reason:", v6, v8, a4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)loadImageForVideo:(id)a3 reason:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  SUUIArtworkRequest *v14;
  BOOL v15;

  v6 = a3;
  -[SUUIVideoImageDataConsumer landscapeSize](self->_videoImageConsumer, "landscapeSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "artworks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bestArtworkForScaledSize:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIArtworkRequest setDataConsumer:](v14, "setDataConsumer:", self->_videoImageConsumer);
    -[SUUIArtworkRequest setURL:](v14, "setURL:", v13);
    v15 = -[SUUISwooshArtworkLoader loadImageForObject:artworkRequest:reason:](self, "loadImageForObject:artworkRequest:reason:", v6, v14, a4);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)placeholderImageForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SUUISwooshArtworkLoader swooshViewController](self, "swooshViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeholderImageForItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)placeholderImageForVideo:(id)a3
{
  UIImage *videoPlaceholderImage;
  UIImage *v5;
  UIImage *v6;

  videoPlaceholderImage = self->_videoPlaceholderImage;
  if (!videoPlaceholderImage)
  {
    -[SUUIVideoImageDataConsumer imageForColor:orientation:](self->_videoImageConsumer, "imageForColor:orientation:", 0, 2);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_videoPlaceholderImage;
    self->_videoPlaceholderImage = v5;

    videoPlaceholderImage = self->_videoPlaceholderImage;
  }
  return videoPlaceholderImage;
}

- (void)loadImagesForNextPageWithReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;

  -[SUUISwooshArtworkLoader swooshViewController](self, "swooshViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockups");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v15, "count");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v15, "objectAtIndex:", v9 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[SUUILockupSwooshArtworkLoader loadImageForItem:reason:](self, "loadImageForItem:reason:", v11, a3);
        objc_msgSend(v11, "videos");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          -[SUUILockupSwooshArtworkLoader loadImageForVideo:reason:](self, "loadImageForVideo:reason:", v14, a3);
        v8 += v12;

      }
      if (v9 >= v7)
        break;
      ++v9;
    }
    while (v8 < 7);
  }

}

- (void)setImage:(id)a3 forRequest:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id obj;
  void *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = a4;
  v7 = objc_msgSend(v20, "requestIdentifier");
  -[SUUISwooshArtworkLoader swooshViewController](self, "swooshViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockups");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForVisibleItems");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    v18 = v8;
    v19 = v6;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v13, "item"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "item");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (-[SUUISwooshArtworkLoader artworkRequestIdentifierForObject:](self, "artworkRequestIdentifierForObject:", v15) == v7)
          {
            v8 = v18;
            v6 = v19;
            objc_msgSend(v18, "setImage:forItemAtIndex:", v19, objc_msgSend(v13, "item"));
LABEL_16:

            goto LABEL_17;
          }
          objc_msgSend(v15, "videos");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17
            && -[SUUISwooshArtworkLoader artworkRequestIdentifierForObject:](self, "artworkRequestIdentifierForObject:", v17) == v7)
          {
            v8 = v18;
            v6 = v19;
            objc_msgSend(v18, "setVideoThumbnail:forItemAtIndex:", v19, objc_msgSend(v13, "item"));

            goto LABEL_16;
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v8 = v18;
      v6 = v19;
      if (v10)
        continue;
      break;
    }
  }
LABEL_17:

  v23.receiver = self;
  v23.super_class = (Class)SUUILockupSwooshArtworkLoader;
  -[SUUISwooshArtworkLoader setImage:forRequest:](&v23, sel_setImage_forRequest_, v6, v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_videoImageConsumer, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
