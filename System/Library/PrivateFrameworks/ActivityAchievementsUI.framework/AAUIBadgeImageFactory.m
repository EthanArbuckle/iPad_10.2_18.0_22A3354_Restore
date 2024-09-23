@implementation AAUIBadgeImageFactory

- (id)thumbnailImageForAchievement:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  height = a4.height;
  width = a4.width;
  v13 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIBadgeImageFactory thumbnailImageForAchievements:size:alignment:stackType:](self, "thumbnailImageForAchievements:size:alignment:stackType:", v9, 0, 0, width, height, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)hasCachedThumbnailImageForAchievement:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  id v11;
  uint64_t v12;

  height = a4.height;
  width = a4.width;
  v12 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[AAUIBadgeImageFactory hasCachedThumbnailImageForAchievements:size:alignment:stackType:](self, "hasCachedThumbnailImageForAchievements:size:alignment:stackType:", v9, 0, 0, width, height, v11, v12);
  return (char)self;
}

- (AAUIBadgeImageFactory)init
{
  AAUIBadgeImageFactory *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  AAUIAchievementResourceProvider *v5;
  AAUIAchievementResourceProvider *resourceProvider;
  uint64_t v7;
  OS_dispatch_queue *imageCreationQueue;
  AAUIBadgeView *v9;
  AAUIBadgeView *unearnedBadgeView;
  AAUIBadgeView *v11;
  AAUIBadgeView *earnedBadgeView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AAUIBadgeImageFactory;
  v2 = -[AAUIBadgeImageFactory init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cache = v2->_cache;
    v2->_cache = v3;

    v5 = objc_alloc_init(AAUIAchievementResourceProvider);
    resourceProvider = v2->_resourceProvider;
    v2->_resourceProvider = v5;

    HKCreateSerialDispatchQueueWithQOSClass();
    v7 = objc_claimAutoreleasedReturnValue();
    imageCreationQueue = v2->_imageCreationQueue;
    v2->_imageCreationQueue = (OS_dispatch_queue *)v7;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    v9 = -[AAUIBadgeView initUsingEarnedShader:]([AAUIBadgeView alloc], "initUsingEarnedShader:", 0);
    unearnedBadgeView = v2->_unearnedBadgeView;
    v2->_unearnedBadgeView = v9;

    v11 = -[AAUIBadgeView initUsingEarnedShader:]([AAUIBadgeView alloc], "initUsingEarnedShader:", 1);
    earnedBadgeView = v2->_earnedBadgeView;
    v2->_earnedBadgeView = v11;

  }
  return v2;
}

void __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  id v19;

  v19 = a2;
  v7 = (void *)MEMORY[0x22078928C]();
  objc_msgSend(*(id *)(a1 + 32), "badgeConfigurationForAchievement:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_queue_generateImageForConfiguration:size:stackType:isRTL:unearned:", v8, *(unsigned int *)(a1 + 112), *(unsigned __int8 *)(a1 + 116), objc_msgSend(v19, "unearned"), *(double *)(a1 + 80), *(double *)(a1 + 80));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (*(_BYTE *)(a1 + 117))
    {
      objc_msgSend(v9, "size");
      v12 = v11 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56);
      objc_msgSend(v10, "size");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) = v12 / v13;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(double *)(v14 + 32);
      if (*(_BYTE *)(a1 + 116))
      {
        if (v15 >= *(double *)(a1 + 72) - *(double *)(v14 + 48))
          v15 = *(double *)(a1 + 72) - *(double *)(v14 + 48);
      }
      else
      {
        v15 = fmax(v15 - *(double *)(v14 + 48), 0.0);
      }
      *(double *)(v14 + 32) = v15;
    }
    objc_msgSend(v10, "drawInRect:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
    if (*(_BYTE *)(a1 + 117) && objc_msgSend(*(id *)(a1 + 48), "count") - 1 > a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "_makeGradientImage:solidGradient:gradient:isRTL:", v10, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(unsigned __int8 *)(a1 + 116));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "drawInRect:blendMode:alpha:", 22, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56), 1.0);

    }
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(a1 + 116))
      v18 = *(double *)(a1 + 104) + *(double *)(v17 + 32);
    else
      v18 = *(double *)(v17 + 32) + *(double *)(v17 + 48) - *(double *)(a1 + 104);
    *(double *)(v17 + 32) = v18;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *a4 = 1;
  }

  objc_autoreleasePoolPop(v7);
}

- (id)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  double height;
  double width;
  id v11;
  void *v12;
  os_unfair_lock_s *p_cacheLock;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  if (objc_msgSend(v11, "count"))
  {
    AAUIAchievementBadgeCacheKey(v11, v7, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    -[AAUIBadgeImageFactory cache](self, "cache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_cacheLock);
    if (v15)
    {
      v16 = v15;
    }
    else
    {
      -[AAUIBadgeImageFactory _availableAchievementsForStackType:andAchievements:](self, "_availableAchievementsForStackType:andAchievements:", v6, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      if (objc_msgSend(v17, "count"))
      {
        if (!(_DWORD)v6)
        {
          width = width + -10.0;
          height = height + -10.0;
        }
        if (width > 0.0 && height > 0.0)
        {
          -[AAUIBadgeImageFactory _queue_thumbnailImageForAchievements:size:alignment:stackType:](self, "_queue_thumbnailImageForAchievements:size:alignment:stackType:", v17, v7, v6, width, height);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            os_unfair_lock_lock(&self->_cacheLock);
            -[AAUIBadgeImageFactory cache](self, "cache");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKey:", v16, v12);

            os_unfair_lock_unlock(p_cacheLock);
          }
          else
          {
            ACHLogDefault();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[AAUIBadgeImageFactory thumbnailImageForAchievements:size:alignment:stackType:].cold.1(v11, v19, width, height);

          }
        }
      }

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)hasCachedThumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6
{
  void *v7;
  os_unfair_lock_s *p_cacheLock;
  void *v9;
  void *v10;

  AAUIAchievementBadgeCacheKey(a3, *(uint64_t *)&a5, *(uint64_t *)&a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[AAUIBadgeImageFactory cache](self, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cacheLock);
  return v10 != 0;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (id)_queue_thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  CGFloat v18;
  CGFloat v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  -[AAUIBadgeImageFactory imageCreationQueue](self, "imageCreationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke;
  v15[3] = &unk_24E0B2B00;
  v20 = a6;
  v18 = width;
  v19 = height;
  v15[4] = self;
  v16 = v10;
  v17 = &v21;
  v12 = v10;
  dispatch_sync(v11, v15);

  v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)_queue_generateImageForConfiguration:(id)a3 size:(CGSize)a4 stackType:(int)a5 isRTL:(BOOL)a6 unearned:(BOOL)a7
{
  _BOOL4 v8;
  double height;
  double width;
  id v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a6;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  -[AAUIBadgeImageFactory imageCreationQueue](self, "imageCreationQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = width * 1.4;
  v16 = height * 1.4;
  v17 = *MEMORY[0x24BDBF090];
  v18 = *(double *)(MEMORY[0x24BDBF090] + 8);
  if (a7)
    -[AAUIBadgeImageFactory unearnedBadgeView](self, "unearnedBadgeView");
  else
    -[AAUIBadgeImageFactory earnedBadgeView](self, "earnedBadgeView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConfiguration:", v13);

  objc_msgSend(v19, "setFrame:", v17, v18, v15, v16);
  objc_msgSend(v19, "resizeBadgeForCurrentViewSize");
  objc_msgSend(v19, "snapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cleanupAfterSnapshot");
  if (a5)
  {
    if (v8)
      v21 = 13;
    else
      v21 = 14;
    -[AAUIBadgeImageFactory _perfectCropForImage:andDirections:](self, "_perfectCropForImage:andDirections:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v22;
  }

  return v20;
}

- (OS_dispatch_queue)imageCreationQueue
{
  return self->_imageCreationQueue;
}

- (AAUIBadgeView)unearnedBadgeView
{
  return self->_unearnedBadgeView;
}

- (id)_availableAchievementsForStackType:(int)a3 andAchievements:(id)a4
{
  void *v4;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "hk_filter:", &__block_literal_global);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_13;
  }
  if ((a3 - 2) < 2)
  {
    v8 = objc_msgSend(v6, "count");
    v9 = v8 >= 3;
    v10 = 3;
  }
  else
  {
    if (a3 != 1)
    {
      if (!a3)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_13;
    }
    v8 = objc_msgSend(v6, "count");
    v9 = v8 >= 5;
    v10 = 5;
  }
  if (v9)
    v11 = v10;
  else
    v11 = v8;
  objc_msgSend(v6, "subarrayWithRange:", 0, v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v4;
}

void __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke(uint64_t a1)
{
  uint64_t IsRightToLeft;
  unsigned int v3;
  double v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGGradient *v14;
  CGGradient *v15;
  void *v16;
  CGContext *CurrentContext;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *, unint64_t, _BYTE *);
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  _QWORD *v42;
  uint64_t *v43;
  __int128 v44;
  CGGradient *v45;
  CGGradient *v46;
  double v47;
  int v48;
  char v49;
  BOOL v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _QWORD v55[4];
  __int128 v56;
  __int128 v57;

  IsRightToLeft = FIUILocaleIsRightToLeft();
  v3 = *(_DWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "_stackBadgeOverlapForStackType:", v3);
  v4 = *(double *)(a1 + 64);
  v5 = (double *)(a1 + 56);
  v7 = v4 * (1.0 - v6);
  v8 = -(*(double *)(a1 + 56) - v4 * (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "count"));
  v9 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v7 >= v4 - v8 / (double)(unint64_t)(v9 - 1))
    v7 = v4 - v8 / (double)(unint64_t)(v9 - 1);
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x4010000000;
  v55[3] = "";
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_initialFrameForSize:isRTL:isStack:", IsRightToLeft, v3 != 0, *v5, *(double *)(a1 + 64));
  *(_QWORD *)&v56 = v10;
  *((_QWORD *)&v56 + 1) = v11;
  *(_QWORD *)&v57 = v12;
  *((_QWORD *)&v57 + 1) = v13;
  if (v3)
  {
    v14 = (CGGradient *)objc_msgSend(*(id *)(a1 + 32), "_makeShadowGradient");
    v15 = (CGGradient *)objc_msgSend(*(id *)(a1 + 32), "_makeShadowSolidGradient");
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "resourceProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)(a1 + 56), 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  objc_msgSend(*(id *)(a1 + 40), "hk_reversed");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = MEMORY[0x24BDAC760];
  v36 = 3221225472;
  v37 = __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke_2;
  v38 = &unk_24E0B2AD8;
  v19 = v16;
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(a1 + 40);
  v39 = v19;
  v40 = v20;
  v44 = *(_OWORD *)v5;
  v48 = *(_DWORD *)(a1 + 72);
  v49 = IsRightToLeft;
  v50 = v3 != 0;
  v42 = v55;
  v45 = v15;
  v46 = v14;
  v47 = v7;
  v41 = v21;
  v43 = &v51;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", &v35);

  if (*((_BYTE *)v52 + 24))
  {
    ACHLogDefault();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_11;
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v30;

  UIGraphicsEndImageContext();
  CGGradientRelease(v14);
  CGGradientRelease(v15);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_perfectCropForImage:andDirections:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 3, v35, v36, v37, v38, v39, v40);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(NSObject **)(v34 + 40);
    *(_QWORD *)(v34 + 40) = v33;
LABEL_11:

  }
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(v55, 8);
}

- (AAUIAchievementResourceProvider)resourceProvider
{
  return self->_resourceProvider;
}

- (double)_stackBadgeOverlapForStackType:(int)a3
{
  double result;

  result = 0.0;
  if ((a3 - 1) <= 2)
    return dbl_21CC41D78[a3 - 1];
  return result;
}

- (CGRect)_initialFrameForSize:(CGSize)a3 isRTL:(BOOL)a4 isStack:(BOOL)a5
{
  double height;
  double v6;
  double v7;
  CGRect result;

  height = a3.height;
  v6 = 0.0;
  if (!a5 || a4)
    a3.width = 0.0;
  v7 = height;
  result.origin.x = a3.width;
  result.size.height = v7;
  result.size.width = height;
  result.origin.y = v6;
  return result;
}

BOOL __76__AAUIBadgeImageFactory__availableAchievementsForStackType_andAchievements___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "badgeShapeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    ACHLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __76__AAUIBadgeImageFactory__availableAchievementsForStackType_andAchievements___block_invoke_cold_1(v2, v4);

  }
  return v3 != 0;
}

- (id)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5
{
  return -[AAUIBadgeImageFactory thumbnailImageForAchievements:size:alignment:stackType:](self, "thumbnailImageForAchievements:size:alignment:stackType:", a3, *(_QWORD *)&a5, 3, a4.width, a4.height);
}

- (void)thumbnailImageForAchievement:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  height = a4.height;
  width = a4.width;
  v14 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIBadgeImageFactory thumbnailImageForAchievements:size:alignment:stackType:completion:](self, "thumbnailImageForAchievements:size:alignment:stackType:completion:", v12, 0, 0, v10, width, height, v13, v14);
}

- (void)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 completion:(id)a6
{
  -[AAUIBadgeImageFactory thumbnailImageForAchievements:size:alignment:stackType:completion:](self, "thumbnailImageForAchievements:size:alignment:stackType:completion:", a3, *(_QWORD *)&a5, 3, a6, a4.width, a4.height);
}

- (void)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6 completion:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  int v21;
  int v22;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (v14)
  {
    dispatch_get_global_queue(21, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __91__AAUIBadgeImageFactory_thumbnailImageForAchievements_size_alignment_stackType_completion___block_invoke;
    v16[3] = &unk_24E0B2AB0;
    v16[4] = self;
    v17 = v13;
    v19 = width;
    v20 = height;
    v21 = a5;
    v22 = a6;
    v18 = v14;
    dispatch_async(v15, v16);

  }
}

void __91__AAUIBadgeImageFactory_thumbnailImageForAchievements_size_alignment_stackType_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailImageForAchievements:size:alignment:stackType:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 72), *(unsigned int *)(a1 + 76), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)hasCachedThumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5
{
  return -[AAUIBadgeImageFactory hasCachedThumbnailImageForAchievements:size:alignment:stackType:](self, "hasCachedThumbnailImageForAchievements:size:alignment:stackType:", a3, *(_QWORD *)&a5, 3, a4.width, a4.height);
}

- (void)clearAllCachedImages
{
  os_unfair_lock_s *p_cacheLock;
  void *v4;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[AAUIBadgeImageFactory cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)_makeGradientImage:(id)a3 solidGradient:(CGGradient *)a4 gradient:(CGGradient *)a5 isRTL:(BOOL)a6
{
  _BOOL4 v6;
  double width;
  double height;
  CGContext *CurrentContext;
  CGContext *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGSize v19;
  CGPoint v20;
  CGPoint v21;
  CGPoint v22;

  v6 = a6;
  objc_msgSend(a3, "size");
  width = v19.width;
  height = v19.height;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v12 = CurrentContext;
  if (v6)
    v13 = 0.0;
  else
    v13 = width;
  if (v6)
    v14 = width - width * 0.25;
  else
    v14 = width * 0.25;
  if (v6)
    v15 = width;
  else
    v15 = 0.0;
  v16 = height * 0.5;
  v21.x = v14;
  v21.y = height * 0.5;
  CGContextDrawLinearGradient(CurrentContext, a4, *(CGPoint *)&v15, v21, 3u);
  v20.x = v14;
  v20.y = height * 0.5;
  v22.x = v13;
  v22.y = height * 0.5;
  CGContextDrawLinearGradient(v12, a5, v20, v22, 3u);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v17;
}

- (CGGradient)_makeShadowSolidGradient
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  const __CFArray *v6;
  CGColorSpace *DeviceRGB;
  CGGradient *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_retainAutorelease(v3);
  v10[0] = objc_msgSend(v4, "CGColor");
  v5 = objc_retainAutorelease(v4);
  v10[1] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = CGGradientCreateWithColors(DeviceRGB, v6, 0);
  CGColorSpaceRelease(DeviceRGB);

  return v8;
}

- (CGGradient)_makeShadowGradient
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  const __CFArray *v7;
  CGColorSpace *DeviceRGB;
  CGGradient *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v11[0] = objc_msgSend(v5, "CGColor");
  v6 = objc_retainAutorelease(v4);
  v11[1] = objc_msgSend(v6, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGGradientCreateWithColors(DeviceRGB, v7, 0);
  CGColorSpaceRelease(DeviceRGB);

  return v9;
}

- (id)_perfectCropForImage:(id)a3 andDirections:(unint64_t)a4
{
  char v4;
  id v5;
  CGImage *v6;
  uint64_t Width;
  uint64_t Height;
  uint64_t v9;
  CGColorSpace *ColorSpace;
  CGContext *v11;
  CGContext *v12;
  _BYTE *Data;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 *v24;
  int v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  uint64_t v30;
  unsigned __int8 *v31;
  int v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  int v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGContext *CurrentContext;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  CGRect v56;

  v4 = a4;
  v5 = objc_retainAutorelease(a3);
  v6 = (CGImage *)objc_msgSend(v5, "CGImage");
  Width = CGImageGetWidth(v6);
  Height = CGImageGetHeight(v6);
  v9 = 4 * Width;
  ColorSpace = CGImageGetColorSpace(v6);
  v11 = CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * Width, ColorSpace, 1u);
  if (v11)
  {
    v12 = v11;
    v56.origin.x = 0.0;
    v56.origin.y = 0.0;
    v56.size.width = (double)Width;
    v56.size.height = (double)Height;
    CGContextDrawImage(v11, v56, v6);
    Data = CGBitmapContextGetData(v12);
    v14 = 0;
    if ((v4 & 1) != 0 && Width >= 1)
    {
      v14 = 0;
      v15 = 0;
      v16 = (uint64_t)&Data[4 * Width + 3];
      do
      {
        if (Height >= 1)
        {
          if (Data[4 * v15 + 3])
            break;
          v14 = v15 - 1;
          v17 = Height;
          v18 = (unsigned __int8 *)v16;
          while (--v17)
          {
            v19 = *v18;
            v18 += v9;
            if (v19)
              goto LABEL_12;
          }
        }
        ++v15;
        v16 += 4;
      }
      while (v15 != Width);
    }
LABEL_12:
    v20 = 0;
    if ((v4 & 2) != 0 && Width >= 1)
    {
      v20 = 0;
      v21 = (uint64_t)&Data[8 * Width - 1];
      v22 = Width;
      do
      {
        if (Height >= 1)
        {
          if (Data[4 * v22 - 1])
            break;
          v20 = Width - v22;
          v23 = Height;
          v24 = (unsigned __int8 *)v21;
          while (--v23)
          {
            v25 = *v24;
            v24 += v9;
            if (v25)
              goto LABEL_23;
          }
        }
        v21 -= 4;
        v26 = v22-- <= 1;
      }
      while (!v26);
    }
LABEL_23:
    v27 = 0;
    if ((v4 & 4) != 0 && Height >= 1)
    {
      v27 = 0;
      v28 = 0;
      v29 = Data + 7;
      do
      {
        if (Width >= 1)
        {
          if (Data[4 * v28 * Width + 3])
            break;
          v30 = Width;
          v31 = v29;
          while (--v30)
          {
            v32 = *v31;
            v31 += 4;
            if (v32)
            {
              v27 = v28;
              goto LABEL_36;
            }
          }
          v27 = v28;
        }
        ++v28;
        v29 += v9;
      }
      while (v28 != Height);
    }
LABEL_36:
    if ((v4 & 8) != 0)
    {
      v34 = 0;
      if (Height >= 1)
      {
        v34 = 0;
        v35 = (uint64_t)&Data[4 * Width * (Height - 1) + 7];
        v36 = Height;
        do
        {
          v37 = v36 - 1;
          if (Width >= 1)
          {
            if (Data[4 * v37 * Width + 3])
              break;
            v34 = Height - v37;
            v38 = Width;
            v39 = (unsigned __int8 *)v35;
            while (--v38)
            {
              v40 = *v39;
              v39 += 4;
              if (v40)
                goto LABEL_49;
            }
          }
          v35 -= 4 * Width;
          v26 = v36-- <= 1;
        }
        while (!v26);
      }
    }
    else
    {
      v34 = 0;
    }
LABEL_49:
    CGContextRelease(v12);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "scale");
    v43 = v42;

    v44 = (double)(Width - (v14 + v20)) / v43;
    if (v44 <= 0.0 || (v45 = (double)(Height - (v27 + v34)) / v43, v45 <= 0.0))
    {
      ACHLogDefault();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[AAUIBadgeImageFactory _perfectCropForImage:andDirections:].cold.1(v47, v48, v49, v50, v51, v52, v53, v54);

      v33 = 0;
    }
    else
    {
      UIGraphicsBeginImageContextWithOptions(*(CGSize *)&v44, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
      objc_msgSend(v5, "drawInRect:", (double)-v14 / v43, (double)-v27 / v43, (double)Width / v43, (double)Height / v43);
      UIGraphicsGetImageFromCurrentImageContext();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    v33 = v5;
  }

  return v33;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setResourceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_resourceProvider, a3);
}

- (AAUIBadgeView)earnedBadgeView
{
  return self->_earnedBadgeView;
}

- (void)setEarnedBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_earnedBadgeView, a3);
}

- (void)setUnearnedBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_unearnedBadgeView, a3);
}

- (void)setImageCreationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageCreationQueue, a3);
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setCacheLock:(os_unfair_lock_s)a3
{
  self->_cacheLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCreationQueue, 0);
  objc_storeStrong((id *)&self->_unearnedBadgeView, 0);
  objc_storeStrong((id *)&self->_earnedBadgeView, 0);
  objc_storeStrong((id *)&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)thumbnailImageForAchievements:(void *)a1 size:(NSObject *)a2 alignment:(CGFloat)a3 stackType:(CGFloat)a4 .cold.1(void *a1, NSObject *a2, CGFloat a3, CGFloat a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  CGSize v16;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "template");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16.width = a3;
  v16.height = a4;
  NSStringFromCGSize(v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138543618;
  v12 = v9;
  v13 = 2114;
  v14 = v10;
  _os_log_error_impl(&dword_21CC08000, a2, OS_LOG_TYPE_ERROR, "[BadgeImageFactory] Got nil image generating thumbnail for achievement %{public}@, size %{public}@", (uint8_t *)&v11, 0x16u);

}

void __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21CC08000, a1, a3, "[BadgeImageFactory] Encountered error when generating thumbnail, returning nil...", a5, a6, a7, a8, 0);
}

void __76__AAUIBadgeImageFactory__availableAchievementsForStackType_andAchievements___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_21CC08000, a2, OS_LOG_TYPE_FAULT, "[BadgeImageFactory] Got nil badgeShapeName for achievement %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)_perfectCropForImage:(uint64_t)a3 andDirections:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21CC08000, a1, a3, "[BadgeImageFactory] Perfect Crop generated invalid final size, are we in foreground? Returning nil...", a5, a6, a7, a8, 0);
}

@end
