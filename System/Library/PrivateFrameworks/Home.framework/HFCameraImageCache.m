@implementation HFCameraImageCache

- (HFCameraImageCache)init
{
  return -[HFCameraImageCache initWithUniqueIdentifier:](self, "initWithUniqueIdentifier:", CFSTR("com.apple.Home.HFCameraImageCache"));
}

- (HFCameraImageCache)initWithUniqueIdentifier:(id)a3
{
  id v4;
  HFCameraImageCache *v5;
  HFCameraImageCache *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *imageCache;
  NSObject *v14;
  uint64_t v15;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HFCameraImageCache;
  v5 = -[HFCameraImageCache init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_imageCacheLock._os_unfair_lock_opaque = 0;
    +[HFUtilities cachesDirectoryURL](HFUtilities, "cachesDirectoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("MappedImageCache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0))
    {
      HFLogForCategory(0x15uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v24 = "-[HFCameraImageCache initWithUniqueIdentifier:]";
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "%s: existing image cache found. Attempting to remove it: %@", buf, 0x16u);

      }
      dispatch_get_global_queue(9, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        imageCache = v12;
        objc_initWeak((id *)buf, v6);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __47__HFCameraImageCache_initWithUniqueIdentifier___block_invoke;
        block[3] = &unk_1EA7394D0;
        v19 = v9;
        objc_copyWeak(&v21, (id *)buf);
        v20 = v4;
        dispatch_async(imageCache, block);

        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
LABEL_11:

        goto LABEL_12;
      }
      HFLogForCategory(0x15uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v24 = "-[HFCameraImageCache initWithUniqueIdentifier:]";
        v25 = 2112;
        v26 = v17;
        _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "%s: Could not get a global queue with priority background to delete an image cache. Keeping the old one for now: %@", buf, 0x16u);

      }
    }
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01930]), "initWithUniqueIdentifier:", v4);
    imageCache = v6->_imageCache;
    v6->_imageCache = (BSUIMappedImageCache *)v15;
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

void __47__HFCameraImageCache_initWithUniqueIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v9);
  v5 = v9;

  if ((v4 & 1) == 0)
  {
    HFLogForCategory(0x15uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[HFCameraImageCache initWithUniqueIdentifier:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%s: error attempting to remove existing image cache: %@", buf, 0x16u);
    }

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01930]), "initWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setImageCache:", v7);

}

- (void)setImageCache:(id)a3
{
  BSUIMappedImageCache *v4;
  BSUIMappedImageCache *imageCache;

  v4 = (BSUIMappedImageCache *)a3;
  os_unfair_lock_lock(&self->_imageCacheLock);
  imageCache = self->_imageCache;
  self->_imageCache = v4;

  os_unfair_lock_unlock(&self->_imageCacheLock);
}

- (BSUIMappedImageCache)imageCache
{
  os_unfair_lock_s *p_imageCacheLock;
  BSUIMappedImageCache *v4;

  p_imageCacheLock = &self->_imageCacheLock;
  os_unfair_lock_lock(&self->_imageCacheLock);
  v4 = self->_imageCache;
  os_unfair_lock_unlock(p_imageCacheLock);
  return v4;
}

- (void)addImage:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraImageCache.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraImageCache.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

LABEL_3:
  -[HFCameraImageCache imageCache](self, "imageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __38__HFCameraImageCache_addImage_forKey___block_invoke;
  v16[3] = &unk_1EA7394F8;
  v17 = v7;
  v11 = v7;
  objc_msgSend(v10, "imageForKey:generatingIfNecessaryWithBlock:", v9, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    HFLogForCategory(0x15uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Unable to add image to CameraImageCache for key: %@", buf, 0xCu);
    }

  }
}

id __38__HFCameraImageCache_addImage_forKey___block_invoke(uint64_t a1, uint64_t *a2)
{
  int v4;
  uint64_t v5;

  v4 = MGGetBoolAnswer();
  v5 = 4;
  if (!v4)
    v5 = 0;
  *a2 = v5;
  return *(id *)(a1 + 32);
}

- (id)imageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFCameraImageCache imageCache](self, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageForKey:generatingIfNecessaryWithBlock:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)posterFrameKeyForCameraClipIdentifierString:(id)a3 withOffset:(float)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%.0f"), a3, a4);
}

+ (id)faceCropKeyForPersonName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), a3, CFSTR("-face-crop"));
}

+ (id)personNameForFaceCropKey:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-face-crop"), &stru_1EA741FF8);
}

+ (id)heroFrameKeyForCameraClipIdentifierString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-hero"), a3);
}

- (void)releaseRecoverableResources
{
  id v2;

  -[HFCameraImageCache imageCache](self, "imageCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseRecoverableResources");

}

- (void)purgeAllImages
{
  id v2;

  -[HFCameraImageCache imageCache](self, "imageCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllImagesWithCompletion:", &__block_literal_global_158);

}

void __36__HFCameraImageCache_purgeAllImages__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  HFLogForCategory(0x15uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_1DD34E000, v0, OS_LOG_TYPE_DEBUG, "Purged all camera images from the cache.", v1, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
