@implementation NTKCPhotoFaceCollectionGalleryCollection

- (id)initForDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NTKCPhotoFaceCollectionGalleryCollection *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *albumName;
  NSObject *v15;
  _QWORD v17[4];
  NTKCPhotoFaceCollectionGalleryCollection *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v5 = a3;
  +[NTKCompanionFaceCollectionsManager sharedInstance](NTKCompanionFaceCollectionsManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedFaceCollectionForDevice:forCollectionIdentifier:", v5, CFSTR("PhotosFaces"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NTKCCustomizationLocalizedString(CFSTR("GALLERY_TITLE_PHOTOS"), (uint64_t)CFSTR("Photos"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)NTKCPhotoFaceCollectionGalleryCollection;
  v10 = -[NTKFaceCollectionGalleryCollection initWithTitle:faceCollection:](&v23, sel_initWithTitle_faceCollection_, v9, v7);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    objc_msgSend(v7, "addObserver:", v10);
    NTKCCustomizationLocalizedString(CFSTR("GALLERY_PHOTOS_DESCRIPTION"), (uint64_t)CFSTR("description"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGalleryCollection setDescriptionText:](v10, "setDescriptionText:", v12);

    objc_initWeak(&location, v10);
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke;
    v20[3] = &unk_1E6BD5A70;
    objc_copyWeak(&v21, &location);
    -[NTKGalleryCollection setCalloutName:](v10, "setCalloutName:", v20);
    albumName = v10->_albumName;
    v10->_albumName = (NSString *)&stru_1E6BDC918;

    dispatch_get_global_queue(17, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke_165;
    v17[3] = &unk_1E6BCD778;
    v18 = v10;
    v19 = v5;
    dispatch_async(v15, v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v10;
}

id __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  if (objc_msgSend(v3, "faceStyle") == 13
    || objc_msgSend(v3, "faceStyle") == 22
    && (objc_msgSend(v3, "selectedOptionsForCustomEditModes"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E6C9F328),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v9 = objc_msgSend(v8, "photosContent"),
        v8,
        !v9))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
      v6 = WeakRetained[7];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke_165(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  +[NTKSyncedAlbumObserver sharedInstance](NTKSyncedAlbumObserver, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "syncedAlbumNameForDevice:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke_2;
  v5[3] = &unk_1E6BCD778;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "galleryCollectionDidChange:shouldUpdateSnaphots:", *(_QWORD *)(a1 + 32), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[NTKSyncedAlbumObserver sharedInstance](NTKSyncedAlbumObserver, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forDevice:", self, self->_device);

  v4.receiver = self;
  v4.super_class = (Class)NTKCPhotoFaceCollectionGalleryCollection;
  -[NTKCPhotoFaceCollectionGalleryCollection dealloc](&v4, sel_dealloc);
}

- (id)newFace
{
  +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 22, self->_device);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)photoAlbumChanged
{
  void *v3;
  NSString *v4;
  NSString *albumName;
  id v6;

  +[NTKSyncedAlbumObserver sharedInstance](NTKSyncedAlbumObserver, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncedAlbumNameForDevice:", self->_device);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  albumName = self->_albumName;
  self->_albumName = v4;

  -[NTKGalleryCollection delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "galleryCollectionDidChange:shouldUpdateSnaphots:", self, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
