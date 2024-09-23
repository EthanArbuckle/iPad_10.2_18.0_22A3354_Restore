@implementation NTKCompanionSinglePHAssetEditor

- (NTKCompanionSinglePHAssetEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4 shouldFinalize:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NTKCompanionSinglePHAssetEditor *v9;
  NTKCompanionSinglePHAssetEditor *v10;
  void *v11;
  uint64_t v12;
  NSString *albumIdentifier;
  NSString *albumName;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKCompanionSinglePHAssetEditor;
  v9 = -[NTKCompanionResourceDirectoryEditor initWithResourceDirectory:forDevice:](&v16, sel_initWithResourceDirectory_forDevice_, v8, a4);
  v10 = v9;
  if (v9)
  {
    -[NTKCompanionSinglePHAssetEditor setShouldFinalize:](v9, "setShouldFinalize:", v5);
    +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetCollectionIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    albumIdentifier = v10->_albumIdentifier;
    v10->_albumIdentifier = (NSString *)v12;

    albumName = v10->_albumName;
    v10->_albumName = 0;

    v10->_albumNameValid = 0;
  }

  return v10;
}

- (BOOL)shouldFinalize
{
  return -[NTKCompanionResourceDirectoryEditor state](self, "state") == 2;
}

- (void)setShouldFinalize:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state") < 3)
  {
    if (v3)
      v13 = 2;
    else
      v13 = 1;
    -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", v13);
  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NTKCompanionSinglePHAssetEditor setShouldFinalize:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (NSString)albumName
{
  NSString *v3;
  NSString *albumName;

  if (!self->_albumNameValid)
  {
    -[NTKCompanionSinglePHAssetEditor _fetchAlbumName](self, "_fetchAlbumName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    albumName = self->_albumName;
    self->_albumName = v3;

    self->_albumNameValid = 1;
  }
  return self->_albumName;
}

- (void)setAlbumIdentifier:(id)a3
{
  NSString *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *albumIdentifier;
  NSObject *v15;
  NSString *v16;
  NSString *albumName;

  v5 = (NSString *)a3;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state") < 3)
  {
    albumIdentifier = self->_albumIdentifier;
    if (albumIdentifier != v5 && (!albumIdentifier || !-[NSString isEqualToString:](v5, "isEqualToString:")))
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[NTKCompanionSinglePHAssetEditor setAlbumIdentifier:].cold.2((uint64_t)v5, v15);

      objc_storeStrong((id *)&self->_albumIdentifier, a3);
      -[NTKCompanionSinglePHAssetEditor _fetchAlbumName](self, "_fetchAlbumName");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      albumName = self->_albumName;
      self->_albumName = v16;

      self->_albumNameValid = 1;
      -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NTKCompanionSinglePHAssetEditor setAlbumIdentifier:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  __int128 *v17;
  _QWORD aBlock[5];
  id v19;
  __int128 *p_buf;
  int64_t v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "generateGalleryPreviewResourceDirectoryWithCompletion: generating preview for %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__21;
  v25 = __Block_byref_object_dispose__21;
  v26 = 0;
  v7 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6BD2870;
  p_buf = &buf;
  v21 = v7;
  aBlock[4] = self;
  v9 = v4;
  v19 = v9;
  v10 = _Block_copy(aBlock);
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") <= 2)
  {
    if (-[NTKCompanionResourceDirectoryEditor state](self, "state") != 1)
    {
      -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 3);
      dispatch_get_global_queue(2, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3;
      block[3] = &unk_1E6BD2898;
      v17 = &buf;
      block[4] = self;
      v16 = v10;
      dispatch_async(v14, block);

      goto LABEL_7;
    }
    -[NTKCompanionResourceDirectoryEditor resourceDirectory](self, "resourceDirectory");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v12;

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  (*((void (**)(void *, uint64_t))v10 + 2))(v10, v11);
LABEL_7:

  _Block_object_dispose(&buf, 8);
}

void __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  __int128 v3;
  _QWORD block[5];
  __int128 v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2;
  block[3] = &unk_1E6BD2848;
  v1 = *(_QWORD *)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setGalleryPreviewResourceDirectory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "galleryPreviewResourceDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_createResourceDirectoryForSinglePHAssetWithPreviewOnly:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") < 3)
  {
    if (-[NTKCompanionResourceDirectoryEditor state](self, "state") == 1)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_2;
      v9[3] = &unk_1E6BCE3C8;
      v9[4] = self;
      v10 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v9);
      v5 = v10;
    }
    else
    {
      -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 4);
      dispatch_get_global_queue(2, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_3;
      v7[3] = &unk_1E6BD00B0;
      v7[4] = self;
      v8 = v4;
      dispatch_async(v6, v7);

      v5 = v8;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke;
    block[3] = &unk_1E6BCDF60;
    v12 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v5 = v12;
  }

}

uint64_t __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "resourceDirectory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_createResourceDirectoryForSinglePHAssetWithPreviewOnly:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_4;
  block[3] = &unk_1E6BCD820;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setResourceDirectory:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "resourceDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)optionsForSingleAsset
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CD1570]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mediaType = %ld) && ((playbackStyle = %ld) || (playbackStyle = %ld))"), 1, 1, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  v8 = *MEMORY[0x1E0CD1A18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addFetchPropertySets:", v6);

  objc_msgSend(v2, "setFetchLimit:", 1);
  return v2;
}

- (id)_createResourceDirectoryForSinglePHAssetWithPreviewOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  -[NTKCompanionSinglePHAssetEditor _fetchSingleAsset](self, "_fetchSingleAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  -[NTKCompanionSinglePHAssetEditor albumIdentifier](self, "albumIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCompanionResourceDirectoryEditor device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_createResourceDirectoryWithAsset:assetCollection:forDevice:previewOnly:", v5, v7, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_fetchSingleAsset
{
  return 0;
}

- (id)_fetchAlbumName
{
  return 0;
}

- (NSString)albumIdentifier
{
  return self->_albumIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumIdentifier, 0);
}

- (void)setShouldFinalize:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "setShouldFinalize: trying to set the state while finalizing or generating a preview", a5, a6, a7, a8, 0);
}

- (void)setAlbumIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "setAlbumIdentifier: trying to set the albumIdentifier while finalizing or generating a preview", a5, a6, a7, a8, 0);
}

- (void)setAlbumIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "setAlbumIdentifier: set the albumIdentifier to %@", (uint8_t *)&v2, 0xCu);
}

@end
