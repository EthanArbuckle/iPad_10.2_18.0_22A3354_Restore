@implementation ICAttachmentThumbnailPostProcessingOperation

- (ICAttachmentThumbnailPostProcessingOperation)initWithSize:(CGSize)a3 scale:(double)a4 appearanceInfo:(id)a5 cache:(id)a6 cacheKey:(id)a7 processingBlock:(id)a8 completionBlocks:(id)a9 fallbackBlock:(id)a10
{
  double height;
  double width;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ICAttachmentThumbnailPostProcessingOperation *v25;
  ICAttachmentThumbnailPostProcessingOperation *v26;
  void *v27;
  objc_super v29;

  height = a3.height;
  width = a3.width;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v29.receiver = self;
  v29.super_class = (Class)ICAttachmentThumbnailPostProcessingOperation;
  v25 = -[ICAttachmentThumbnailPostProcessingOperation init](&v29, sel_init);
  v26 = v25;
  if (v25)
  {
    -[ICAttachmentThumbnailPostProcessingOperation setMinSize:](v25, "setMinSize:", width, height);
    -[ICAttachmentThumbnailPostProcessingOperation setScale:](v26, "setScale:", a4);
    -[ICAttachmentThumbnailPostProcessingOperation setAppearanceInfo:](v26, "setAppearanceInfo:", v19);
    -[ICAttachmentThumbnailPostProcessingOperation setCache:](v26, "setCache:", v20);
    -[ICAttachmentThumbnailPostProcessingOperation setCacheKey:](v26, "setCacheKey:", v21);
    -[ICAttachmentThumbnailPostProcessingOperation setFallbackBlock:](v26, "setFallbackBlock:", v24);
    -[ICAttachmentThumbnailPostProcessingOperation setProcessingBlock:](v26, "setProcessingBlock:", v22);
    v27 = (void *)objc_msgSend(v23, "mutableCopy");
    -[ICAttachmentThumbnailPostProcessingOperation setCompletionBlocks:](v26, "setCompletionBlocks:", v27);

  }
  return v26;
}

- (BOOL)isMatchingOperationForCacheKey:(id)a3 cache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = a3;
  -[ICAttachmentThumbnailPostProcessingOperation cacheKey](self, "cacheKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[ICAttachmentThumbnailPostProcessingOperation cache](self, "cache");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10 == v6;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addCompletionBlock:(id)a3
{
  id v3;
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  v3 = v4;
  performBlockOnMainThreadAndWait();

}

void __67__ICAttachmentThumbnailPostProcessingOperation_addCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v3, "addObject:", v2);

}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD);
  _QWORD v13[4];
  id v14;
  ICAttachmentThumbnailPostProcessingOperation *v15;

  -[ICAttachmentThumbnailPostProcessingOperation image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    -[ICAttachmentThumbnailPostProcessingOperation mediaURL](self, "mediaURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentThumbnailPostProcessingOperation minSize](self, "minSize");
    objc_msgSend(v4, "ic_fileIconForURL:withPreferredSize:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[ICAttachmentThumbnailPostProcessingOperation setShowAsFileIcon:](self, "setShowAsFileIcon:", 1);
    }
    else
    {
      -[ICAttachmentThumbnailPostProcessingOperation fallbackBlock](self, "fallbackBlock");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
        goto LABEL_6;
      -[ICAttachmentThumbnailPostProcessingOperation fallbackBlock](self, "fallbackBlock");
      v12 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      -[ICAttachmentThumbnailPostProcessingOperation scale](self, "scale");
      v12[2](v12);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
        goto LABEL_6;
    }
  }
  -[ICAttachmentThumbnailPostProcessingOperation processingBlock](self, "processingBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICAttachmentThumbnailPostProcessingOperation processingBlock](self, "processingBlock");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, unint64_t, BOOL, BOOL))v7)[2](v7, v3, -[ICAttachmentThumbnailPostProcessingOperation imageScaling](self, "imageScaling"), -[ICAttachmentThumbnailPostProcessingOperation showAsFileIcon](self, "showAsFileIcon"), -[ICAttachmentThumbnailPostProcessingOperation isMovie](self, "isMovie"));
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
LABEL_6:
  objc_msgSend(v3, "ic_decodeInBackground");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63CE8]), "initWithImage:imageScaling:showAsFileIcon:isMovie:", v9, -[ICAttachmentThumbnailPostProcessingOperation imageScaling](self, "imageScaling"), -[ICAttachmentThumbnailPostProcessingOperation showAsFileIcon](self, "showAsFileIcon"), -[ICAttachmentThumbnailPostProcessingOperation isMovie](self, "isMovie"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__ICAttachmentThumbnailPostProcessingOperation_main__block_invoke;
  v13[3] = &unk_1E5C1D9A8;
  v14 = v10;
  v15 = self;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __52__ICAttachmentThumbnailPostProcessingOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "cache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "cacheKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setThumbnailData:forKey:", v4, v5);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "completionBlocks", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v12, objc_msgSend(*(id *)(a1 + 32), "imageScaling"), objc_msgSend(*(id *)(a1 + 32), "showAsFileIcon"), objc_msgSend(*(id *)(a1 + 32), "isMovie"));

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGSize)minSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minSize.width;
  height = self->_minSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinSize:(CGSize)a3
{
  self->_minSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (ICAppearanceInfo)appearanceInfo
{
  return self->_appearanceInfo;
}

- (void)setAppearanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceInfo, a3);
}

- (ICThumbnailDataCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (void)setFallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)processingBlock
{
  return self->_processingBlock;
}

- (void)setProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocks, a3);
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (void)setMediaURL:(id)a3
{
  objc_storeStrong((id *)&self->_mediaURL, a3);
}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (void)setImageScaling:(unint64_t)a3
{
  self->_imageScaling = a3;
}

- (BOOL)showAsFileIcon
{
  return self->_showAsFileIcon;
}

- (void)setShowAsFileIcon:(BOOL)a3
{
  self->_showAsFileIcon = a3;
}

- (BOOL)isMovie
{
  return self->_isMovie;
}

- (void)setIsMovie:(BOOL)a3
{
  self->_isMovie = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong(&self->_processingBlock, 0);
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
