@implementation BSUIMappedImageCache

void __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BSUIMappedImageCacheFuture *v16;
  uint64_t v17;
  void *v18;
  os_unfair_lock_s *v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v19 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[BSUIMappedImageCacheFuture cacheImage](v19);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (v5)
    {
      objc_msgSend(v6, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
    }
    goto LABEL_11;
  }
  if (v19)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = v19;
    v9 = *(id *)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
LABEL_9:

    goto LABEL_11;
  }
  __pathForKeyAndExtension(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40), CFSTR("cpbitmap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _readCPBitmapImageFromPathWithOptions(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    || (v12 = *(_DWORD *)(a1 + 72),
        __pathForKeyAndExtension(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40), CFSTR("surface")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        +[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]((uint64_t)BSUIMappedSurfaceImage, v13, (v12 >> 1) & 1), v11 = (void *)objc_claimAutoreleasedReturnValue(), v13, v11))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v11, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v11;
    v9 = v11;

    goto LABEL_9;
  }
LABEL_11:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) && *(_QWORD *)(a1 + 48))
  {
    v16 = objc_alloc_init(BSUIMappedImageCacheFuture);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  }

}

- (id)imageForKey:(id)a3
{
  -[BSUIMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:completion:]((uint64_t)self, a3, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4
{
  -[BSUIMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:completion:]((uint64_t)self, a3, 0, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_imageForKey:(int)a3 withCPBitmapReadFlags:(void *)a4 generatingIfNecessaryWithBlock:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t *v26;
  id v27;
  id v28;
  void *context;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  _QWORD block[5];
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    v12 = BSDispatchQueueAssertNot();
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy_;
    v55 = __Block_byref_object_dispose_;
    v56 = 0;
    if (v9)
    {
      context = (void *)MEMORY[0x1A1AF6228](v12);
      v45 = 0;
      v46 = &v45;
      v47 = 0x3032000000;
      v48 = __Block_byref_object_copy_;
      v49 = __Block_byref_object_dispose_;
      v50 = 0;
      v13 = MEMORY[0x1E0C809B0];
      v14 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke;
      block[3] = &unk_1E4348C70;
      block[4] = a1;
      v15 = v9;
      v40 = v15;
      v42 = &v51;
      v44 = a3;
      v16 = v10;
      v41 = v16;
      v43 = &v45;
      dispatch_sync(v14, block);
      if (v46[5])
      {
        v38 = 0;
        (*((void (**)(id, uint64_t *))v16 + 2))(v16, &v38);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)v46[5];
        if (v17)
        {
          v19 = v38;
          -[BSUIMappedImageCacheRegistry tmpPath](*(_QWORD *)(a1 + 16));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          _workBlockGenerator(v18, v17, 1, v15, v19, a3, v20, *(void **)(a1 + 24), *(void **)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 40), v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSUIMappedImageCacheFuture submitWorkBlock:]((uint64_t)v18, v21);

          if ((v38 & 1) != 0)
          {
            v26 = v52;
            v27 = v17;
            v23 = (void *)v26[5];
            v26[5] = (uint64_t)v27;
          }
          else
          {
            -[BSUIMappedImageCacheFuture cacheImage]((os_unfair_lock_s *)v46[5]);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = (void *)v52[5];
            v52[5] = v22;
          }
        }
        else
        {
          v36[0] = v13;
          v36[1] = 3221225472;
          v36[2] = __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_2;
          v36[3] = &unk_1E4348C98;
          v37 = v11;
          -[BSUIMappedImageCacheFuture submitWorkBlock:]((uint64_t)v18, v36);
          v23 = v37;
        }

      }
      else if (v11)
      {
        v25 = *(NSObject **)(a1 + 56);
        v33[0] = v13;
        v33[1] = 3221225472;
        v33[2] = __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_3;
        v33[3] = &unk_1E4348CC0;
        v34 = v11;
        v35 = &v51;
        dispatch_async(v25, v33);

      }
      _Block_object_dispose(&v45, 8);

      objc_autoreleasePoolPop(context);
    }
    else if (v11)
    {
      v24 = *(NSObject **)(a1 + 56);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_4;
      v31[3] = &unk_1E4348CE8;
      v32 = v11;
      dispatch_async(v24, v31);

    }
    v28 = (id)v52[5];
    _Block_object_dispose(&v51, 8);

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BSUIMappedImageCache)initWithUniqueIdentifier:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BSUIMappedImageCache *v10;
  uint64_t v11;
  NSString *uniqueIdentifier;
  NSString *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  BSUIMappedImageCacheRegistry *registry;
  BSUIMappedImageCacheRegistry *v30;
  BSUIMappedImageCacheRegistry *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *path;
  NSString *v38;
  void *v39;
  NSString *v40;
  char v41;
  id v42;
  id v43;
  uint64_t v44;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v46;
  NSMutableDictionary *queue_keysToImagesOrFutures;
  uint64_t v48;
  OS_dispatch_queue *calloutQueue;
  void *v51;
  id v52;
  objc_class *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  objc_class *v59;
  __CFString *v60;
  void *v61;
  id v62;
  objc_class *v63;
  __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  objc_super v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  _BYTE v80[18];
  __int16 v81;
  int v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("uniqueIdentifier"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v58 = (id)objc_claimAutoreleasedReturnValue();
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v76 = v58;
      v77 = 2114;
      v78 = v60;
      v79 = 2048;
      *(_QWORD *)v80 = self;
      *(_WORD *)&v80[8] = 2114;
      *(_QWORD *)&v80[10] = CFSTR("BSUIMappedImageCache.m");
      v81 = 1024;
      v82 = 206;
      v83 = 2114;
      v84 = v57;
      _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A0238164);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("options"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v62 = (id)objc_claimAutoreleasedReturnValue();
      v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v76 = v62;
      v77 = 2114;
      v78 = v64;
      v79 = 2048;
      *(_QWORD *)v80 = self;
      *(_WORD *)&v80[8] = 2114;
      *(_QWORD *)&v80[10] = CFSTR("BSUIMappedImageCache.m");
      v81 = 1024;
      v82 = 207;
      v83 = 2114;
      v84 = v61;
      _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v61), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A0238264);
  }
  v74.receiver = self;
  v74.super_class = (Class)BSUIMappedImageCache;
  v10 = -[BSUIMappedImageCache init](&v74, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSString *)v11;

    v13 = v10->_uniqueIdentifier;
    v14 = v9;
    objc_opt_self();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("uniqueIdentifier"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSUIMappedImageCacheRegistry acquireUniqueIdentifier:withOptions:]");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v76 = v66;
        v77 = 2114;
        v78 = CFSTR("BSUIMappedImageCache.m");
        v79 = 1024;
        *(_DWORD *)v80 = 114;
        *(_WORD *)&v80[4] = 2114;
        *(_QWORD *)&v80[6] = v65;
        _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v65), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A0238338);
    }
    objc_msgSend(v14, "containerPathProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cachesPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid cachesPath for BSUIMappedImageCache %@"), v13);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSUIMappedImageCacheRegistry acquireUniqueIdentifier:withOptions:]");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v76 = v68;
        v77 = 2114;
        v78 = CFSTR("BSUIMappedImageCache.m");
        v79 = 1024;
        *(_DWORD *)v80 = 117;
        *(_WORD *)&v80[4] = 2114;
        *(_QWORD *)&v80[6] = v67;
        _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A0238404);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_9);
    if (qword_1ECEC3910)
    {
      objc_msgSend((id)qword_1ECEC3910, "objectForKey:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
        goto LABEL_15;
      v18 = -[BSUIMappedImageCacheRegistry _initWithCachesPath:]([BSUIMappedImageCacheRegistry alloc], v16);
      if (v18)
        v19 = v18[1];
      else
        v19 = 0;
      objc_msgSend((id)qword_1ECEC3910, "setObject:forKey:", v18, v19);
    }
    else
    {
      v20 = -[BSUIMappedImageCacheRegistry _initWithCachesPath:]([BSUIMappedImageCacheRegistry alloc], v16);
      v18 = v20;
      v21 = (void *)MEMORY[0x1E0C99E08];
      if (v20)
        v22 = (void *)v20[1];
      else
        v22 = 0;
      v23 = v22;
      objc_msgSend(v21, "dictionaryWithObject:forKey:", v18, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)qword_1ECEC3910;
      qword_1ECEC3910 = v24;

    }
    v17 = (uint64_t)v18;
    if (!v18)
    {
      v69 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "containerPathProvider");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "stringWithFormat:", CFSTR("must have a registry : uniqueIdentifier='%@' cachesPath='%@' (provider=%@)"), v13, v16, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSUIMappedImageCacheRegistry acquireUniqueIdentifier:withOptions:]");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v76 = v72;
        v77 = 2114;
        v78 = CFSTR("BSUIMappedImageCache.m");
        v79 = 1024;
        *(_DWORD *)v80 = 133;
        *(_WORD *)&v80[4] = 2114;
        *(_QWORD *)&v80[6] = v71;
        _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v71), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A02384ECLL);
    }
LABEL_15:
    v26 = *(void **)(v17 + 24);
    if (v26)
    {
      if ((objc_msgSend(v26, "containsObject:", v13) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("a cache with uniqueIdentifier='%@' cachesPath='%@' already exists"), v13, v16);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSUIMappedImageCacheRegistry acquireUniqueIdentifier:withOptions:]");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v76 = v56;
          v77 = 2114;
          v78 = CFSTR("BSUIMappedImageCache.m");
          v79 = 1024;
          *(_DWORD *)v80 = 139;
          *(_WORD *)&v80[4] = 2114;
          *(_QWORD *)&v80[6] = v55;
          _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

        }
        objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A0238064);
      }
      objc_msgSend(*(id *)(v17 + 24), "addObject:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v13);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = *(void **)(v17 + 24);
      *(_QWORD *)(v17 + 24) = v27;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_9);

    registry = v10->_registry;
    v10->_registry = (BSUIMappedImageCacheRegistry *)v17;

    v30 = v10->_registry;
    if (v30)
      v30 = (BSUIMappedImageCacheRegistry *)v30->_cachesPath;
    v31 = v30;
    v32 = v10->_uniqueIdentifier;
    -[BSUIMappedImageCacheRegistry path](v31, "path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByAppendingPathComponent:", CFSTR("MappedImageCache"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringByAppendingPathComponent:", v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v35, "copy");
    path = v10->_path;
    v10->_path = (NSString *)v36;

    v38 = v10->_path;
    if (v38)
    {
      v39 = (void *)objc_opt_new();
      v40 = v10->_path;
      v73 = 0;
      v41 = objc_msgSend(v39, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v40, 1, 0, &v73);
      v42 = v73;

      if ((v41 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.baseboardui.mappedImageCache:%@"), v10->_uniqueIdentifier);
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v43, "UTF8String");
        v44 = BSDispatchQueueCreateWithQualityOfService();
        queue = v10->_queue;
        v10->_queue = (OS_dispatch_queue *)v44;

        v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        queue_keysToImagesOrFutures = v10->_queue_keysToImagesOrFutures;
        v10->_queue_keysToImagesOrFutures = v46;

        dispatch_get_global_queue(9, 0);
        v48 = objc_claimAutoreleasedReturnValue();
        calloutQueue = v10->_calloutQueue;
        v10->_calloutQueue = (OS_dispatch_queue *)v48;

        goto LABEL_24;
      }
      v38 = v10->_path;
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't create directory at %@ with error %@"), v38, v42);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v52 = (id)objc_claimAutoreleasedReturnValue();
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v76 = v52;
      v77 = 2114;
      v78 = v54;
      v79 = 2048;
      *(_QWORD *)v80 = v10;
      *(_WORD *)&v80[8] = 2114;
      *(_QWORD *)&v80[10] = CFSTR("BSUIMappedImageCache.m");
      v81 = 1024;
      v82 = 222;
      v83 = 2114;
      v84 = v51;
      _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A0237F98);
  }
LABEL_24:

  return v10;
}

- (BSUIMappedImageCache)initWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BSUIMappedImageCache *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D017F8], "pathProviderForCurrentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSUIMappedImageCacheOptions optionsWithContainerPathProvider:](BSUIMappedImageCacheOptions, "optionsWithContainerPathProvider:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BSUIMappedImageCache initWithUniqueIdentifier:options:](self, "initWithUniqueIdentifier:options:", v4, v6);
  return v7;
}

- (BSUIMappedImageCache)init
{
  return -[BSUIMappedImageCache initWithName:options:](self, "initWithName:options:", 0, 0);
}

- (BSUIMappedImageCache)initWithName:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  BSUIMappedImageCache *v9;

  v4 = a4;
  v6 = a3;
  if ((v4 & 2) != 0)
    objc_msgSend(MEMORY[0x1E0D017F8], "pathProviderForSystemContainerForCurrentProcess");
  else
    objc_msgSend(MEMORY[0x1E0D017F8], "pathProviderForCurrentContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSUIMappedImageCacheOptions optionsWithContainerPathProvider:](BSUIMappedImageCacheOptions, "optionsWithContainerPathProvider:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BSUIMappedImageCache initWithUniqueIdentifier:options:](self, "initWithUniqueIdentifier:options:", v6, v8);

  return v9;
}

- (void)dealloc
{
  BSUIMappedImageCacheRegistry *registry;
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  NSMutableSet *uniqueIdentifiers;
  BSUIMappedImageCacheRegistry *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSURL *cachesPath;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  registry = self->_registry;
  v4 = self->_uniqueIdentifier;
  v5 = v4;
  if (registry)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("uniqueIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BSUIMappedImageCacheRegistry releaseUniqueIdentifier:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v22 = v12;
        v23 = 2114;
        v24 = CFSTR("BSUIMappedImageCache.m");
        v25 = 1024;
        v26 = 147;
        v27 = 2114;
        v28 = v11;
        _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A023D7B4);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_9);
    if ((-[NSMutableSet containsObject:](registry->_uniqueIdentifiers, "containsObject:", v5) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot release an identifier we haven't acquired : uniqueIdentifier='%@' cachesPath='%@' : acquired_identifiers=%@"), v5, registry->_cachesPath, registry->_uniqueIdentifiers);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BSUIMappedImageCacheRegistry releaseUniqueIdentifier:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v22 = v14;
        v23 = 2114;
        v24 = CFSTR("BSUIMappedImageCache.m");
        v25 = 1024;
        v26 = 151;
        v27 = 2114;
        v28 = v13;
        _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A023D88CLL);
    }
    v6 = -[NSMutableSet count](registry->_uniqueIdentifiers, "count");
    uniqueIdentifiers = registry->_uniqueIdentifiers;
    if (v6 == 1)
    {
      registry->_uniqueIdentifiers = 0;

      objc_msgSend((id)qword_1ECEC3910, "objectForKey:", registry->_cachesPath);
      v8 = (BSUIMappedImageCacheRegistry *)objc_claimAutoreleasedReturnValue();

      if (v8 != registry)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        cachesPath = registry->_cachesPath;
        objc_msgSend((id)qword_1ECEC3910, "keyEnumerator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("cannot release an identifier we haven't acquired : uniqueIdentifier='%@' cachesPath='%@' : acquired_paths=%@"), v5, cachesPath, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BSUIMappedImageCacheRegistry releaseUniqueIdentifier:]");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v22 = v19;
          v23 = 2114;
          v24 = CFSTR("BSUIMappedImageCache.m");
          v25 = 1024;
          v26 = 154;
          v27 = 2114;
          v28 = v18;
          _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

        }
        objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A023D978);
      }
      v9 = objc_msgSend((id)qword_1ECEC3910, "count");
      v10 = (void *)qword_1ECEC3910;
      if (v9 == 1)
      {
        qword_1ECEC3910 = 0;

      }
      else
      {
        objc_msgSend((id)qword_1ECEC3910, "removeObjectForKey:", registry->_cachesPath);
      }
    }
    else
    {
      -[NSMutableSet removeObject:](uniqueIdentifiers, "removeObject:", v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_9);
  }

  v20.receiver = self;
  v20.super_class = (Class)BSUIMappedImageCache;
  -[BSUIMappedImageCache dealloc](&v20, sel_dealloc);
}

void __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (**v4)(id, _QWORD);

  v4 = a2;
  v4[2](v4, 0);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 1, 0);

}

uint64_t __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setImage:(void *)a3 forKey:(uint64_t)a4 withPersistenceOptions:(int)a5 andCPBitmapReadFlags:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  int v24;

  v11 = a2;
  v12 = a3;
  v13 = a6;
  if (a1)
  {
    BSDispatchQueueAssertNot();
    if (v11 && v12)
    {
      v14 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __96__BSUIMappedImageCache__setImage_forKey_withPersistenceOptions_andCPBitmapReadFlags_completion___block_invoke;
      block[3] = &unk_1E4348D10;
      block[4] = a1;
      v20 = v12;
      v21 = v11;
      v23 = a4;
      v24 = a5;
      v22 = v13;
      dispatch_sync(v14, block);

      v15 = v20;
LABEL_7:

      goto LABEL_8;
    }
    if (v13)
    {
      v16 = *(NSObject **)(a1 + 56);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __96__BSUIMappedImageCache__setImage_forKey_withPersistenceOptions_andCPBitmapReadFlags_completion___block_invoke_2;
      v17[3] = &unk_1E4348CE8;
      v18 = v13;
      dispatch_async(v16, v17);
      v15 = v18;
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __96__BSUIMappedImageCache__setImage_forKey_withPersistenceOptions_andCPBitmapReadFlags_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  BSUIMappedImageCacheFuture *v8;

  v8 = objc_alloc_init(BSUIMappedImageCacheFuture);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_DWORD *)(a1 + 72);
  -[BSUIMappedImageCacheRegistry tmpPath](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _workBlockGenerator(v8, v2, 0, v3, v4, v5, v6, *(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(*(_QWORD *)(a1 + 32) + 32), *(void **)(*(_QWORD *)(a1 + 32) + 56), *(void **)(*(_QWORD *)(a1 + 32) + 40), *(void **)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIMappedImageCacheFuture submitWorkBlock:]((uint64_t)v8, v7);

}

uint64_t __96__BSUIMappedImageCache__setImage_forKey_withPersistenceOptions_andCPBitmapReadFlags_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4 completion:(id)a5
{
  -[BSUIMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:completion:]((uint64_t)self, a3, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  -[BSUIMappedImageCache _setImage:forKey:withPersistenceOptions:andCPBitmapReadFlags:completion:]((uint64_t)self, a3, a4, 0, 0, 0);
}

- (void)setImage:(id)a3 forKey:(id)a4 withCompletion:(id)a5
{
  -[BSUIMappedImageCache _setImage:forKey:withPersistenceOptions:andCPBitmapReadFlags:completion:]((uint64_t)self, a3, a4, 0, 0, a5);
}

- (void)setImage:(id)a3 forKey:(id)a4 withPersistenceOptions:(unint64_t)a5
{
  -[BSUIMappedImageCache _setImage:forKey:withPersistenceOptions:andCPBitmapReadFlags:completion:]((uint64_t)self, a3, a4, a5, 0, 0);
}

- (void)setImage:(id)a3 forKey:(id)a4 withPersistenceOptions:(unint64_t)a5 completion:(id)a6
{
  -[BSUIMappedImageCache _setImage:forKey:withPersistenceOptions:andCPBitmapReadFlags:completion:]((uint64_t)self, a3, a4, a5, 0, a6);
}

- (void)removeImageForKey:(id)a3
{
  -[BSUIMappedImageCache removeImageForKey:withCompletion:](self, "removeImageForKey:withCompletion:", a3, 0);
}

- (void)removeImageForKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertNot();
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__BSUIMappedImageCache_removeImageForKey_withCompletion___block_invoke;
    block[3] = &unk_1E4348D38;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
  else if (v7)
  {
    dispatch_async((dispatch_queue_t)self->_calloutQueue, v7);
  }

}

void __57__BSUIMappedImageCache_removeImageForKey_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_opt_new();
  __pathForKeyAndExtension(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40), CFSTR("cpbitmap"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v2, 0);

  __pathForKeyAndExtension(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40), CFSTR("surface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v3, 0);

  v4 = *(void **)(a1 + 48);
  if (v4)
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56), v4);

}

- (id)allKeys
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  BSDispatchQueueAssertNot();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__BSUIMappedImageCache_allKeys__block_invoke;
  v6[3] = &unk_1E4348D88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__BSUIMappedImageCache_allKeys__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithArray:", v4);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = v5;

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __31__BSUIMappedImageCache_allKeys__block_invoke_2;
    v13[3] = &unk_1E4348D60;
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_msgSend(v2, "allObjects");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __31__BSUIMappedImageCache_allKeys__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cpbitmap")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("surface")))
  {
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByRemovingPercentEncoding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v5);

}

- (void)removeAllObjects
{
  -[BSUIMappedImageCache removeAllImagesWithCompletion:](self, "removeAllImagesWithCompletion:", 0);
}

- (void)releaseRecoverableResources
{
  NSObject *queue;
  _QWORD block[5];

  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__BSUIMappedImageCache_releaseRecoverableResources__block_invoke;
  block[3] = &unk_1E4348DB0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __51__BSUIMappedImageCache_releaseRecoverableResources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

}

- (void)removeAllImagesWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__BSUIMappedImageCache_removeAllImagesWithCompletion___block_invoke;
  v7[3] = &unk_1E4348DD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __54__BSUIMappedImageCache_removeAllImagesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 1, 0, 0);
  v2 = *(void **)(a1 + 40);
  if (v2)
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56), v2);

}

- (NSString)description
{
  return (NSString *)-[BSUIMappedImageCache descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (NSString)debugDescription
{
  return (NSString *)-[BSUIMappedImageCache debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSUIMappedImageCache descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_path, CFSTR("path"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSUIMappedImageCache succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  -[BSUIMappedImageCache descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[BSUIMappedImageCache allKeys](self, "allKeys");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[BSUIMappedImageCache imageForKey:](self, "imageForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v3;
        }
        objc_msgSend(v5, "setObject:forKey:", v12, v10);
        if (!v11)

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v16, "appendDictionarySection:withName:skipIfEmpty:", v5, CFSTR("Contents"), 0);
  objc_msgSend(v16, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_imageForKey:(id)a3 withCPBitmapReadFlags:(int)a4 generatingIfNecessaryWithBlock:(id)a5
{
  -[BSUIMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:completion:]((uint64_t)self, a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setImage:(id)a3 forKey:(id)a4 completion:(id)a5
{
  -[BSUIMappedImageCache _setImage:forKey:withPersistenceOptions:andCPBitmapReadFlags:completion:]((uint64_t)self, a3, a4, 0, 0, a5);
}

- (void)_setImage:(id)a3 forKey:(id)a4 withPersistenceOptions:(unint64_t)a5 andCPBitmapReadFlags:(int)a6
{
  -[BSUIMappedImageCache _setImage:forKey:withPersistenceOptions:andCPBitmapReadFlags:completion:]((uint64_t)self, a3, a4, a5, a6, 0);
}

- (void)_warmupImageForKey:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  BSDispatchQueueAssertNot();
  if (v4)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__BSUIMappedImageCache__warmupImageForKey___block_invoke;
    v6[3] = &unk_1E4348E00;
    v6[4] = self;
    v7 = v4;
    dispatch_async(queue, v6);

  }
}

void __43__BSUIMappedImageCache__warmupImageForKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *MappedDataFromPath;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __pathForKeyAndExtension(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40), CFSTR("cpbitmap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_safeAddObject:", v3);

  __pathForKeyAndExtension(*(void **)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40), CFSTR("surface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_safeAddObject:", v4);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    v8 = (_QWORD *)MEMORY[0x1E0C85AD8];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        MappedDataFromPath = (void *)CPBitmapCreateMappedDataFromPath();
        v11 = MappedDataFromPath;
        if (MappedDataFromPath)
        {
          v12 = objc_retainAutorelease(MappedDataFromPath);
          v13 = objc_msgSend(v12, "bytes", v17);
          v14 = objc_msgSend(v12, "length");
          if (v13)
            v15 = v14 == 0;
          else
            v15 = 1;
          if (!v15)
          {
            v16 = 0;
            do
              v16 += *v8;
            while (v16 < v14);
          }
        }

        ++v9;
      }
      while (v9 != v6);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)_noteExternalChangeForKey:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  BSDispatchQueueAssertNot();
  if (v4)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__BSUIMappedImageCache__noteExternalChangeForKey___block_invoke;
    v6[3] = &unk_1E4348E00;
    v6[4] = self;
    v7 = v4;
    dispatch_async(queue, v6);

  }
}

void __50__BSUIMappedImageCache__noteExternalChangeForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue_allKeys, 0);
  objc_storeStrong((id *)&self->_queue_keysToImagesOrFutures, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
