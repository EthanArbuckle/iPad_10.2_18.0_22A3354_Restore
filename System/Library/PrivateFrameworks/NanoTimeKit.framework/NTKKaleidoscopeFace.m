@implementation NTKKaleidoscopeFace

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKKaleidoscopeFace;
  v4 = -[NTKFace copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_cachedResourceDirectorySnapshotKey, "copy");
  v6 = (void *)v4[20];
  v4[20] = v5;

  return v4;
}

+ (id)_complicationSlotDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  NTKAllSmallComplicationTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAllUtilityLargeComplicationTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("top-left");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA4C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(4, v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("top-right");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA4E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(4, v2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("bottom-center");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA4F8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(3, v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_orderedComplicationSlots
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top-left");
  v3[1] = CFSTR("top-right");
  v3[2] = CFSTR("bottom-center");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_customEditModes
{
  return &unk_1E6CAA510;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  if (a3 == 12)
  {
    -[NTKFace device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeAssetOption, "optionWithAsset:forDevice:", 27, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 15)
    {
      v12 = 0;
      goto LABEL_10;
    }
    -[NTKFace device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deviceCategory");

    if (v8 == 1)
      v9 = 0;
    else
      v9 = 3;
    -[NTKFace device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKKaleidoscopeStyleOption optionWithStyle:forDevice:](NTKKaleidoscopeStyleOption, "optionWithStyle:forDevice:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

LABEL_10:
  return v12;
}

+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a4;
  v7 = v6;
  v8 = a3 == 12 && objc_msgSend(v6, "asset") == 1000;

  return v8;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  objc_class *v5;
  void *v6;
  unint64_t v7;

  v5 = -[NTKKaleidoscopeFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  -[NTKFace device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[objc_class numberOfOptionsForDevice:](v5, "numberOfOptionsForDevice:", v6);

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  objc_class *v7;
  void *v8;
  void *v9;

  v7 = -[NTKKaleidoscopeFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
  -[NTKFace device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class optionAtIndex:forDevice:](v7, "optionAtIndex:forDevice:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7;
  objc_class *v8;
  void *v9;
  unint64_t v10;

  v7 = a3;
  v8 = -[NTKKaleidoscopeFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
  -[NTKFace device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[objc_class indexOfOption:forDevice:](v8, "indexOfOption:forDevice:", v7, v9);

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  return -[NTKKaleidoscopeFace _optionClassForCustomEditMode:resourceDirectoryExists:](self, "_optionClassForCustomEditMode:resourceDirectoryExists:", a3, 1);
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3 resourceDirectoryExists:(BOOL)a4
{
  void *v4;

  if (a3 == 12)
    return (Class)(id)objc_opt_class();
  if (a3 == 15)
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (id)_resourceDirectorySnapshotKey
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSString *cachedResourceDirectorySnapshotKey;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;

  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_8;
  v4 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
    if (!cachedResourceDirectorySnapshotKey)
    {
      -[NTKFace resourceDirectory](self, "resourceDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NTKUniqueIDForNTKPhoto(v11);
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        v13 = self->_cachedResourceDirectorySnapshotKey;
        self->_cachedResourceDirectorySnapshotKey = v12;

      }
      cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
    }
    v14 = cachedResourceDirectorySnapshotKey;
  }
  else
  {
LABEL_8:
    v15 = self->_cachedResourceDirectorySnapshotKey;
    self->_cachedResourceDirectorySnapshotKey = 0;

    v14 = 0;
  }
  return v14;
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  NSString *cachedResourceDirectorySnapshotKey;
  void *v6;
  void *v7;

  cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
  self->_cachedResourceDirectorySnapshotKey = 0;

  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {

    if (v7)
      return;
  }
  else
  {
    if (!v6)
      return;

  }
  -[NTKFace _notifyObserversOptionsDidChangeForEditMode:](self, "_notifyObserversOptionsDidChangeForEditMode:", 12);
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v5 = a4;
  if (a3 == 12)
  {
    objc_msgSend(CFSTR("EDIT_MODE_LABEL_KALEIDOSCOPE_IMAGE_CONTENT"), "stringByAppendingString:", CFSTR("_COMPANION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Photo");
  }
  else
  {
    if (a3 != 15)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(CFSTR("EDIT_MODE_LABEL_STYLE"), "stringByAppendingString:", CFSTR("_COMPANION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Style");
  }
  NTKCompanionClockFaceLocalizedString(v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (id)editOptionThatHidesAllComplications
{
  void *v2;
  void *v3;

  -[NTKFace device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKKaleidoscopeStyleOption optionWithStyle:forDevice:](NTKKaleidoscopeStyleOption, "optionWithStyle:forDevice:", 3, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isUsingCustomAsset
{
  void *v2;
  BOOL v3;

  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NTKResourceDirectoryScrubber *v11;
  NTKResourceDirectoryScrubber *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v15 = v7;
  v8 = (void *)objc_opt_new();
  v16 = v8;
  v9 = (void *)objc_opt_new();
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [NTKResourceDirectoryScrubber alloc];
  v12 = -[NTKResourceDirectoryScrubber initWithOperations:](v11, "initWithOperations:", v10, v15, v16);
  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[NTKResourceDirectoryScrubber scrubDirectoryAtPath:toDestinationPath:error:](v12, "scrubDirectoryAtPath:toDestinationPath:error:", v13, v6, a4);

  return (char)a4;
}

- (BOOL)_sanitizeFaceConfiguration:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:](NTKKaleidoscopeResourcesManifest, "manifestForResourceDirectory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.resourceDirectory"), 2003, 0);
      v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v6, "validateManifestWithError:", a3))
    goto LABEL_9;
  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  objc_msgSend(v6, "imageList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = v9 == v11;

  if (a3 && v9 != v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.resourceDirectory"), 2003, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResourceDirectorySnapshotKey, 0);
}

- (id)libraryDetailViewController
{
  return -[NTKCFaceDetailViewController initWithLibraryFace:]([NTKCFaceDetailViewController alloc], "initWithLibraryFace:", self);
}

- (id)addFaceDetailViewController
{
  NTKCFaceDetailViewController *v3;
  void *v4;
  NTKCFaceDetailViewController *v5;

  v3 = [NTKCFaceDetailViewController alloc];
  -[NTKFace externalAssets](self, "externalAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NTKCFaceDetailViewController initWithCandidateFace:externalAssets:](v3, "initWithCandidateFace:externalAssets:", self, v4);

  return v5;
}

+ (BOOL)supportsExternalAssets
{
  char v2;
  void *v3;
  char v4;

  v2 = objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKShowBlueRidgeUI(v3);

  return v2 ^ v4 ^ 1;
}

+ (id)_sortableFaceOfStyle:(int64_t)a3 withAssets:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NTKFaceBundleSortableGalleryFace *v10;

  v5 = a4;
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setExternalAssets:", v5);
    objc_msgSend(v7, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeCustomAssetOption, "optionWithAsset:forDevice:", 1000, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "selectOption:forCustomEditMode:slot:", v9, 12, 0);
    if (v7)
      v10 = -[NTKFaceBundleSortableGalleryFace initWithFace:priority:]([NTKFaceBundleSortableGalleryFace alloc], "initWithFace:priority:", v7, 100);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)sortableFaceWithAssets:(id)a3
{
  return (id)objc_msgSend(a1, "_sortableFaceOfStyle:withAssets:", 23, a3);
}

- (void)companionEditorWithAssets:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  NTKCompanionKaleidoscopeEditor *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  NTKCompanionKaleidoscopeEditor *v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__49;
  v21 = __Block_byref_object_dispose__49;
  v10 = [NTKCompanionKaleidoscopeEditor alloc];
  -[NTKFace device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[NTKCompanionKaleidoscopeEditor initWithResourceDirectory:forDevice:](v10, "initWithResourceDirectory:forDevice:", 0, v11);

  objc_msgSend(v6, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)v18[5];
  if ((isKindOfClass & 1) != 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__NTKKaleidoscopeFace_ExternalAssets__companionEditorWithAssets_completion___block_invoke;
    v16[3] = &unk_1E6BD1738;
    v14 = v16;
    v16[4] = v7;
    v16[5] = &v17;
    objc_msgSend(v13, "setAsset:completion:", v12, v16);
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__NTKKaleidoscopeFace_ExternalAssets__companionEditorWithAssets_completion___block_invoke_2;
    v15[3] = &unk_1E6BD1738;
    v14 = v15;
    v15[4] = v7;
    v15[5] = &v17;
    objc_msgSend(v13, "setRawImage:completion:", v12, v15);
  }

  _Block_object_dispose(&v17, 8);
}

void __76__NTKKaleidoscopeFace_ExternalAssets__companionEditorWithAssets_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __76__NTKKaleidoscopeFace_ExternalAssets__companionEditorWithAssets_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end
