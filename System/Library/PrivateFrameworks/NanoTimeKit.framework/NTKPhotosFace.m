@implementation NTKPhotosFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)_customEditModes
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[NTKFace device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nrDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("5500A959-3C9D-4787-9235-2A1210C3559E"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  if (v5)
    return &unk_1E6CA8B90;
  else
    return &unk_1E6CA8BA8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  switch(a3)
  {
    case 10:
      -[NTKFace device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKPhotosColorEditOption optionWithColor:forDevice:](NTKPhotosColorEditOption, "optionWithColor:forDevice:", 3000, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[NTKFace device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKDateAlignmentEditOption optionWithAlignment:forDevice:](NTKDateAlignmentEditOption, "optionWithAlignment:forDevice:", 0, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[NTKFace device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKPhotosContentEditOption optionWithPhotosContent:forDevice:](NTKPhotosContentEditOption, "optionWithPhotosContent:forDevice:", 0, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v9 = 0;
      goto LABEL_9;
  }
  v9 = (void *)v8;

LABEL_9:
  return v9;
}

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  BOOL result;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NTKPhotosFace;
  result = objc_msgSendSuper2(&v6, sel__customEditModeIsRows_forDevice_, a3, a4);
  if (a3 == 12)
    return 1;
  return result;
}

+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5
{
  id v7;
  id v8;
  char v9;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  if (a3 != 12)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "photosContent") != 1)
  {
    if (!objc_msgSend(v7, "photosContent"))
    {
      objc_msgSend(v8, "nrDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("41714B27-B839-4AB5-8A36-6191015AA8FE"));
      v9 = objc_msgSend(v11, "supportsCapability:", v12);

      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v9 = 1;
LABEL_6:

  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  void *v4;
  objc_super v6;

  if (a3 == 12)
  {
    NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_LABEL_PHOTOS_CONTENT_COMPANION"), CFSTR("Photos"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NTKPhotosFace;
    objc_msgSendSuper2(&v6, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  return 14;
}

- (void)_prepareEditOptions
{
  self->_editing = 1;
}

- (void)_cleanupEditOptions
{
  self->_editing = 0;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKPhotosFace;
  return -[NTKFace _hasOptionsForCustomEditMode:](&v4, sel__hasOptionsForCustomEditMode_, a3);
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  __objc2_class *v7;
  void *v8;
  unint64_t v9;

  v6 = a4;
  switch(a3)
  {
    case 10:
      v7 = NTKPhotosColorEditOption;
      break;
    case 14:
      v7 = NTKDateAlignmentEditOption;
      break;
    case 12:
      v7 = NTKPhotosContentEditOption;
      break;
    default:
      v9 = 0;
      goto LABEL_9;
  }
  -[NTKFace device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[__objc2_class numberOfOptionsForDevice:](v7, "numberOfOptionsForDevice:", v8);

LABEL_9:
  return v9;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  __objc2_class *v9;
  void *v10;
  void *v11;

  v8 = a5;
  switch(a4)
  {
    case 10:
      v9 = NTKPhotosColorEditOption;
      break;
    case 14:
      v9 = NTKDateAlignmentEditOption;
      break;
    case 12:
      v9 = NTKPhotosContentEditOption;
      break;
    default:
      v11 = 0;
      goto LABEL_9;
  }
  -[NTKFace device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class optionAtIndex:forDevice:](v9, "optionAtIndex:forDevice:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v11;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  __objc2_class *v10;
  void *v11;
  unint64_t v12;

  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 10:
      v10 = NTKPhotosColorEditOption;
      break;
    case 14:
      v10 = NTKDateAlignmentEditOption;
      break;
    case 12:
      v10 = NTKPhotosContentEditOption;
      break;
    default:
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_9;
  }
  -[NTKFace device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[__objc2_class indexOfOption:forDevice:](v10, "indexOfOption:forDevice:", v8, v11);

LABEL_9:
  return v12;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 != 10 && a3 != 12 && a3 != 14)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKPhotosColorEditOption pigmentFaceDomain](NTKPhotosColorEditOption, "pigmentFaceDomain");
}

- (id)albumFaceContent
{
  return 0;
}

- (id)bundleIdentifierForUpgrade
{
  return CFSTR("com.apple.NTKParmesanFaceBundle");
}

- (id)upgradeContext
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _NTKPhotosPhotoFaceUpgradeContext *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;

  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKFace selectedOptionsForCustomEditModes](self, "selectedOptionsForCustomEditModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E6C9D978);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKFace selectedOptionsForCustomEditModes](self, "selectedOptionsForCustomEditModes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E6C9D990);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NTKFace complicationForSlot:](self, "complicationForSlot:", CFSTR("top"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFace complicationForSlot:](self, "complicationForSlot:", CFSTR("bottom"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFace selectedOptionsForCustomEditModes](self, "selectedOptionsForCustomEditModes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E6C9D960);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        v14 = -[_NTKPhotosPhotoFaceUpgradeContext initWithReader:contentOption:positionOption:topComplication:bottomComplication:colorOption:]([_NTKPhotosPhotoFaceUpgradeContext alloc], "initWithReader:contentOption:positionOption:topComplication:bottomComplication:colorOption:", v4, v6, v8, v9, v10, v13);

      }
      else
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[NTKPhotosFace upgradeContext].cold.1();

        v14 = 0;
      }

      v16 = v8;
    }
    else
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[NTKPhotosFace upgradeContext].cold.2();
      v14 = 0;
      v12 = v8;
    }

    v15 = v6;
    v6 = v12;
  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NTKPhotosFace upgradeContext].cold.3();
    v14 = 0;
  }

  return v14;
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
  return 1;
}

+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  char v9;
  NTKFaceBundleSortableGalleryFace *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithUUIDString:", CFSTR("F27862F8-5179-4DB0-9F89-179EA7CB4011"));
  v9 = objc_msgSend(v7, "supportsCapability:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 22, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setExternalAssets:", v5);
    objc_msgSend(v12, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKPhotosContentEditOption optionWithPhotosContent:forDevice:](NTKPhotosContentEditOption, "optionWithPhotosContent:forDevice:", 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "selectOption:forCustomEditMode:slot:", v14, 12, 0);
    if (v12)
      v10 = -[NTKFaceBundleSortableGalleryFace initWithFace:priority:]([NTKFaceBundleSortableGalleryFace alloc], "initWithFace:priority:", v12, 200);
    else
      v10 = 0;

  }
  return v10;
}

- (void)companionEditorWithAssets:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  char isKindOfClass;
  NTKCompanionCustomPhotosEditor *v10;
  void *v11;
  NTKCompanionTransientCustomPhotosEditor *v12;
  void *v13;
  NTKCompanionTransientCustomPhotosEditor *v14;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10 = [NTKCompanionCustomPhotosEditor alloc];
    -[NTKFace device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NTKCompanionCustomPhotosEditor initWithResourceDirectory:forDevice:](v10, "initWithResourceDirectory:forDevice:", 0, v11);

    -[NTKCompanionTransientCustomPhotosEditor addAssetsFromAssetList:](v14, "addAssetsFromAssetList:", v7);
  }
  else
  {
    v12 = [NTKCompanionTransientCustomPhotosEditor alloc];
    -[NTKFace device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NTKCompanionTransientCustomPhotosEditor initWithResourceDirectory:forDevice:](v12, "initWithResourceDirectory:forDevice:", 0, v13);

    -[NTKCompanionTransientCustomPhotosEditor addImageList:](v14, "addImageList:", v7);
  }

  v6[2](v6, v14);
}

- (id)_localizedStringForExternal:(id)a3 comment:(id)a4
{
  return NTKCompanionClockFaceLocalizedString(a3, a4);
}

- (void)upgradeContext
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1B72A3000, v0, v1, "%s: bad photo content edit option: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
