@implementation MKIconDiskCache

void __114___MKIconDiskCache_imageForStyleAttributes_size_scale_isCarplay_isTransit_isTransparent_isNightMode_drawingBlock___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lock");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unlock");
  if (v2)
  {
    UIImagePNGRepresentation(*(UIImage **)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v19 = 0;
      v9 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v19);
      v10 = v19;

      if ((v9 & 1) == 0)
      {
        GEOGetMKIconManagerLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v10;
          _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_ERROR, "Failed to create image cache directory: %@", buf, 0xCu);
        }

      }
    }
    v12 = *(_QWORD *)(a1 + 56);
    v18 = 0;
    v13 = objc_msgSend(v3, "writeToFile:options:error:", v12, 1, &v18);
    v14 = v18;
    if ((v13 & 1) == 0)
    {
      GEOGetMKIconManagerLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_ERROR, "Error writing image %@", buf, 0xCu);
      }

    }
    GEOGetMKIconManagerLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_DEBUG, "Set image at %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lock");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unlock");

  }
}

@end
