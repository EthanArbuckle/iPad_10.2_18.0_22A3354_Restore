@implementation CLKTreatedImageCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_23);
  return (id)sharedInstance_sharedCache;
}

void __38__CLKTreatedImageCache_sharedInstance__block_invoke()
{
  CLKTreatedImageCache *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(CLKTreatedImageCache);
  v1 = (void *)sharedInstance_sharedCache;
  sharedInstance_sharedCache = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", sharedInstance_sharedCache, sel_purgeCache, CFSTR("CLKClearCacheRequestNotification"), 0);

}

- (void)purgeCache
{
  -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_recentlyUsedKeys, "removeAllObjects");
}

- (CLKTreatedImageCache)init
{
  CLKTreatedImageCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  NSMutableArray *v5;
  NSMutableArray *recentlyUsedKeys;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLKTreatedImageCache;
  v2 = -[CLKTreatedImageCache init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cache = v2->_cache;
    v2->_cache = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    recentlyUsedKeys = v2->_recentlyUsedKeys;
    v2->_recentlyUsedKeys = v5;

    v7 = dispatch_queue_create("com.apple.ClockKit.CLKTreatedImageCache", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (id)imageForRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 maskMode:(int64_t)a6
{
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "size"), v12 > 0.0))
  {
    objc_msgSend(v11, "size");
    v14 = v13;

    if (v14 <= 0.0)
    {
      v16 = 0;
      goto LABEL_7;
    }
    +[CLKTreatedImageKey keyWithRawImage:scale:sdkDeviceScale:maskMode:](CLKTreatedImageKey, "keyWithRawImage:scale:sdkDeviceScale:maskMode:", v11, a6, a4, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTreatedImageCache _imageForKey:](self, "_imageForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
    v15 = v11;
  }

LABEL_7:
  return v16;
}

- (id)imageForRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 cornerRadius:(double)a6
{
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "size"), v12 > 0.0))
  {
    objc_msgSend(v11, "size");
    v14 = v13;

    if (v14 <= 0.0)
    {
      v16 = 0;
      goto LABEL_7;
    }
    +[CLKTreatedImageKey keyWithRawImage:scale:sdkDeviceScale:cornerRadius:](CLKTreatedImageKey, "keyWithRawImage:scale:sdkDeviceScale:cornerRadius:", v11, a4, a5, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTreatedImageCache _imageForKey:](self, "_imageForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
    v15 = v11;
  }

LABEL_7:
  return v16;
}

- (id)imageForRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 maskMode:(int64_t)a6
{
  double height;
  double width;
  double v9;
  double v10;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  v12 = a3;
  v13 = v12;
  if (v12 && (objc_msgSend(v12, "size"), v14 > 0.0))
  {
    objc_msgSend(v13, "size");
    v16 = v15;

    if (v16 <= 0.0)
    {
      v18 = 0;
      goto LABEL_7;
    }
    +[CLKTreatedImageKey keyWithRawImage:maxSDKSize:maxDeviceSize:maskMode:](CLKTreatedImageKey, "keyWithRawImage:maxSDKSize:maxDeviceSize:maskMode:", v13, a6, v10, v9, width, height);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTreatedImageCache _imageForKey:](self, "_imageForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    v17 = v13;
  }

LABEL_7:
  return v18;
}

- (id)imageForRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 cornerRadius:(double)a6
{
  double height;
  double width;
  double v9;
  double v10;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  v12 = a3;
  v13 = v12;
  if (v12 && (objc_msgSend(v12, "size"), v14 > 0.0))
  {
    objc_msgSend(v13, "size");
    v16 = v15;

    if (v16 <= 0.0)
    {
      v18 = 0;
      goto LABEL_7;
    }
    +[CLKTreatedImageKey keyWithRawImage:maxSDKSize:maxDeviceSize:cornerRadius:](CLKTreatedImageKey, "keyWithRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", v13, v10, v9, width, height, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTreatedImageCache _imageForKey:](self, "_imageForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    v17 = v13;
  }

LABEL_7:
  return v18;
}

- (void)_queue_pruneCacheIfNecessary
{
  void *v3;

  if ((unint64_t)-[NSMutableDictionary count](self->_cache, "count") >= 0x1F)
  {
    do
    {
      -[NSMutableArray firstObject](self->_recentlyUsedKeys, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", v3);
        -[NSMutableArray removeObjectAtIndex:](self->_recentlyUsedKeys, "removeObjectAtIndex:", 0);
      }

    }
    while ((unint64_t)-[NSMutableDictionary count](self->_cache, "count") > 0x1E);
  }
}

- (id)_imageForKey:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__CLKTreatedImageCache__imageForKey___block_invoke;
  block[3] = &unk_24CBFB2B0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __37__CLKTreatedImageCache__imageForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  CGFloat v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGSize v61;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v5, "rawImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "size");
    v10 = v9;
    v12 = v11;
    v14 = *MEMORY[0x24BDBF148];
    v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v15 = objc_msgSend(v5, "scaleMode");
    if (v15)
    {
      if (v15 == 1)
      {
        objc_msgSend(v5, "scale");
        if (v16 != 0.0)
        {
          objc_msgSend(v5, "scale");
          objc_msgSend(v5, "sdkDeviceScale");
          CLKFloorForDevice(v8);
          v10 = v17;
          objc_msgSend(v5, "scale");
          objc_msgSend(v5, "sdkDeviceScale");
LABEL_6:
          CLKFloorForDevice(v8);
          v12 = v18;
          v19 = *MEMORY[0x24BDBEFB0];
          v20 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
          v13 = v18;
          v14 = v10;
          goto LABEL_26;
        }
LABEL_24:
        objc_msgSend(v5, "rawImage");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

        v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v45 = *(void **)(v44 + 40);
        *(_QWORD *)(v44 + 40) = v34;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
        goto LABEL_34;
      }
      v19 = *MEMORY[0x24BDBF090];
      v20 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    else
    {
      objc_msgSend(v5, "maxDeviceSize");
      if (v22 == v14 && v21 == v13)
        goto LABEL_24;
      objc_msgSend(v5, "maxSDKSize");
      if (v25 == v14 && v24 == v13)
        goto LABEL_24;
      if (v10 == v14 && v12 == v13)
        goto LABEL_24;
      objc_msgSend(v5, "maxSDKSize");
      v29 = v28 / v10;
      v31 = v30 / v12;
      if (v29 >= v31)
        v32 = v31;
      else
        v32 = v29;
      if (v32 < 1.0)
      {
        CLKFloorForDevice(v8);
        v10 = v33;
        goto LABEL_6;
      }
      objc_msgSend(v5, "maxDeviceSize");
      v48 = v47;
      v50 = v49;
      objc_msgSend(v5, "maxSDKSize");
      if (!CLKSizeEqualsSize(v48, v50, v51, v52))
      {
        objc_msgSend(v5, "maxDeviceSize");
        v54 = v53;
        objc_msgSend(v5, "maxSDKSize");
        v10 = v10 * (v54 / v55);
        objc_msgSend(v5, "maxDeviceSize");
        v57 = v56;
        objc_msgSend(v5, "maxSDKSize");
        v12 = v12 * (v57 / v58);
      }
      objc_msgSend(v5, "maxDeviceSize");
      v14 = v59;
      v13 = v60;
      v19 = (v59 - v10) * 0.5;
      v20 = (v60 - v12) * 0.5;
    }
LABEL_26:
    objc_msgSend(v8, "screenScale");
    v36 = v35;
    v61.width = v14;
    v61.height = v13;
    UIGraphicsBeginImageContextWithOptions(v61, 0, v36);
    v37 = objc_msgSend(v5, "maskMode");
    if (v37 == 2)
    {
      v39 = (void *)MEMORY[0x24BEBD420];
      objc_msgSend(v5, "cornerRadius");
      objc_msgSend(v39, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v14, v13, v40);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v37 != 1)
        goto LABEL_31;
      objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", 0.0, 0.0, v14, v13);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = v38;
    objc_msgSend(v38, "addClip");

LABEL_31:
    objc_msgSend(v6, "drawInRect:", v19, v20, v10, v12);
    UIGraphicsGetImageFromCurrentImageContext();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v42 = objc_msgSend(v34, "renderingMode");
    if (v42 != objc_msgSend(v6, "renderingMode"))
    {
      objc_msgSend(v34, "imageWithRenderingMode:", objc_msgSend(v6, "renderingMode"));
      v43 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v43;
    }
    goto LABEL_33;
  }
LABEL_34:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pruneCacheIfNecessary");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_recentlyUsedKeys, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
