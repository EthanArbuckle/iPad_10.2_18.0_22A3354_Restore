@implementation ICAttachmentPreviewImage

void __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke(uint64_t a1)
{
  ICAttachmentPreviewImageLoader *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = [ICAttachmentPreviewImageLoader alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachedOrientedImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scale");
  v4 = -[ICAttachmentPreviewImageLoader initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:](v2, "initWithOriginalImage:orientedImage:data:scale:previewImageURLs:delayLoadingURLs:", v3, v7, 0, *(_QWORD *)(a1 + 48), 0);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  char v12;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke_3;
  v9[3] = &unk_1E5C1DD78;
  objc_copyWeak(v11, (id *)(a1 + 32));
  v11[1] = *(id *)(a1 + 40);
  v12 = a3;
  v8 = v5;
  v10 = v8;
  objc_msgSend(v7, "performBlock:", v9);

  objc_destroyWeak(v11);
}

void __42__ICAttachmentPreviewImage_UI__imageCache__block_invoke()
{
  id v0;
  void *v1;

  if (!imageCache_imageCache)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0D63B38]);
    v1 = (void *)imageCache_imageCache;
    imageCache_imageCache = (uint64_t)v0;

  }
}

void __92__ICAttachmentPreviewImage_UI__newImageLoaderForUpdatingImageOnCompletion_asyncDataLoading___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  BOOL v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "imageID") == *(_QWORD *)(a1 + 48);
    WeakRetained = v5;
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 56))
        objc_msgSend(v5, "setCachedOrientedImage:", v4);
      else
        objc_msgSend(v5, "setCachedImage:", v4);
      WeakRetained = v5;
    }
  }

}

void __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15[2];
  _QWORD block[4];
  __int128 v17;
  uint64_t v18;

  objc_msgSend(MEMORY[0x1E0D63A30], "concurrentFileLoadLimitSemaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0D63A30], "concurrentFileLoadLimitSemaphore");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D63A30], "imageCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageForKey:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "loadImage");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0D63A30], "imageCache");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setImage:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 32));

      }
    }
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_2;
    block[3] = &unk_1E5C1DDC8;
    *(_OWORD *)v15 = *(_OWORD *)(a1 + 48);
    v12 = v15[0];
    v17 = *(_OWORD *)v15;
    v18 = *(_QWORD *)(a1 + 64);
    dispatch_async(v11, block);

    objc_msgSend(MEMORY[0x1E0D63A30], "concurrentFileLoadLimitSemaphore");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v13);

  }
}

_QWORD *__62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_2(_QWORD *result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[4] + 16))(result[4], *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40));
  return result;
}

uint64_t __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __62__ICAttachmentPreviewImage_UI__asyncImage_aboutToLoadHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __37__ICAttachmentPreviewImage_UI__image__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
