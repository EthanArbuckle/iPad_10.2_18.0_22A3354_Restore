@implementation NTKCompanionTransientCustomPhotosEditor

- (NTKCompanionTransientCustomPhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  NTKCompanionTransientCustomPhotosEditor *v4;
  uint64_t v5;
  NSMutableArray *photos;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKCompanionTransientCustomPhotosEditor;
  v4 = -[NTKCompanionCustomPhotosEditor initWithResourceDirectory:forDevice:](&v8, sel_initWithResourceDirectory_forDevice_, 0, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    photos = v4->_photos;
    v4->_photos = (NSMutableArray *)v5;

    v4->_previewIsValid = 0;
    -[NTKCompanionResourceDirectoryEditor setState:](v4, "setState:", 1);
  }
  return v4;
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  uint8_t *v16;
  _QWORD aBlock[5];
  id v18;
  uint8_t *v19;
  int64_t v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "generateGalleryPreviewResourceDirectoryWithCompletion: generating preview for TransientCustomPhotosEditor", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__26;
  v25 = __Block_byref_object_dispose__26;
  v26 = 0;
  v6 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6BD0010;
  v19 = buf;
  v20 = v6;
  aBlock[4] = self;
  v8 = v4;
  v18 = v8;
  v9 = _Block_copy(aBlock);
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state") >= 2
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") <= 2)
  {
    if (!self->_previewIsValid)
    {
      -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 3);
      dispatch_get_global_queue(2, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3;
      block[3] = &unk_1E6BD0038;
      v16 = buf;
      block[4] = self;
      v15 = v9;
      dispatch_async(v13, block);

      goto LABEL_7;
    }
    -[NTKCompanionResourceDirectoryEditor galleryPreviewResourceDirectory](self, "galleryPreviewResourceDirectory");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v22 + 5);
    *((_QWORD *)v22 + 5) = v11;

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  (*((void (**)(void *, uint64_t))v9 + 2))(v9, v10);
LABEL_7:

  _Block_object_dispose(buf, 8);
}

void __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  _QWORD block[5];
  __int128 v12;
  uint64_t v13;
  char v14;

  if ((a2 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);

      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = 0;

      v4 = 0;
    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2;
  block[3] = &unk_1E6BCFFE8;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = a2;
  block[4] = v8;
  v13 = v4;
  v10 = *(_OWORD *)(a1 + 40);
  v9 = (id)v10;
  v12 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = *(_BYTE *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setGalleryPreviewResourceDirectory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "galleryPreviewResourceDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  NTKPhotosCreateResourceDirectory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 88), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "_watchPhotoImageSize");
      v7 = v6;
      v9 = v8;
      v10 = (void *)objc_opt_class();
      objc_msgSend(v5, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "originalCrop");
      objc_msgSend(v10, "_cropAndScaleUIImage:cropRect:outputSize:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "_writeAsset:image:withImageCrop:to:", 0, v12, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0.0, 0.0, v7, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "encodeAsDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        NTKPhotosWriteImageList(v16, *(void **)(*(_QWORD *)(a1[6] + 8) + 40));
        (*(void (**)(void))(a1[5] + 16))();

      }
      else
      {
        (*(void (**)(void))(a1[5] + 16))();
      }

    }
    else
    {
      (*(void (**)(void))(a1[5] + 16))();
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(a1[5] + 16))(a1[5], 0);
  }
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state") >= 2
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") < 3)
  {
    -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 4);
    dispatch_get_global_queue(2, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_2;
    v9[3] = &unk_1E6BD00B0;
    v9[4] = self;
    v10 = v4;
    v8 = v4;
    dispatch_async(v7, v9);

    v6 = v10;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke;
    block[3] = &unk_1E6BCDF60;
    v12 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v6 = v12;
  }

}

uint64_t __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD aBlock[4];
  id v15;
  uint64_t v16;
  id v17;

  NTKPhotosCreateResourceDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_3;
  aBlock[3] = &unk_1E6BD0088;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v15 = v3;
  v16 = v4;
  v17 = v5;
  v6 = _Block_copy(aBlock);
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_writeTransientPhotosInto:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && NTKPhotosWriteImageList(v8, v3))
    {
      v10 = objc_opt_new();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 88);
      *(_QWORD *)(v11 + 88) = v10;

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 0;
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    v7[2](v7, v13);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v6 + 2))(v6, 0);
  }

}

void __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v4 = *(id *)(a1 + 32);
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeItemAtPath:error:", v5, 0);

      v5 = 0;
    }
    v6 = 0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_4;
  v10[3] = &unk_1E6BD0060;
  v13 = v6;
  v8 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setResourceDirectory:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (int64_t)photosCount
{
  return -[NSMutableArray count](self->_photos, "count");
}

- (BOOL)addPhotosFromUIImagePicker:(id)a3
{
  return 0;
}

- (BOOL)addAssetsFromAssetList:(id)a3
{
  return 0;
}

- (BOOL)addImageList:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") <= 2
    && (v5 = -[NTKCompanionTransientCustomPhotosEditor photosCount](self, "photosCount"),
        (unint64_t)(-[NSMutableArray count](self->_photos, "count") + v5) <= 0x18))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v14 = (void *)objc_opt_new();
          objc_msgSend(v14, "setImage:", v13);
          objc_msgSend(v14, "image");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKCompanionResourceDirectoryEditor device](self, "device");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NTKPhotosDefaultCropForImage(v15, v16);
          objc_msgSend(v14, "setOriginalCrop:");

          -[NSMutableArray addObject:](self->_photos, "addObject:", v14);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);
    self->_previewIsValid = 0;
    v6 = 1;
    v4 = v17;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)deletePhotoAtIndex:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state"))
  {
    v5 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
    if ((a3 & 0x8000000000000000) == 0
      && v5 <= 2
      && -[NSMutableArray count](self->_photos, "count") > (unint64_t)a3)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_photos, "removeObjectAtIndex:", a3);
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = a3;
        _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "deletePhotoAtIndex: deleting image at index %ld", (uint8_t *)&v7, 0xCu);
      }

      if (self->_previewIsValid)
        self->_previewIsValid = a3 != 0;
      -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);
    }
  }
}

- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  uint64_t v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  BOOL v13;
  int v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state"))
  {
    v7 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
    if ((a3 & 0x8000000000000000) == 0 && v7 <= 2)
    {
      v8 = -[NSMutableArray count](self->_photos, "count");
      if ((a4 & 0x8000000000000000) == 0
        && v8 > a3
        && -[NSMutableArray count](self->_photos, "count") > (unint64_t)a4)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 134218240;
          v15 = a3;
          v16 = 2048;
          v17 = a4;
          _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "movePhotoAtIndex: moving photo from index %ld to index %ld", (uint8_t *)&v14, 0x16u);
        }

        -[NSMutableArray removeObjectAtIndex:](self->_photos, "removeObjectAtIndex:", a3);
        -[NSMutableArray insertObject:atIndex:](self->_photos, "insertObject:atIndex:", v9, a4);
        if (self->_previewIsValid)
        {
          if (a3)
            v11 = a4 == 0;
          else
            v11 = 1;
          v13 = !v11 || a3 == a4;
          self->_previewIsValid = v13;
        }
        -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);

      }
    }
  }
}

- (BOOL)setOriginalCrop:(CGRect)a3 forPhotoAtIndex:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  int64_t v10;
  uint64_t v11;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
  if (v10)
  {
    v11 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
    LOBYTE(v10) = 0;
    if ((a4 & 0x8000000000000000) == 0 && v11 <= 2)
    {
      if (-[NSMutableArray count](self->_photos, "count") <= (unint64_t)a4)
      {
        LOBYTE(v10) = 0;
      }
      else
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "originalCrop");
        if ((CLKRectEqualsRect() & 1) == 0)
        {
          objc_msgSend(v12, "setOriginalCrop:", x, y, width, height);
          if (self->_previewIsValid)
            self->_previewIsValid = a4 != 0;
          -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);
        }

        LOBYTE(v10) = 1;
      }
    }
  }
  return v10;
}

- (BOOL)canChangeOriginalCropOfPhotoAtIndex:(int64_t)a3
{
  return 1;
}

- (BOOL)isPhotoInPhotoLibraryAtIndex:(int64_t)a3
{
  return 0;
}

- (void)imageAndCropForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  if (a3 < 0 || -[NSMutableArray count](self->_photos, "count") <= (unint64_t)a3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__NTKCompanionTransientCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke;
    v14[3] = &unk_1E6BCDF60;
    v15 = v6;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v14);
    v8 = v15;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__NTKCompanionTransientCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_2;
    block[3] = &unk_1E6BCE3C8;
    v12 = v7;
    v13 = v6;
    v8 = v7;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __82__NTKCompanionTransientCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

void __82__NTKCompanionTransientCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "image");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "originalCrop");
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)imageInPhotoLibraryForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__NTKCompanionTransientCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke;
  block[3] = &unk_1E6BCDF60;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __89__NTKCompanionTransientCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGRect)originalCropForPhotoAtIndex:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if (a3 < 0 || -[NSMutableArray count](self->_photos, "count") <= (unint64_t)a3)
  {
    v7 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalCrop");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3
{
  double v3;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v3 = 1.0;
  if (a3 < 0)
  {
    v6 = 1.0;
  }
  else
  {
    v6 = 1.0;
    if (-[NSMutableArray count](self->_photos, "count") > (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "size");
      v10 = v9;
      objc_msgSend(v8, "scale");
      v12 = v10 * v11;
      objc_msgSend(v8, "size");
      v14 = v13;
      objc_msgSend(v8, "scale");
      v16 = v14 * v15;
      objc_msgSend((id)objc_opt_class(), "_watchPhotoImageSize");
      v18 = v17 / v12;
      v20 = v19 / v16;
      if (v18 <= 1.0)
        v6 = v18;
      else
        v6 = 1.0;
      if (v20 <= 1.0)
        v3 = v20;
      else
        v3 = 1.0;

    }
  }
  v21 = v6;
  v22 = v3;
  result.height = v22;
  result.width = v21;
  return result;
}

- (id)_writeTransientPhotosInto:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_photos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1BCCA7FA8]();
        objc_msgSend((id)objc_opt_class(), "_watchPhotoImageSize");
        v13 = v12;
        v15 = v14;
        v16 = (void *)objc_opt_class();
        objc_msgSend(v10, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "originalCrop");
        objc_msgSend(v16, "_cropAndScaleUIImage:cropRect:outputSize:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "_writeAsset:image:withImageCrop:to:", 0, v18, v4, 0.0, 0.0, v13, v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {

          objc_autoreleasePoolPop(v11);
          v5 = 0;
          goto LABEL_11;
        }
        v20 = v19;
        objc_msgSend(v19, "encodeAsDictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v21);

        objc_autoreleasePoolPop(v11);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photos, 0);
}

@end
