@implementation _MSStickerPackCollectionViewDataSource

+ (int64_t)_stickerSizeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSStickerBrowserLayoutSparse")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("MSStickerSizeLarge")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("MSStickerSizeClassLarge")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSStickerBrowserLayoutCondensed")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("MSStickerSizeSmall")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MSStickerSizeClassSmall")) ^ 1;
  }

  return v4;
}

- (_MSStickerPackCollectionViewDataSource)initWithStickerPackURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _MSStickerPackCollectionViewDataSource *v8;
  NSMutableArray *v9;
  NSMutableArray *stickers;
  _MSStickerPackCollectionViewDataSource *v11;
  objc_super v13;

  v4 = a3;
  NSLog(CFSTR("initWithStickerPackURL MSStickerPackCollectionViewDataSource %@"), v4);
  if (v4
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "path"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "fileExistsAtPath:", v6),
        v6,
        v5,
        v7))
  {
    v13.receiver = self;
    v13.super_class = (Class)_MSStickerPackCollectionViewDataSource;
    v8 = -[_MSStickerPackCollectionViewDataSource init](&v13, sel_init);
    if (v8)
    {
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      stickers = v8->_stickers;
      v8->_stickers = v9;

      -[_MSStickerPackCollectionViewDataSource _loadStickerPackWithURL:](v8, "_loadStickerPackWithURL:", v4);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_loadStickerPackWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MSSticker *v18;
  MSSticker *v19;
  id v20;
  void *v21;
  _MSStickerPackCollectionViewDataSource *v22;
  void *v23;
  id v24;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v4;
    objc_msgSend(v4, "URLByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("IMStickerPackLayout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_stickerSize = +[_MSStickerPackCollectionViewDataSource _stickerSizeFromString:](_MSStickerPackCollectionViewDataSource, "_stickerSizeFromString:", v8);

    objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("IMStickers"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v31)
    {
      v29 = *(_QWORD *)v34;
      v28 = *MEMORY[0x1E0D39C88];
      v27 = *MEMORY[0x1E0D39C80];
      v25 = v6;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKey:", v28);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByAppendingString:", CFSTR(".accessibilityLabel"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v27);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "localizedStringForKey:value:table:", v12, v13, v30);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v6, "stringByAppendingPathComponent:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fileURLWithPath:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = [MSSticker alloc];
          v32 = 0;
          v19 = -[MSSticker initWithContentsOfFileURL:localizedDescription:error:](v18, "initWithContentsOfFileURL:localizedDescription:error:", v17, v14, &v32);
          v20 = v32;
          if (v19)
          {
            -[NSMutableArray addObject:](self->_stickers, "addObject:", v19);
          }
          else
          {
            objc_msgSend(v17, "lastPathComponent");
            v21 = v5;
            v22 = self;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("Failed to load sticker %@ with error: %@"), v23, v20);

            self = v22;
            v5 = v21;
            v6 = v25;
          }

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v31);
    }

    v4 = v24;
  }

}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  return -[NSMutableArray count](self->_stickers, "count", a3);
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (a4 < 0 || -[NSMutableArray count](self->_stickers, "count") <= (unint64_t)a4)
  {
    NSLog(CFSTR("Warning: sticker index out of bounds. Returning nil for SDK source compatibility, but there's a good chance this will crash."));
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_stickers, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (int64_t)stickerSize
{
  return self->_stickerSize;
}

- (NSMutableArray)stickers
{
  return self->_stickers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickers, 0);
}

- (id)_allStickers
{
  return self->_stickers;
}

@end
