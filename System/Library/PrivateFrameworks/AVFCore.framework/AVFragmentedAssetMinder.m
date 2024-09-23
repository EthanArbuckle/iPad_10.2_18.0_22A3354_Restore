@implementation AVFragmentedAssetMinder

+ (AVFragmentedAssetMinder)fragmentedAssetMinderWithAsset:(AVAsset *)asset mindingInterval:(NSTimeInterval)mindingInterval
{
  return (AVFragmentedAssetMinder *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAsset:mindingInterval:", asset, mindingInterval);
}

- (AVFragmentedAssetMinder)init
{
  AVFragmentedAssetMinder *v2;
  AVFragmentedAssetMinderInternal *v3;
  NSObject *v4;
  AVFragmentedAssetMinderInternal *fragmentedAssetMinder;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVFragmentedAssetMinder;
  v2 = -[AVFragmentedAssetMinder init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVFragmentedAssetMinderInternal);
    v2->_fragmentedAssetMinder = v3;
    if (!v3
      || (v2->_fragmentedAssetMinder->assets = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]),
          v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
          v2->_fragmentedAssetMinder->accessSerializer = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avfragmentedassetminder", v4), v2->_fragmentedAssetMinder->mindingInterval = 10.0, fragmentedAssetMinder = v2->_fragmentedAssetMinder, !fragmentedAssetMinder->assets)|| fragmentedAssetMinder->mindingInterval == 0.0)
    {

      return 0;
    }
  }
  return v2;
}

- (AVFragmentedAssetMinder)initWithAsset:(AVAsset *)asset mindingInterval:(NSTimeInterval)mindingInterval
{
  AVFragmentedAssetMinder *v6;
  AVFragmentedAssetMinder *v7;

  v6 = -[AVFragmentedAssetMinder init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[AVFragmentedAssetMinder setMindingInterval:](v6, "setMindingInterval:", mindingInterval);
    -[AVFragmentedAssetMinder addFragmentedAsset:](v7, "addFragmentedAsset:", asset);
  }
  return v7;
}

- (void)dealloc
{
  AVFragmentedAssetMinderInternal *fragmentedAssetMinder;
  NSObject *accessSerializer;
  objc_super v5;

  -[AVFragmentedAssetMinder _setMindingInterval:removeAllAssets:](self, "_setMindingInterval:removeAllAssets:", 1, 0.0);
  fragmentedAssetMinder = self->_fragmentedAssetMinder;
  if (fragmentedAssetMinder)
  {

    fragmentedAssetMinder = self->_fragmentedAssetMinder;
    accessSerializer = fragmentedAssetMinder->accessSerializer;
    if (accessSerializer)
    {
      dispatch_release(accessSerializer);
      fragmentedAssetMinder = self->_fragmentedAssetMinder;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVFragmentedAssetMinder;
  -[AVFragmentedAssetMinder dealloc](&v5, sel_dealloc);
}

- (BOOL)_throwsWhenAlreadyMindedAssetIsAdded
{
  return 1;
}

- (NSArray)assets
{
  NSObject *accessSerializer;
  NSArray *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  accessSerializer = self->_fragmentedAssetMinder->accessSerializer;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVFragmentedAssetMinder_assets__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerializer, v5);
  v3 = (NSArray *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__AVFragmentedAssetMinder_assets__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "allObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSTimeInterval)mindingInterval
{
  return self->_fragmentedAssetMinder->mindingInterval;
}

- (void)setMindingInterval:(NSTimeInterval)mindingInterval
{
  -[AVFragmentedAssetMinder _setMindingInterval:removeAllAssets:](self, "_setMindingInterval:removeAllAssets:", 0, mindingInterval);
}

- (void)_setMindingInterval:(double)a3 removeAllAssets:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  AVFragmentedAssetMinderInternal *fragmentedAssetMinder;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0.0)
    v6 = a3;
  else
    v6 = 0.0;
  if (v6 > 0.0 && v6 < 0.001)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v25 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("An %@ cannot mind fragmented assets more frequently than once per millisecond (requested interval was %f)"), v20, v21, v22, v23, v24, (uint64_t)v19), 0);
    objc_exception_throw(v25);
  }
  fragmentedAssetMinder = self->_fragmentedAssetMinder;
  if (v6 != fragmentedAssetMinder->mindingInterval || a4)
  {
    fragmentedAssetMinder->mindingInterval = v6;
    v9 = -[AVFragmentedAssetMinder assets](self, "assets");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v14, "_setFragmentMindingInterval:", v6);
          if (v4)
            objc_msgSend(v14, "_setIsAssociatedWithFragmentMinder:", 0);
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }
  }
}

- (void)addFragmentedAsset:(AVAsset *)asset
{
  int v6;
  NSObject *accessSerializer;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD block[7];
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (!-[AVAsset _mindsFragments](asset, "_mindsFragments"))
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("An %@ cannot mind instances of %@"), v14, v15, v16, v17, v18, (uint64_t)v12);
    goto LABEL_10;
  }
  v6 = -[AVAsset isAssociatedWithFragmentMinder](asset, "isAssociatedWithFragmentMinder");
  accessSerializer = self->_fragmentedAssetMinder->accessSerializer;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVFragmentedAssetMinder_addFragmentedAsset___block_invoke;
  block[3] = &unk_1E3031A90;
  block[5] = asset;
  block[6] = &v30;
  block[4] = self;
  v29 = v6;
  dispatch_sync(accessSerializer, block);
  if (v6)
  {
    if (!*((_BYTE *)v31 + 24))
    {
      if (!-[AVFragmentedAssetMinder _throwsWhenAlreadyMindedAssetIsAdded](self, "_throwsWhenAlreadyMindedAssetIsAdded"))
      {
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        NSLog(CFSTR("*** -[%@ addFragmentedAsset:] specifies an asset that's already associated with a fragment minder. Ignoring."), v9);
        goto LABEL_8;
      }
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@ cannot add an %@ that's already being minded by another fragment minder"), v23, v24, v25, v26, v27, (uint64_t)v21);
LABEL_10:
      objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0));
    }
  }
  else if (!*((_BYTE *)v31 + 24))
  {
    -[AVAsset _setFragmentMindingInterval:](asset, "_setFragmentMindingInterval:", self->_fragmentedAssetMinder->mindingInterval);
    -[AVAsset _setIsAssociatedWithFragmentMinder:](asset, "_setIsAssociatedWithFragmentMinder:", 1);
  }
LABEL_8:
  _Block_object_dispose(&v30, 8);
}

uint64_t __46__AVFragmentedAssetMinder_addFragmentedAsset___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "containsObject:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && !*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)removeFragmentedAsset:(AVAsset *)asset
{
  NSObject *accessSerializer;
  void *v7;
  objc_class *v8;
  NSString *v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD block[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (!-[AVAsset _mindsFragments](asset, "_mindsFragments"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v16 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("An %@ cannot mind instances of %@"), v11, v12, v13, v14, v15, (uint64_t)v9), 0);
    objc_exception_throw(v16);
  }
  accessSerializer = self->_fragmentedAssetMinder->accessSerializer;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVFragmentedAssetMinder_removeFragmentedAsset___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = asset;
  block[6] = &v18;
  block[4] = self;
  dispatch_sync(accessSerializer, block);
  if (*((_BYTE *)v19 + 24))
  {
    -[AVAsset _setFragmentMindingInterval:](asset, "_setFragmentMindingInterval:", 0.0);
    -[AVAsset _setIsAssociatedWithFragmentMinder:](asset, "_setIsAssociatedWithFragmentMinder:", 0);
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __49__AVFragmentedAssetMinder_removeFragmentedAsset___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 8), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 8), "removeObject:", a1[5]);
  return result;
}

@end
