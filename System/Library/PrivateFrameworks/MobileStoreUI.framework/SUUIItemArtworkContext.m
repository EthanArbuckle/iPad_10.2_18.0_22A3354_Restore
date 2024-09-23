@implementation SUUIItemArtworkContext

+ (id)lockupContextWithSize:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  +[SUUIProductImageDataConsumer lockupConsumerWithSize:itemKind:](SUUIProductImageDataConsumer, "lockupConsumerWithSize:itemKind:", a3, 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGeneralConsumer:", v5);

  +[SUUIStyledImageDataConsumer lockupIconConsumerWithSize:](SUUIStyledImageDataConsumer, "lockupIconConsumerWithSize:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconConsumer:", v6);

  +[SUUIStyledImageDataConsumer lockupProductImageConsumerWithSize:](SUUIStyledImageDataConsumer, "lockupProductImageConsumerWithSize:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNewsstandConsumer:", v7);

  return v4;
}

+ (id)roomContext
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  +[SUUIProductImageDataConsumer gridConsumer](SUUIProductImageDataConsumer, "gridConsumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGeneralConsumer:", v3);

  +[SUUIStyledImageDataConsumer roomIconConsumer](SUUIStyledImageDataConsumer, "roomIconConsumer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIconConsumer:", v4);

  +[SUUIStyledImageDataConsumer roomProductImageConsumer](SUUIStyledImageDataConsumer, "roomProductImageConsumer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNewsstandConsumer:", v5);

  return v2;
}

+ (id)wishlistContext
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  +[SUUIProductImageDataConsumer wishlistConsumer](SUUIProductImageDataConsumer, "wishlistConsumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGeneralConsumer:", v3);

  +[SUUIStyledImageDataConsumer wishlistIconConsumer](SUUIStyledImageDataConsumer, "wishlistIconConsumer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIconConsumer:", v4);

  +[SUUIStyledImageDataConsumer wishlistProductImageConsumer](SUUIStyledImageDataConsumer, "wishlistProductImageConsumer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNewsstandConsumer:", v5);

  return v2;
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  NSMutableDictionary *placeholders;
  SUUIColorScheme *v7;

  v5 = (SUUIColorScheme *)a3;
  if (self->_colorScheme != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    -[SUUIProductImageDataConsumer setColorScheme:](self->_generalImageConsumer, "setColorScheme:", self->_colorScheme);
    -[SUUIProductImageDataConsumer setColorScheme:](self->_letterboxConsumer, "setColorScheme:", self->_colorScheme);
    -[SUUIProductImageDataConsumer setColorScheme:](self->_posterConsumer, "setColorScheme:", self->_colorScheme);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v7;
  }

}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  NSMutableDictionary *placeholders;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[SUUIProductImageDataConsumer setBackgroundColor:](self->_generalImageConsumer, "setBackgroundColor:", self->_backgroundColor);
    -[SUUIStyledImageDataConsumer setBackgroundColor:](self->_iconConsumer, "setBackgroundColor:", self->_backgroundColor);
    -[SUUIProductImageDataConsumer setBackgroundColor:](self->_letterboxConsumer, "setBackgroundColor:", self->_backgroundColor);
    -[SUUIStyledImageDataConsumer setBackgroundColor:](self->_newsstandConsumer, "setBackgroundColor:", self->_backgroundColor);
    -[SUUIProductImageDataConsumer setBackgroundColor:](self->_posterConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v7;
  }

}

- (void)setGeneralConsumer:(id)a3
{
  SUUIProductImageDataConsumer *v5;
  NSMutableDictionary *placeholders;
  SUUIProductImageDataConsumer *v7;

  v5 = (SUUIProductImageDataConsumer *)a3;
  if (self->_generalImageConsumer != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_generalImageConsumer, a3);
    -[SUUIProductImageDataConsumer setColorScheme:](self->_generalImageConsumer, "setColorScheme:", self->_colorScheme);
    -[SUUIProductImageDataConsumer setBackgroundColor:](self->_generalImageConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v7;
  }

}

- (void)setIconConsumer:(id)a3
{
  SUUIStyledImageDataConsumer *v5;
  NSMutableDictionary *placeholders;
  SUUIStyledImageDataConsumer *v7;

  v5 = (SUUIStyledImageDataConsumer *)a3;
  if (self->_iconConsumer != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_iconConsumer, a3);
    -[SUUIStyledImageDataConsumer setBackgroundColor:](self->_iconConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v7;
  }

}

- (void)setLetterboxConsumer:(id)a3
{
  SUUIProductImageDataConsumer *v5;
  NSMutableDictionary *placeholders;
  SUUIProductImageDataConsumer *v7;

  v5 = (SUUIProductImageDataConsumer *)a3;
  if (self->_letterboxConsumer != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_letterboxConsumer, a3);
    -[SUUIProductImageDataConsumer setColorScheme:](self->_letterboxConsumer, "setColorScheme:", self->_colorScheme);
    -[SUUIProductImageDataConsumer setBackgroundColor:](self->_letterboxConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v7;
  }

}

- (void)setNewsstandConsumer:(id)a3
{
  SUUIStyledImageDataConsumer *v5;
  NSMutableDictionary *placeholders;
  SUUIStyledImageDataConsumer *v7;

  v5 = (SUUIStyledImageDataConsumer *)a3;
  if (self->_newsstandConsumer != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_newsstandConsumer, a3);
    -[SUUIStyledImageDataConsumer setBackgroundColor:](self->_newsstandConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v7;
  }

}

- (void)setPosterConsumer:(id)a3
{
  SUUIProductImageDataConsumer *v5;
  NSMutableDictionary *placeholders;
  SUUIProductImageDataConsumer *v7;

  v5 = (SUUIProductImageDataConsumer *)a3;
  if (self->_posterConsumer != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_posterConsumer, a3);
    -[SUUIProductImageDataConsumer setColorScheme:](self->_posterConsumer, "setColorScheme:", self->_colorScheme);
    -[SUUIProductImageDataConsumer setBackgroundColor:](self->_posterConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v7;
  }

}

- (id)dataConsumerForItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *generalImageConsumer;

  v4 = a3;
  v5 = objc_msgSend(v4, "itemKind");
  v6 = 64;
  switch(v5)
  {
    case 2:
    case 6:
      goto LABEL_12;
    case 3:
    case 4:
    case 7:
    case 9:
    case 10:
    case 11:
      goto LABEL_11;
    case 5:
    case 12:
      goto LABEL_4;
    case 8:
      v6 = 40;
      goto LABEL_12;
    default:
      if (v5 == 17)
      {
LABEL_4:
        if (objc_msgSend(v4, "isNewsstandApp")
          && (objc_msgSend(v4, "newsstandArtworks"),
              v7 = (void *)objc_claimAutoreleasedReturnValue(),
              v7,
              v7))
        {
          v6 = 48;
        }
        else if (objc_msgSend(v4, "isHiddenFromSpringBoard")
               && (objc_msgSend(v4, "hasMessagesExtension") & 1) != 0)
        {
          v6 = 72;
        }
        else
        {
          v6 = 32;
        }
      }
      else
      {
LABEL_11:
        v6 = 24;
      }
LABEL_12:
      v8 = *(id *)((char *)&self->super.isa + v6);
      if (!v8)
      {
        generalImageConsumer = self->_generalImageConsumer;
        if (!generalImageConsumer)
          generalImageConsumer = self->_iconConsumer;
        v8 = generalImageConsumer;
      }

      return v8;
  }
}

- (CGSize)imageSizeForItem:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  SUUIProductImageDataConsumer *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  uint64_t i;
  double v27;
  double v28;
  SUUIStyledImageDataConsumer *v29;
  SUUIStyledImageDataConsumer *v30;
  SUUIProductImageDataConsumer *v31;
  SUUIProductImageDataConsumer *v32;
  SUUIProductImageDataConsumer *v33;
  uint64_t v34;
  CGSize result;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "itemKind");
    v7 = 0;
    if (v6 <= 0x11 && ((1 << v6) & 0x21020) != 0)
      v7 = objc_msgSend(v5, "isNewsstandApp") ^ 1;
    -[SUUIItemArtworkContext dataConsumerForItem:](self, "dataConsumerForItem:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageSize");
    v10 = v9;
    v12 = v11;

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v5, "artworksProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "bestArtworkForScaledSize:", v10, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "size");
        v17 = v16;
        v19 = v18;

        v20 = v10 / v17;
        if (v10 / v17 >= v12 / v19)
          v20 = v12 / v19;
        v10 = ceil(v17 * v20);
        v12 = ceil(v19 * v20);
      }

    }
  }
  else
  {
    v10 = *MEMORY[0x24BDBF148];
    v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v29 = self->_iconConsumer;
    v30 = self->_newsstandConsumer;
    v31 = self->_generalImageConsumer;
    v32 = self->_letterboxConsumer;
    v21 = self->_posterConsumer;
    v22 = 0;
    v33 = v21;
    do
    {
      v23 = *(SUUIStyledImageDataConsumer **)((char *)&v29 + v22);
      if (v23)
      {
        objc_msgSend(v23, "imageSize", v29, v30, v31, v32, v33, v34);
        if (v10 < v24)
          v10 = v24;
        if (v12 < v25)
          v12 = v25;
      }
      v22 += 8;
    }
    while (v22 != 40);
    for (i = 32; i != -8; i -= 8)

  }
  v27 = v10;
  v28 = v12;
  result.height = v28;
  result.width = v27;
  return result;
}

- (CGSize)largestImageSizeForItems:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize result;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = *MEMORY[0x24BDBF148];
    v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          -[SUUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11), (_QWORD)v18);
          if (v6 < v13)
            v6 = v13;
          if (v5 < v12)
            v5 = v12;
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[SUUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", 0);
    v5 = v14;
    v6 = v15;
  }

  v16 = v5;
  v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)largestImageSizeForLockups:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v8 = v6;
  v9 = v5;
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v22;
    v8 = v6;
    v9 = v5;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "item");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[SUUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", v13);
          if (v8 < v15)
            v8 = v15;
          if (v9 < v14)
            v9 = v14;
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  if (v9 == v5 && v8 == v6)
  {
    -[SUUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", 0);
    v9 = v17;
    v8 = v18;
  }

  v19 = v9;
  v20 = v8;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)placeholderImageForItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  SUUIProductImageDataConsumer *v9;
  SUUIProductImageDataConsumer *letterboxConsumer;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  __CFString *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *placeholders;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  void *v21;
  CGSize v23;
  CGSize v24;
  CGSize v25;

  v4 = a3;
  -[SUUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", v4);
  v6 = v5;
  v8 = v7;
  -[SUUIItemArtworkContext dataConsumerForItem:](self, "dataConsumerForItem:", v4);
  v9 = (SUUIProductImageDataConsumer *)objc_claimAutoreleasedReturnValue();

  if (v9 == (SUUIProductImageDataConsumer *)self->_iconConsumer)
  {
    v14 = 1;
    v15 = CFSTR("application");
  }
  else if (v9 == (SUUIProductImageDataConsumer *)self->_messagesIconConsumer)
  {
    v14 = 1;
    v15 = CFSTR("messages");
  }
  else
  {
    if (v9 == (SUUIProductImageDataConsumer *)self->_newsstandConsumer)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      v24.width = v6;
      v24.height = v8;
      NSStringFromCGSize(v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("newsstand: %@"), v13);
    }
    else if (v9 == self->_posterConsumer)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      v25.width = v6;
      v25.height = v8;
      NSStringFromCGSize(v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("poster: %@"), v13);
    }
    else
    {
      letterboxConsumer = self->_letterboxConsumer;
      v11 = (void *)MEMORY[0x24BDD17C8];
      v23.width = v6;
      v23.height = v8;
      NSStringFromCGSize(v23);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v9 == letterboxConsumer)
        objc_msgSend(v11, "stringWithFormat:", CFSTR("letterbox: %@"), v12);
      else
        objc_msgSend(v11, "stringWithFormat:", CFSTR("general: %@"), v12);
    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  placeholders = self->_placeholders;
  if (!placeholders)
  {
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v20 = self->_placeholders;
    self->_placeholders = v19;

    placeholders = self->_placeholders;
  }
  -[NSMutableDictionary objectForKey:](placeholders, "objectForKey:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    if (v14)
      -[SUUIProductImageDataConsumer imageForColor:](v9, "imageForColor:", 0);
    else
      -[SUUIProductImageDataConsumer imageForColor:size:](v9, "imageForColor:size:", 0, v6, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      -[NSMutableDictionary setObject:forKey:](self->_placeholders, "setObject:forKey:", v21, v15);
  }

  return v21;
}

- (id)URLForItem:(id)a3
{
  void *v3;
  void *v4;

  -[SUUIItemArtworkContext artworkForItem:](self, "artworkForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)artworkForItem:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SUUIItemArtworkContext dataConsumerForItem:](self, "dataConsumerForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageSize");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v4, "artworksProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bestArtworkForScaledSize:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SUUIProductImageDataConsumer)generalConsumer
{
  return self->_generalImageConsumer;
}

- (SUUIStyledImageDataConsumer)iconConsumer
{
  return self->_iconConsumer;
}

- (SUUIProductImageDataConsumer)letterboxConsumer
{
  return self->_letterboxConsumer;
}

- (SUUIStyledImageDataConsumer)newsstandConsumer
{
  return self->_newsstandConsumer;
}

- (SUUIProductImageDataConsumer)posterConsumer
{
  return self->_posterConsumer;
}

- (SUUIStyledImageDataConsumer)messagesIconConsumer
{
  return self->_messagesIconConsumer;
}

- (void)setMessagesIconConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_messagesIconConsumer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesIconConsumer, 0);
  objc_storeStrong((id *)&self->_posterConsumer, 0);
  objc_storeStrong((id *)&self->_placeholders, 0);
  objc_storeStrong((id *)&self->_newsstandConsumer, 0);
  objc_storeStrong((id *)&self->_letterboxConsumer, 0);
  objc_storeStrong((id *)&self->_iconConsumer, 0);
  objc_storeStrong((id *)&self->_generalImageConsumer, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
