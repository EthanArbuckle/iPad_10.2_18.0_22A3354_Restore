@implementation ICAttachmentPreviewImage(UI)

- (uint64_t)clearCachedOrientedImage
{
  return objc_msgSend(a1, "setCachedOrientedImage:", 0);
}

- (uint64_t)clearCachedImage
{
  return objc_msgSend(a1, "setCachedImage:", 0);
}

- (id)newImageLoaderForUpdatingImageOnCompletion:()UI asyncDataLoading:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ICAttachmentPreviewImageLoader *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  ICAttachmentPreviewImageLoader *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24[2];
  id location;
  _QWORD block[4];
  id v27;
  void *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  objc_msgSend(a1, "cachedImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "previewImageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "addObject:", v9);
  if (objc_msgSend(a1, "isPasswordProtected"))
  {
    if (!objc_msgSend(a1, "isAuthenticated"))
      goto LABEL_10;
    objc_msgSend(a1, "decryptedImageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [ICAttachmentPreviewImageLoader alloc];
    objc_msgSend(a1, "cachedOrientedImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "scale");
    v13 = -[ICAttachmentPreviewImageLoader initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:](v11, "initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:", v7, v12, v10, v8, a4);
    v14 = (void *)v32[5];
    v32[5] = v13;

  }
  else if ((_DWORD)a4)
  {
    v15 = [ICAttachmentPreviewImageLoader alloc];
    objc_msgSend(a1, "cachedOrientedImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "scale");
    v16 = -[ICAttachmentPreviewImageLoader initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:](v15, "initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:", v7, v10, 0, v8, 1);
    v17 = (void *)v32[5];
    v32[5] = v16;

  }
  else
  {
    objc_msgSend(a1, "fileQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke;
    block[3] = &unk_1E5C1DD50;
    v30 = &v31;
    v27 = v7;
    v28 = a1;
    v29 = v8;
    dispatch_sync(v18, block);

    v10 = v27;
  }

LABEL_10:
  v19 = objc_msgSend(a1, "previewImageOrientation");
  objc_msgSend((id)v32[5], "setImageOrientation:", v19);
  if (a3)
  {
    v20 = (void *)objc_msgSend(a1, "imageID");
    objc_initWeak(&location, a1);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke_2;
    v23[3] = &unk_1E5C1DDA0;
    objc_copyWeak(v24, &location);
    v24[1] = v20;
    objc_msgSend((id)v32[5], "setImageDidLoadBlock:", v23);
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
  v21 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v21;
}

- (BOOL)hasCachedImage
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "cachedImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)previewImageOrientation
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "attachmentModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "previewImageOrientation");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)newImageLoaderForUpdatingImageOnCompletion:()UI
{
  return objc_msgSend(a1, "newImageLoaderForUpdatingImageOnCompletion:asyncDataLoading:", a3, 0);
}

- (id)cachedOrientedImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D63A30], "imageCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "orientedImageID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_DEFAULT, "Trying to get cached oriented image, but the identifier is nil", v8, 2u);
    }

    return 0;
  }
}

- (void)setCachedImage:()UI
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D63A30], "imageCache");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[NSObject setImage:forKey:](v6, "setImage:forKey:", v4, v7);
    else
      -[NSObject removeImageForKey:](v6, "removeImageForKey:", v7);

  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEFAULT, "Trying to set cached image, but the identifier is nil", v8, 2u);
    }
  }

}

- (void)setCachedOrientedImage:()UI
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D63A30], "imageCache");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "orientedImageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[NSObject setImage:forKey:](v6, "setImage:forKey:", v4, v7);
    else
      -[NSObject removeImageForKey:](v6, "removeImageForKey:", v7);

  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEFAULT, "Trying to set cached oriented image, but the identifier is nil", v8, 2u);
    }
  }

}

- (id)orientedImageID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(a1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendString:", *MEMORY[0x1E0D63658]);
    return v5;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_DEFAULT, "Trying to get oriented image ID, but the identifier is nil", v8, 2u);
    }

    return 0;
  }
}

- (id)cachedImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D63A30], "imageCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_DEFAULT, "Trying to get cached image, but the identifier is nil", v8, 2u);
    }

    return 0;
  }
}

+ (id)imageCache
{
  if (imageCache_onceToken != -1)
    dispatch_once(&imageCache_onceToken, &__block_literal_global_2);
  return (id)imageCache_imageCache;
}

- (void)orientedImageTransform
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  id v8;

  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "attachmentModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "previewImageOrientationTransform");
    }
    else
    {
      a2[1] = 0u;
      a2[2] = 0u;
      *a2 = 0u;
    }

    v3 = v8;
  }
  else
  {
    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *a2 = *MEMORY[0x1E0C9BAA8];
    a2[1] = v7;
    a2[2] = *(_OWORD *)(v6 + 32);
  }

}

- (id)orientedImage
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "cachedOrientedImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "image");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = objc_msgSend(a1, "previewImageOrientation");
      if (v3)
      {
        v4 = v3;
        v5 = objc_alloc(MEMORY[0x1E0DC3870]);
        v6 = objc_msgSend(v2, "ic_CGImage");
        objc_msgSend(v2, "scale");
        v7 = objc_msgSend(v5, "initWithCGImage:scale:orientation:", v6, v4);

        v2 = (void *)v7;
      }
    }
    objc_msgSend(a1, "setCachedOrientedImage:", v2);
  }
  return v2;
}

- (id)imageWithBackground:()UI
{
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  _OWORD v10[3];
  _BYTE v11[48];

  v5 = (void *)MEMORY[0x1E0D63A30];
  objc_msgSend(a1, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "orientedImageTransform");
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10[0] = *MEMORY[0x1E0C9BAA8];
  v10[1] = v7;
  v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v5, "orientedImage:withTransform:background:backgroundTransform:", v6, v10, a3, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)orientedImageWithBackground:()UI
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _BYTE v10[48];

  v5 = (void *)MEMORY[0x1E0D63A30];
  objc_msgSend(a1, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "orientedImageTransform");
  objc_msgSend(a1, "orientedImageTransform");
  objc_msgSend(v5, "orientedImage:withTransform:background:backgroundTransform:", v6, v10, a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)orientedImage:()UI withTransform:background:backgroundTransform:
{
  __int128 v6;
  __int128 v7;
  _OWORD v9[3];
  _OWORD v10[3];

  v6 = a4[1];
  v10[0] = *a4;
  v10[1] = v6;
  v10[2] = a4[2];
  v7 = a6[1];
  v9[0] = *a6;
  v9[1] = v7;
  v9[2] = a6[2];
  +[ICAttachmentPreviewImageLoader orientedImage:withTransform:background:backgroundTransform:](ICAttachmentPreviewImageLoader, "orientedImage:withTransform:background:backgroundTransform:", a3, v10, a5, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)asyncImage:()UI aboutToLoadHandler:
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  _QWORD aBlock[5];
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD v28[3];
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0D63A30], "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageForKey:", v8);
  v35 = (id)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  if (v31[5])
    goto LABEL_8;
  if (v7)
    v7[2](v7);
  v11 = (void *)objc_msgSend(a1, "newImageLoaderForUpdatingImageOnCompletion:asyncDataLoading:", 0, 1);
  if (!objc_msgSend(v11, "canLoadImage"))
  {
    objc_msgSend(a1, "setNeedsToBeFetchedFromCloud:", 1);

LABEL_8:
    dispatch_get_global_queue(0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_4;
    v18[3] = &unk_1E5C1DE40;
    v19 = v6;
    v20 = &v30;
    dispatch_async(v15, v18);

    v14 = 0;
    goto LABEL_9;
  }
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  objc_msgSend(a1, "fileQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke;
  block[3] = &unk_1E5C1DDF0;
  v26 = v28;
  v27 = &v30;
  v23 = v8;
  v24 = v11;
  v25 = v6;
  v13 = v11;
  dispatch_async(v12, block);

  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_3;
  aBlock[3] = &unk_1E5C1DE18;
  aBlock[4] = v28;
  v14 = _Block_copy(aBlock);

  _Block_object_dispose(v28, 8);
  if (!v14)
    goto LABEL_8;
LABEL_9:
  v16 = _Block_copy(v14);

  _Block_object_dispose(&v30, 8);
  return v16;
}

- (id)image
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v2 = dispatch_semaphore_create(0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ICAttachmentPreviewImage_UI__image__block_invoke;
  v7[3] = &unk_1E5C1DE68;
  v9 = &v10;
  v3 = v2;
  v8 = v3;
  v4 = (id)objc_msgSend(a1, "asyncImage:aboutToLoadHandler:", v7, 0);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)writeOrientedPreviewToDisk
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Failed to get oriented image ref", v1, 2u);
}

@end
