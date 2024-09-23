@implementation NTKCompanionKaleidoscopeEditor

- (NTKCompanionKaleidoscopeEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  NTKCompanionKaleidoscopeEditor *v4;
  NTKCompanionKaleidoscopeEditor *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKCompanionKaleidoscopeEditor;
  v4 = -[NTKCompanionResourceDirectoryEditor initWithResourceDirectory:forDevice:](&v8, sel_initWithResourceDirectory_forDevice_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[NTKCompanionResourceDirectoryEditor resourceDirectory](v4, "resourceDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[NTKCompanionKaleidoscopeEditor _readPickedPhoto](v5, "_readPickedPhoto");
    -[NTKCompanionResourceDirectoryEditor setState:](v5, "setState:", 1);
  }
  return v5;
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NTKPhoto *pickedPhoto;
  UIImage *pickedImage;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[4];
  id v16;

  v4 = a3;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") < 3)
  {
    if (-[NTKCompanionResourceDirectoryEditor state](self, "state") == 1)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_2;
      v13[3] = &unk_1E6BD00B0;
      v13[4] = self;
      v14 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v13);
      v5 = v14;
    }
    else if (self->_newAsset || self->_newImage)
    {
      -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 4);
      dispatch_get_global_queue(2, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_4;
      v9[3] = &unk_1E6BD00B0;
      v9[4] = self;
      v10 = v4;
      dispatch_async(v6, v9);

      v5 = v10;
    }
    else
    {
      pickedPhoto = self->_pickedPhoto;
      self->_pickedPhoto = 0;

      pickedImage = self->_pickedImage;
      self->_pickedImage = 0;

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_3;
      v11[3] = &unk_1E6BD00B0;
      v11[4] = self;
      v12 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v11);
      v5 = v12;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke;
    block[3] = &unk_1E6BCDF60;
    v16 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v5 = v16;
  }

}

uint64_t __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "resourceDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setGalleryPreviewResourceDirectory:", v2);

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "resourceDirectory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setResourceDirectory:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setGalleryPreviewResourceDirectory:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  _QWORD aBlock[4];
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  NTKPhotosCreateResourceDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_5;
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
    objc_msgSend((id)objc_opt_class(), "_writeAsset:image:withImageCrop:to:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), v3, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[NTKKaleidoscopePathfinder pathfinderWithImage:](NTKKaleidoscopePathfinder, "pathfinderWithImage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "writeToDirectory:", v3))
        goto LABEL_7;
      objc_msgSend(v8, "encodeAsDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = NTKPhotosWriteImageList(v11, v3);

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "_reinitializeWithPhoto:image:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
        v13 = 1;
      }
      else
      {
LABEL_7:
        v13 = 0;
      }
      v7[2](v7, v13);

    }
    else
    {
      v7[2](v7, 0);
    }

  }
  else
  {
    (*((void (**)(void *, _QWORD))v6 + 2))(v6, 0);
  }

}

void __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_5(uint64_t a1, char a2)
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
  v10[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_6;
  v10[3] = &unk_1E6BD0060;
  v13 = v6;
  v8 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setResourceDirectory:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setGalleryPreviewResourceDirectory:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)setPhoto:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  PHAsset *v10;
  PHAsset *newAsset;
  PHAsset *v12;
  PHAsset *v13;
  UIImage *newImage;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[5];
  void (**v18)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") < 3)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__NTKCompanionKaleidoscopeEditor_setPhoto_completion___block_invoke;
    aBlock[3] = &unk_1E6BD28C0;
    aBlock[4] = self;
    v18 = v7;
    v9 = _Block_copy(aBlock);
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "_fetchAssetForPhoto:", v6);
      v10 = (PHAsset *)objc_claimAutoreleasedReturnValue();
      newAsset = self->_newAsset;
      self->_newAsset = v10;

      v12 = self->_newAsset;
      if (v12)
      {
        v15[0] = v8;
        v15[1] = 3221225472;
        v15[2] = __54__NTKCompanionKaleidoscopeEditor_setPhoto_completion___block_invoke_2;
        v15[3] = &unk_1E6BD28E8;
        v15[4] = self;
        v16 = v9;
        _imageForAsset(v12, v15);

      }
      else
      {
        (*((void (**)(void *, _QWORD))v9 + 2))(v9, 0);
      }
    }
    else
    {
      v13 = self->_newAsset;
      self->_newAsset = 0;

      newImage = self->_newImage;
      self->_newImage = 0;

      (*((void (**)(void *, uint64_t))v9 + 2))(v9, 2);
    }

  }
  else
  {
    v7[2](v7);
  }

}

uint64_t __54__NTKCompanionKaleidoscopeEditor_setPhoto_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setState:", a2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__NTKCompanionKaleidoscopeEditor_setPhoto_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setAsset:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  PHAsset **p_newAsset;
  PHAsset *v12;
  PHAsset *v13;
  UIImage *newImage;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[5];
  void (**v18)(_QWORD);

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") < 3)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__NTKCompanionKaleidoscopeEditor_setAsset_completion___block_invoke;
    aBlock[3] = &unk_1E6BD28C0;
    aBlock[4] = self;
    v18 = v8;
    v10 = _Block_copy(aBlock);
    p_newAsset = &self->_newAsset;
    if (v7)
    {
      objc_storeStrong((id *)&self->_newAsset, a3);
      v12 = *p_newAsset;
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __54__NTKCompanionKaleidoscopeEditor_setAsset_completion___block_invoke_2;
      v15[3] = &unk_1E6BD28E8;
      v15[4] = self;
      v16 = v10;
      _imageForAsset(v12, v15);

    }
    else
    {
      v13 = *p_newAsset;
      *p_newAsset = 0;

      newImage = self->_newImage;
      self->_newImage = 0;

      (*((void (**)(void *, uint64_t))v10 + 2))(v10, 2);
    }

  }
  else
  {
    v8[2](v8);
  }

}

uint64_t __54__NTKCompanionKaleidoscopeEditor_setAsset_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setState:", a2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__NTKCompanionKaleidoscopeEditor_setAsset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setRawImage:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  UIImage *v7;
  UIImage *newImage;
  PHAsset *newAsset;
  NTKPhoto *pickedPhoto;
  UIImage *pickedImage;
  id v12;

  v12 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[NTKCompanionResourceDirectoryEditor state](self, "state")
    && -[NTKCompanionResourceDirectoryEditor state](self, "state") <= 2)
  {
    objc_msgSend((id)objc_opt_class(), "_scaleImage:toLongestEdgeInPixels:", v12, 768.0);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    newImage = self->_newImage;
    self->_newImage = v7;

    newAsset = self->_newAsset;
    self->_newAsset = 0;

    pickedPhoto = self->_pickedPhoto;
    self->_pickedPhoto = 0;

    pickedImage = self->_pickedImage;
    self->_pickedImage = 0;

    -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 2);
  }
  v6[2](v6);

}

- (int64_t)photosCount
{
  return self->_newAsset || self->_newImage || self->_pickedPhoto || self->_pickedImage != 0;
}

- (void)imageForPhotoWithCompletion:(id)a3
{
  void (**v4)(id, UIImage *);
  int64_t v5;
  UIImage *pickedImage;
  UIImage *v7;
  UIImage *v8;
  PHAsset *newAsset;
  _QWORD v10[5];
  void (**v11)(id, UIImage *);

  v4 = (void (**)(id, UIImage *))a3;
  v5 = -[NTKCompanionResourceDirectoryEditor state](self, "state");
  if (v5 == 1)
  {
    pickedImage = self->_pickedImage;
    if (!pickedImage)
    {
      NTKPhotosImageForPhoto(self->_pickedPhoto);
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v8 = self->_pickedImage;
      self->_pickedImage = v7;

      pickedImage = self->_pickedImage;
    }
    v4[2](v4, pickedImage);
  }
  else if (v5 == 2 && !self->_newImage)
  {
    newAsset = self->_newAsset;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__NTKCompanionKaleidoscopeEditor_imageForPhotoWithCompletion___block_invoke;
    v10[3] = &unk_1E6BD28E8;
    v10[4] = self;
    v11 = v4;
    _imageForAsset(newAsset, v10);

  }
  else
  {
    v4[2](v4, 0);
  }

}

void __62__NTKCompanionKaleidoscopeEditor_imageForPhotoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_readPickedPhoto
{
  void *v3;
  NTKPhoto *v4;
  NTKPhoto *pickedPhoto;
  id v6;

  -[NTKCompanionResourceDirectoryEditor resourceDirectory](self, "resourceDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v4 = (NTKPhoto *)objc_claimAutoreleasedReturnValue();
  pickedPhoto = self->_pickedPhoto;
  self->_pickedPhoto = v4;

}

+ (id)_fetchAssetForPhoto:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4CA8]);
}

- (void)_reinitializeWithPhoto:(id)a3 image:(id)a4
{
  NTKPhoto *v6;
  UIImage *v7;
  NTKPhoto *pickedPhoto;
  NTKPhoto *v9;
  UIImage *pickedImage;
  UIImage *v11;
  PHAsset *newAsset;
  UIImage *newImage;

  v6 = (NTKPhoto *)a3;
  v7 = (UIImage *)a4;
  pickedPhoto = self->_pickedPhoto;
  self->_pickedPhoto = v6;
  v9 = v6;

  pickedImage = self->_pickedImage;
  self->_pickedImage = v7;
  v11 = v7;

  newAsset = self->_newAsset;
  self->_newAsset = 0;

  newImage = self->_newImage;
  self->_newImage = 0;

  -[NTKCompanionResourceDirectoryEditor setState:](self, "setState:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newImage, 0);
  objc_storeStrong((id *)&self->_newAsset, 0);
  objc_storeStrong((id *)&self->_pickedImage, 0);
  objc_storeStrong((id *)&self->_pickedPhoto, 0);
}

@end
