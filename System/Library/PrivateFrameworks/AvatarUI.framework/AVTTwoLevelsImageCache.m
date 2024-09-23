@implementation AVTTwoLevelsImageCache

- (AVTImageCache)firstLevelCache
{
  return self->_firstLevelCache;
}

- (id)imageForItem:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[AVTTwoLevelsImageCache firstLevelCache](self, "firstLevelCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageForItem:scope:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AVTImageCache)secondLevelCache
{
  return self->_secondLevelCache;
}

- (AVTTwoLevelsImageCache)initWithFirstLevelCache:(id)a3 secondLevelCache:(id)a4 environment:(id)a5
{
  id v8;
  id v9;
  AVTTwoLevelsImageCache *v10;
  AVTTwoLevelsImageCache *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVTTwoLevelsImageCache;
  v10 = -[AVTTwoLevelsImageCache init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_firstLevelCache, a3);
    objc_storeStrong((id *)&v11->_secondLevelCache, a4);
  }

  return v11;
}

- (id)imageForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[AVTTwoLevelsImageCache firstLevelCache](self, "firstLevelCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__AVTTwoLevelsImageCache_imageForItem_scope_cacheMissHandler___block_invoke;
  v16[3] = &unk_1EA51F1E0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "imageForItem:scope:cacheMissHandler:", v13, v10, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __62__AVTTwoLevelsImageCache_imageForItem_scope_cacheMissHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)a1[4];
  v5 = a3;
  objc_msgSend(v4, "secondLevelCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForItem:scope:cacheMissHandler:", a1[5], v5, a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[AVTTwoLevelsImageCache firstLevelCache](self, "firstLevelCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "resourceExistsInCacheForItem:scope:", v6, v7) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    -[AVTTwoLevelsImageCache secondLevelCache](self, "secondLevelCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "resourceExistsInCacheForItem:scope:", v6, v7);

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondLevelCache, 0);
  objc_storeStrong((id *)&self->_firstLevelCache, 0);
}

@end
