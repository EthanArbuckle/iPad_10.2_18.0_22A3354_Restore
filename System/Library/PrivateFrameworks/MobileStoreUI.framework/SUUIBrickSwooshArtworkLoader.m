@implementation SUUIBrickSwooshArtworkLoader

- (SUUIBrickSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4
{
  id v6;
  SUUIBrickSwooshArtworkLoader *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SUUIBrickSwooshArtworkLoader;
  v7 = -[SUUISwooshArtworkLoader initWithArtworkLoader:swoosh:](&v16, sel_initWithArtworkLoader_swoosh_, a3, v6);
  if (v7)
  {
    +[SUUIStyledImageDataConsumer brickConsumer](SUUIStyledImageDataConsumer, "brickConsumer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v10);

    -[SUUISwooshArtworkLoader setImageDataConsumer:](v7, "setImageDataConsumer:", v8);
    objc_msgSend(v8, "imageSize");
    v12 = v11;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v7->_artworkSize = (uint64_t)(v12 * v14);

  }
  return v7;
}

- (BOOL)loadImageForBrick:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  objc_msgSend(v6, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = -[SUUISwooshArtworkLoader loadImageForObject:URL:reason:](self, "loadImageForObject:URL:reason:", v6, v8, a4);
  else
    v9 = 0;

  return v9;
}

- (void)loadImagesForNextPageWithReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  id v12;

  -[SUUISwooshArtworkLoader swooshViewController](self, "swooshViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bricks");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v12, "count");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v12, "objectAtIndex:", v9 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SUUIBrickSwooshArtworkLoader loadImageForBrick:reason:](self, "loadImageForBrick:reason:", v10, a3);

      if (v9 >= v7)
        break;
      v8 += v11;
      ++v9;
    }
    while (v8 < 4);
  }

}

- (void)setImage:(id)a3 forRequest:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v19 = a4;
  v7 = objc_msgSend(v19, "requestIdentifier");
  -[SUUISwooshArtworkLoader swooshViewController](self, "swooshViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bricks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForVisibleItems");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    v18 = v6;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v15, "item", v18));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[SUUISwooshArtworkLoader artworkRequestIdentifierForObject:](self, "artworkRequestIdentifierForObject:", v16) == v7)
        {
          v17 = objc_msgSend(v15, "item");
          v6 = v18;
          objc_msgSend(v8, "setImage:forItemAtIndex:", v18, v17);

          goto LABEL_11;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v6 = v18;
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  v20.receiver = self;
  v20.super_class = (Class)SUUIBrickSwooshArtworkLoader;
  -[SUUISwooshArtworkLoader setImage:forRequest:](&v20, sel_setImage_forRequest_, v6, v19);

}

@end
