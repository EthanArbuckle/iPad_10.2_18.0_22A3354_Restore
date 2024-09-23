@implementation NTKCFaceDetailPhotosSectionController

+ (BOOL)hasPhotosSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "faceStyle");
  return a4 == 12 && v5 == 22;
}

- (NTKCFaceDetailPhotosSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7 externalAssets:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NTKCFaceDetailPhotosSectionController *v21;
  NTKCFaceDetailPhotosSectionController *v22;
  objc_super v24;

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    objc_msgSend(v16, "filteredCollectionWithObjectsPassingTest:", &__block_literal_global_133);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v16;
  }
  v20 = v19;
  v24.receiver = self;
  v24.super_class = (Class)NTKCFaceDetailPhotosSectionController;
  v21 = -[NTKCFaceDetailEditOptionVerticalSectionController initWithTableViewController:face:inGallery:editOptionCollection:faceView:](&v24, sel_initWithTableViewController_face_inGallery_editOptionCollection_faceView_, v14, v15, v11, v19, v17);
  v22 = v21;
  if (v21)
    -[NTKCFaceDetailPhotosSectionController setExternalAssets:](v21, "setExternalAssets:", v18);

  return v22;
}

BOOL __129__NTKCFaceDetailPhotosSectionController_initWithTableViewController_face_inGallery_editOptionCollection_faceView_externalAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "photosContent") == 1;
}

- (Class)actionRowCellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canAddFace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  NTKCompanionTransientCustomPhotosEditor *transientEditor;

  -[NTKCFaceDetailEditOptionSectionController selectedOptions](self, "selectedOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "photosContent");
  if (v8)
    v9 = v8 == 2;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 1;
  }
  else if (v8 == 1)
  {
    transientEditor = self->_transientEditor;
    if (!transientEditor)
      transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
    v10 = -[NTKCompanionTransientCustomPhotosEditor photosCount](transientEditor, "photosCount") != 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)contentType
{
  return self->_currentContent;
}

- (void)faceDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailPhotosSectionController;
  -[NTKCFaceDetailEditOptionVerticalSectionController faceDidChange](&v3, sel_faceDidChange);
  -[NTKCFaceDetailPhotosSectionController _updatePhotosSection](self, "_updatePhotosSection");
}

- (void)faceDidChangeResourceDirectory
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailPhotosSectionController;
  -[NTKCFaceDetailSectionController faceDidChangeResourceDirectory](&v3, sel_faceDidChangeResourceDirectory);
  -[NTKCFaceDetailPhotosSectionController _updatePhotosSection](self, "_updatePhotosSection");
}

- (void)setSelectedOptions:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t currentContent;
  unint64_t v11;
  void *v12;
  NSArray *externalAssets;
  void *v14;
  char isKindOfClass;
  NTKCompanionTransientCustomPhotosEditor *transientEditor;
  NTKCompanionTransientCustomPhotosEditor *v17;
  void *v18;
  void *v19;
  NTKCompanionTransientCustomPhotosEditor *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  NTKCompanionSyncedAlbumEditor *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NTKCompanionSyncedAlbumEditor *v30;
  NTKCompanionSyncedAlbumEditor *syncedAlbumEditor;
  void *v32;
  NTKCompanionMemoriesEditor *v33;
  objc_class *v34;
  uint64_t v35;
  NSArray *v36;
  void *v37;
  char v38;
  NTKCompanionCustomPhotosEditor *v39;
  void *v40;
  void *v41;
  NTKCompanionCustomPhotosEditor *v42;
  NTKCompanionCustomPhotosEditor *customPhotosEditor;
  _BOOL4 v44;
  void *memoriesEditor;
  NTKCompanionSyncedAlbumEditor *v46;
  void *v47;
  void *v48;
  NTKCompanionSyncedAlbumEditor *v49;
  NTKCompanionSyncedAlbumEditor *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  NTKCompanionMemoriesEditor *v54;
  void *v55;
  void *v56;
  NTKCompanionMemoriesEditor *v57;
  NTKCompanionMemoriesEditor *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  NTKCompanionCustomPhotosEditor *v64;
  NTKCompanionCustomPhotosEditor *v65;
  void *v66;
  void *v67;
  NTKCompanionCustomPhotosEditor *v68;
  NTKCompanionCustomPhotosEditor *v69;
  void *v70;
  NTKCompanionCustomPhotosEditor *v71;
  uint64_t v72;
  NTKCompanionSyncedAlbumEditor *v73;
  void *v74;
  void *v75;
  NTKCompanionSyncedAlbumEditor *v76;
  NTKCompanionSyncedAlbumEditor *v77;
  void *v78;
  _QWORD *v79;
  void *v80;
  void *v81;
  NTKCompanionCustomPhotosEditor *v82;
  void *v83;
  NTKCompanionCustomPhotosEditor *v84;
  void *v85;
  void *v86;
  NTKCompanionCustomPhotosEditor *v87;
  NTKCompanionCustomPhotosEditor *v88;
  void *v89;
  void *v90;
  NTKCompanionMemoriesEditor *v91;
  void *v92;
  void *v93;
  NTKCompanionMemoriesEditor *v94;
  NTKCompanionMemoriesEditor *v95;
  NTKCompanionCustomPhotosEditor *v96;
  void *v97;
  NTKCompanionCustomPhotosEditor *v98;
  void *v99;
  _QWORD v100[5];
  _QWORD v101[5];
  _QWORD v102[5];
  _QWORD v103[5];
  _QWORD v104[5];
  _QWORD v105[5];
  _QWORD v106[5];
  objc_super v107;

  v107.receiver = self;
  v107.super_class = (Class)NTKCFaceDetailPhotosSectionController;
  v4 = a3;
  -[NTKCFaceDetailEditOptionVerticalSectionController setSelectedOptions:](&v107, sel_setSelectedOptions_, v4);
  v5 = *(_OWORD *)&self->_syncedAlbumEditor == 0 && !self->_customPhotosEditor && self->_transientEditor == 0;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "mode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 || (currentContent = self->_currentContent, currentContent != objc_msgSend(v9, "photosContent")))
  {
    v11 = objc_msgSend(v9, "photosContent");
    self->_currentContent = v11;
    if (v11)
    {
      if (v11 != 2)
      {
        if (v11 != 1)
        {
LABEL_65:
          -[NTKCFaceDetailEditOptionVerticalSectionController reloadActionRow](self, "reloadActionRow");
          goto LABEL_66;
        }
        NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_PHOTOS_OPTION_DESCRIPTION"), CFSTR("Photos"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCFaceDetailEditOptionVerticalSectionController setFooter:](self, "setFooter:", v12);

        externalAssets = self->_externalAssets;
        if (externalAssets)
        {
          -[NSArray firstObject](externalAssets, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            transientEditor = self->_transientEditor;
            if (!transientEditor)
            {
              v17 = [NTKCompanionTransientCustomPhotosEditor alloc];
              -[NTKCFaceDetailSectionController face](self, "face");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "device");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = -[NTKCompanionTransientCustomPhotosEditor initWithResourceDirectory:forDevice:](v17, "initWithResourceDirectory:forDevice:", 0, v19);
              -[NTKCFaceDetailPhotosSectionController setTransientEditor:](self, "setTransientEditor:", v20);

              -[NTKCompanionTransientCustomPhotosEditor addImageList:](self->_transientEditor, "addImageList:", self->_externalAssets);
              transientEditor = self->_transientEditor;
            }
            -[NTKCompanionResourceDirectoryEditor galleryPreviewResourceDirectory](transientEditor, "galleryPreviewResourceDirectory");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v22 = self->_transientEditor;
            if (!v21)
            {
              v106[0] = MEMORY[0x1E0C809B0];
              v106[1] = 3221225472;
              v106[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke;
              v106[3] = &unk_1E6BCF688;
              v106[4] = self;
              v23 = v106;
LABEL_64:
              objc_msgSend(v22, "generateGalleryPreviewResourceDirectoryWithCompletion:", v23);
              goto LABEL_65;
            }
            goto LABEL_33;
          }
        }
        if (v5)
        {
          v36 = self->_externalAssets;
          if (v36)
          {
            -[NSArray firstObject](v36, "firstObject");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v38 = objc_opt_isKindOfClass();

            if ((v38 & 1) != 0)
            {
              v39 = [NTKCompanionCustomPhotosEditor alloc];
              -[NTKCFaceDetailSectionController face](self, "face");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "device");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = -[NTKCompanionCustomPhotosEditor initWithResourceDirectory:forDevice:](v39, "initWithResourceDirectory:forDevice:", 0, v41);
              customPhotosEditor = self->_customPhotosEditor;
              self->_customPhotosEditor = v42;

              -[NTKCompanionCustomPhotosEditor addAssetsFromAssetList:](self->_customPhotosEditor, "addAssetsFromAssetList:", self->_externalAssets);
              v22 = self->_customPhotosEditor;
              v105[0] = MEMORY[0x1E0C809B0];
              v105[1] = 3221225472;
              v105[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_2;
              v105[3] = &unk_1E6BCF688;
              v105[4] = self;
              v23 = v105;
              goto LABEL_64;
            }
          }
          v82 = [NTKCompanionCustomPhotosEditor alloc];
          -[NTKCFaceDetailSectionController face](self, "face");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "resourceDirectory");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKCFaceDetailSectionController face](self, "face");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "device");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[NTKCompanionCustomPhotosEditor initWithResourceDirectory:forDevice:](v82, "initWithResourceDirectory:forDevice:", v27, v29);
          v35 = 160;
          goto LABEL_46;
        }
        v63 = -[NTKCFaceDetailSectionController inGallery](self, "inGallery");
        v64 = self->_customPhotosEditor;
        if (v63)
        {
          if (!v64)
          {
            v65 = [NTKCompanionCustomPhotosEditor alloc];
            -[NTKCFaceDetailSectionController face](self, "face");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "device");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = -[NTKCompanionCustomPhotosEditor initWithResourceDirectory:forDevice:](v65, "initWithResourceDirectory:forDevice:", 0, v67);
            v69 = self->_customPhotosEditor;
            self->_customPhotosEditor = v68;

            v64 = self->_customPhotosEditor;
          }
          -[NTKCompanionResourceDirectoryEditor galleryPreviewResourceDirectory](v64, "galleryPreviewResourceDirectory");
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          v71 = self->_customPhotosEditor;
          if (v70)
          {
            -[NTKCompanionResourceDirectoryEditor galleryPreviewResourceDirectory](v71, "galleryPreviewResourceDirectory");
            v72 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[NTKCompanionResourceDirectoryEditor resourceDirectory](v71, "resourceDirectory");
            v97 = (void *)objc_claimAutoreleasedReturnValue();

            v98 = self->_customPhotosEditor;
            if (!v97)
            {
              v104[0] = MEMORY[0x1E0C809B0];
              v104[1] = 3221225472;
              v104[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_3;
              v104[3] = &unk_1E6BCF688;
              v104[4] = self;
              -[NTKCompanionCustomPhotosEditor generateGalleryPreviewResourceDirectoryWithCompletion:](v98, "generateGalleryPreviewResourceDirectoryWithCompletion:", v104);
              goto LABEL_60;
            }
            -[NTKCompanionResourceDirectoryEditor resourceDirectory](v98, "resourceDirectory");
            v72 = objc_claimAutoreleasedReturnValue();
          }
          v89 = (void *)v72;
          -[NTKCFaceDetailSectionController face](self, "face");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "setResourceDirectory:", v89);

        }
        else
        {
          if (!v64)
          {
            v84 = [NTKCompanionCustomPhotosEditor alloc];
            -[NTKCFaceDetailSectionController face](self, "face");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "device");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = -[NTKCompanionCustomPhotosEditor initWithResourceDirectory:forDevice:](v84, "initWithResourceDirectory:forDevice:", 0, v86);
            v88 = self->_customPhotosEditor;
            self->_customPhotosEditor = v87;

          }
          -[NTKCFaceDetailSectionController face](self, "face");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setResourceDirectory:", 0);
        }

LABEL_60:
        if (!self->_externalAssets
          && !-[NTKCompanionCustomPhotosEditor photosCount](self->_customPhotosEditor, "photosCount"))
        {
          -[NTKCFaceDetailPhotosSectionController _handleDidSelectActionRowForOption:](self, "_handleDidSelectActionRowForOption:", v9);
        }
        goto LABEL_65;
      }
      NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_DYNAMIC_OPTION_DESCRIPTION"), CFSTR("Dynamic"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionVerticalSectionController setFooter:](self, "setFooter:", v32);

      if (v5)
      {
        v33 = [NTKCompanionMemoriesEditor alloc];
        -[NTKCFaceDetailSectionController face](self, "face");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "resourceDirectory");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCFaceDetailSectionController face](self, "face");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "device");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[NTKCompanionSinglePHAssetEditor initWithResourceDirectory:forDevice:shouldFinalize:](v33, "initWithResourceDirectory:forDevice:shouldFinalize:", v27, v29, -[NTKCFaceDetailSectionController inGallery](self, "inGallery"));
        v35 = 176;
LABEL_46:
        v83 = *(Class *)((char *)&self->super.super.super.super.isa + v35);
        *(Class *)((char *)&self->super.super.super.super.isa + v35) = v34;

        goto LABEL_47;
      }
      v53 = -[NTKCFaceDetailSectionController inGallery](self, "inGallery");
      memoriesEditor = self->_memoriesEditor;
      if (v53)
      {
        if (!memoriesEditor)
        {
          v54 = [NTKCompanionMemoriesEditor alloc];
          -[NTKCFaceDetailSectionController face](self, "face");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "device");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = -[NTKCompanionSinglePHAssetEditor initWithResourceDirectory:forDevice:shouldFinalize:](v54, "initWithResourceDirectory:forDevice:shouldFinalize:", 0, v56, 1);
          v58 = self->_memoriesEditor;
          self->_memoriesEditor = v57;

          memoriesEditor = self->_memoriesEditor;
        }
        objc_msgSend(memoriesEditor, "galleryPreviewResourceDirectory");
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = self->_memoriesEditor;
        if (v59)
        {
LABEL_33:
          objc_msgSend(v22, "galleryPreviewResourceDirectory");
          v60 = objc_claimAutoreleasedReturnValue();
LABEL_34:
          v61 = (void *)v60;
          -[NTKCFaceDetailSectionController face](self, "face");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setResourceDirectory:", v61);

          goto LABEL_65;
        }
        objc_msgSend(v22, "resourceDirectory");
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = self->_memoriesEditor;
        if (!v90)
        {
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v101[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_6;
          v101[3] = &unk_1E6BCF688;
          v101[4] = self;
          v23 = v101;
          goto LABEL_64;
        }
LABEL_52:
        objc_msgSend(v22, "resourceDirectory");
        v60 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if (memoriesEditor)
      {
LABEL_44:
        objc_msgSend(memoriesEditor, "resourceDirectory");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCFaceDetailSectionController face](self, "face");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setResourceDirectory:", v80);

LABEL_55:
        v96 = self->_customPhotosEditor;
        self->_customPhotosEditor = 0;

        goto LABEL_65;
      }
      v91 = [NTKCompanionMemoriesEditor alloc];
      -[NTKCFaceDetailSectionController face](self, "face");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "device");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = -[NTKCompanionSinglePHAssetEditor initWithResourceDirectory:forDevice:shouldFinalize:](v91, "initWithResourceDirectory:forDevice:shouldFinalize:", 0, v93, 1);
      v95 = self->_memoriesEditor;
      self->_memoriesEditor = v94;

      v78 = self->_memoriesEditor;
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_7;
      v100[3] = &unk_1E6BCF688;
      v100[4] = self;
      v79 = v100;
    }
    else
    {
      NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_SYNCED_ALBUM_OPTION_DESCRIPTION"), CFSTR("Synced Album"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionVerticalSectionController setFooter:](self, "setFooter:", v24);

      if (v5)
      {
        v25 = [NTKCompanionSyncedAlbumEditor alloc];
        -[NTKCFaceDetailSectionController face](self, "face");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "resourceDirectory");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCFaceDetailSectionController face](self, "face");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "device");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[NTKCompanionSinglePHAssetEditor initWithResourceDirectory:forDevice:shouldFinalize:](v25, "initWithResourceDirectory:forDevice:shouldFinalize:", v27, v29, -[NTKCFaceDetailSectionController inGallery](self, "inGallery"));
        syncedAlbumEditor = self->_syncedAlbumEditor;
        self->_syncedAlbumEditor = v30;

LABEL_47:
        goto LABEL_65;
      }
      v44 = -[NTKCFaceDetailSectionController inGallery](self, "inGallery");
      memoriesEditor = self->_syncedAlbumEditor;
      if (v44)
      {
        if (!memoriesEditor)
        {
          v46 = [NTKCompanionSyncedAlbumEditor alloc];
          -[NTKCFaceDetailSectionController face](self, "face");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "device");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = -[NTKCompanionSinglePHAssetEditor initWithResourceDirectory:forDevice:shouldFinalize:](v46, "initWithResourceDirectory:forDevice:shouldFinalize:", 0, v48, 1);
          v50 = self->_syncedAlbumEditor;
          self->_syncedAlbumEditor = v49;

          memoriesEditor = self->_syncedAlbumEditor;
        }
        objc_msgSend(memoriesEditor, "galleryPreviewResourceDirectory");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = self->_syncedAlbumEditor;
        if (v51)
          goto LABEL_33;
        objc_msgSend(v22, "resourceDirectory");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = self->_syncedAlbumEditor;
        if (!v52)
        {
          v103[0] = MEMORY[0x1E0C809B0];
          v103[1] = 3221225472;
          v103[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_4;
          v103[3] = &unk_1E6BCF688;
          v103[4] = self;
          v23 = v103;
          goto LABEL_64;
        }
        goto LABEL_52;
      }
      if (memoriesEditor)
        goto LABEL_44;
      v73 = [NTKCompanionSyncedAlbumEditor alloc];
      -[NTKCFaceDetailSectionController face](self, "face");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "device");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = -[NTKCompanionSinglePHAssetEditor initWithResourceDirectory:forDevice:shouldFinalize:](v73, "initWithResourceDirectory:forDevice:shouldFinalize:", 0, v75, 1);
      v77 = self->_syncedAlbumEditor;
      self->_syncedAlbumEditor = v76;

      v78 = self->_syncedAlbumEditor;
      v102[0] = MEMORY[0x1E0C809B0];
      v102[1] = 3221225472;
      v102[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_5;
      v102[3] = &unk_1E6BCF688;
      v102[4] = self;
      v79 = v102;
    }
    objc_msgSend(v78, "finalizeWithCompletion:", v79);
    goto LABEL_55;
  }
LABEL_66:

}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "face");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceDirectory:", v3);

}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "face");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceDirectory:", v3);

}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "face");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceDirectory:", v3);

}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "face");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceDirectory:", v3);

}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "face");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceDirectory:", v3);

}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "face");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceDirectory:", v3);

}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "face");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceDirectory:", v3);

}

- (BOOL)_canDisplayActionRowForCustomEditMode:(int64_t)a3 andOption:(id)a4
{
  id v6;
  NTKCompanionTransientCustomPhotosEditor *transientEditor;
  BOOL v8;
  objc_super v10;

  v6 = a4;
  if (!self->_externalAssets)
    goto LABEL_5;
  transientEditor = self->_transientEditor;
  if (!transientEditor)
    transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
  if (!-[NTKCompanionTransientCustomPhotosEditor photosCount](transientEditor, "photosCount"))
  {
    v8 = 0;
  }
  else
  {
LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)NTKCFaceDetailPhotosSectionController;
    v8 = -[NTKCFaceDetailEditOptionSectionController _canDisplayActionRowForCustomEditMode:andOption:](&v10, sel__canDisplayActionRowForCustomEditMode_andOption_, a3, v6);
  }

  return v8;
}

- (BOOL)_handleDidSelectOption:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  NTKCFaceDetailPhotosSectionController *v27;
  id v28;

  v4 = a3;
  if (objc_msgSend(v4, "photosContent") == 1 || -[NTKCFaceDetailSectionController inGallery](self, "inGallery"))
    goto LABEL_6;
  if (self->_currentContent != 1 || self->_canDeleteCustomPhotos)
  {
    self->_canDeleteCustomPhotos = 0;
LABEL_6:
    v5 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "photosContent"))
  {
    if (objc_msgSend(v4, "photosContent") != 2)
    {
      v10 = 0;
      goto LABEL_14;
    }
    v8 = CFSTR("PHOTOS_DELETE_CUSTOM_FOR_MEMORY_MESSAGE");
    v9 = CFSTR("delete for memory custom message");
  }
  else
  {
    v8 = CFSTR("PHOTOS_DELETE_CUSTOM_FOR_SYNCED_ALBUM_MESSAGE");
    v9 = CFSTR("delete for synced album custom message");
  }
  NTKCCustomizationLocalizedString(v8, (uint64_t)v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKCompanionCustomPhotosEditor photosCount](self->_customPhotosEditor, "photosCount") == 1)
    v12 = CFSTR("_SINGULAR");
  else
    v12 = CFSTR("_PLURAL");
  objc_msgSend(CFSTR("PHOTOS_DELETE_BUTTON"), "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NTKCCustomizationLocalizedString(v13, (uint64_t)CFSTR("Delete Confirmation"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0DC3448];
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __64__NTKCFaceDetailPhotosSectionController__handleDidSelectOption___block_invoke;
  v26 = &unk_1E6BD8258;
  v27 = self;
  v28 = v4;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v15, 2, &v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17, v23, v24, v25, v26, v27);

  v18 = (void *)MEMORY[0x1E0DC3448];
  NTKCCustomizationLocalizedString(CFSTR("PHOTOS_CANCEL_BUTTON"), (uint64_t)CFSTR("Cancel"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v21);

  -[NTKCFaceDetailPhotosSectionController parentViewController](self, "parentViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "presentViewController:animated:completion:", v11, 1, 0);

  v5 = 0;
LABEL_7:

  return v5;
}

uint64_t __64__NTKCFaceDetailPhotosSectionController__handleDidSelectOption___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = 1;
  objc_msgSend(*(id *)(a1 + 32), "actionRow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "rows");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "actionRow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "indexOfObject:", v4);

  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  objc_msgSend(*(id *)(a1 + 32), "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v8 < v5)
    v10 = v8;
  else
    v10 = v8 + 1;
  return objc_msgSend(*(id *)(a1 + 32), "didSelectRow:", v10);
}

- (BOOL)_handleDidSelectActionRowForOption:(id)a3
{
  id v4;
  NTKCompanionTransientCustomPhotosEditor *transientEditor;
  NTKCompanionTransientCustomPhotosEditor *v6;
  NTKCFaceDetailCustomPhotosViewController *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  NTKCFaceDetailCustomPhotosViewController *v11;
  void *v12;
  BOOL v13;
  NTKCFaceDetailAlbumChooserViewController *v14;
  NTKCompanionSyncedAlbumEditor *syncedAlbumEditor;
  void *v16;
  NTKCFaceDetailAlbumChooserViewController *v17;
  void *v18;
  _QWORD v20[5];

  v4 = a3;
  if (objc_msgSend(v4, "photosContent") == 1)
  {
    if (-[NTKCompanionCustomPhotosEditor photosCount](self->_customPhotosEditor, "photosCount")
      || -[NTKCompanionTransientCustomPhotosEditor photosCount](self->_transientEditor, "photosCount"))
    {
      transientEditor = self->_transientEditor;
      if (!transientEditor)
        transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
      v6 = transientEditor;
      v7 = [NTKCFaceDetailCustomPhotosViewController alloc];
      -[NTKCFaceDetailSectionController face](self, "face");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NTKCFaceDetailSectionController inGallery](self, "inGallery");
      -[NTKCFaceDetailEditOptionSectionController faceView](self, "faceView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NTKCFaceDetailCustomPhotosViewController initWithPhotosEditor:forFace:inGallery:faceView:externalImagesSet:](v7, "initWithPhotosEditor:forFace:inGallery:faceView:externalImagesSet:", v6, v8, v9, v10, self->_externalAssets != 0);

      -[NTKCFaceDetailCustomPhotosViewController setDelegate:](v11, "setDelegate:", self);
      -[NTKCFaceDetailPhotosSectionController parentViewController](self, "parentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);
    }
    else
    {
      -[NTKCFaceDetailPhotosSectionController parentViewController](self, "parentViewController");
      v11 = (NTKCFaceDetailCustomPhotosViewController *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __76__NTKCFaceDetailPhotosSectionController__handleDidSelectActionRowForOption___block_invoke;
      v20[3] = &unk_1E6BD8280;
      v20[4] = self;
      +[NTKCPhotosAddController presentPhotosAddControllerFromViewController:selectionLimit:withCompletion:](NTKCPhotosAddController, "presentPhotosAddControllerFromViewController:selectionLimit:withCompletion:", v11, 24, v20);
    }

    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "photosContent"))
  {
    v14 = [NTKCFaceDetailAlbumChooserViewController alloc];
    syncedAlbumEditor = self->_syncedAlbumEditor;
    -[NTKCFaceDetailSectionController face](self, "face");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NTKCFaceDetailAlbumChooserViewController initWithPhotosEditor:forFace:inGallery:](v14, "initWithPhotosEditor:forFace:inGallery:", syncedAlbumEditor, v16, -[NTKCFaceDetailSectionController inGallery](self, "inGallery"));

    -[NTKCFaceDetailAlbumChooserViewController setDelegate:](v17, "setDelegate:", self);
    -[NTKCFaceDetailPhotosSectionController parentViewController](self, "parentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentViewController:animated:completion:", v17, 1, 0);

LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v13 = 1;
LABEL_12:

  return v13;
}

uint64_t __76__NTKCFaceDetailPhotosSectionController__handleDidSelectActionRowForOption___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setPhotos:");
  return 0;
}

- (id)_actionNameForOption:(id)a3
{
  id v4;
  id v5;
  NTKCompanionTransientCustomPhotosEditor *transientEditor;
  NTKCompanionTransientCustomPhotosEditor *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "photosContent") == 1)
    {
      transientEditor = self->_transientEditor;
      if (!transientEditor)
        transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
      v7 = transientEditor;
      v8 = -[NTKCompanionTransientCustomPhotosEditor photosCount](v7, "photosCount");
      if (v8)
      {
        v10 = v8;
        v11 = (void *)MEMORY[0x1E0CB3940];
        NTKCCustomizationLocalizedFormat(CFSTR("PHOTOS_NUMBER"), (uint64_t)CFSTR("%d Photos"), v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17.receiver = self;
        v17.super_class = (Class)NTKCFaceDetailPhotosSectionController;
        -[NTKCFaceDetailEditOptionSectionController _actionNameForOption:](&v17, sel__actionNameForOption_, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v13 = 0;
    }
    if (!objc_msgSend(v5, "photosContent"))
    {
      -[NTKCompanionSinglePHAssetEditor albumName](self->_syncedAlbumEditor, "albumName");
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
      if (!v14)
      {
        v16.receiver = self;
        v16.super_class = (Class)NTKCFaceDetailPhotosSectionController;
        -[NTKCFaceDetailEditOptionSectionController _actionNameForOption:](&v16, sel__actionNameForOption_, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NTKCFaceDetailPhotosSectionController;
    -[NTKCFaceDetailEditOptionSectionController _actionNameForOption:](&v18, sel__actionNameForOption_, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NTKCompanionTransientCustomPhotosEditor *transientEditor;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKCFaceDetailPhotosSectionController _actionNameForOption:](self, "_actionNameForOption:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    if (objc_msgSend(v6, "photosContent"))
    {
      transientEditor = self->_transientEditor;
      if (!transientEditor)
        transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
      if (-[NTKCompanionTransientCustomPhotosEditor photosCount](transientEditor, "photosCount"))
        goto LABEL_6;
    }
    else
    {
      -[NTKCompanionSinglePHAssetEditor albumName](self->_syncedAlbumEditor, "albumName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 1;
LABEL_9:
        objc_msgSend(v14, "textLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTextColor:", v10);

        objc_msgSend(v14, "setAccessoryType:", v11);
        goto LABEL_10;
      }
    }
    NTKCActionColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_setPhotos:(id)a3
{
  NTKCompanionCustomPhotosEditor *customPhotosEditor;
  _QWORD v5[5];

  -[NTKCompanionCustomPhotosEditor addPhotosFromUIImagePicker:](self->_customPhotosEditor, "addPhotosFromUIImagePicker:", a3);
  -[NTKCFaceDetailPhotosSectionController _updatePhotosSection](self, "_updatePhotosSection");
  if (-[NTKCFaceDetailSectionController inGallery](self, "inGallery"))
  {
    customPhotosEditor = self->_customPhotosEditor;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__NTKCFaceDetailPhotosSectionController__setPhotos___block_invoke;
    v5[3] = &unk_1E6BCF688;
    v5[4] = self;
    -[NTKCompanionCustomPhotosEditor generateGalleryPreviewResourceDirectoryWithCompletion:](customPhotosEditor, "generateGalleryPreviewResourceDirectoryWithCompletion:", v5);
  }
  else
  {
    -[NTKCFaceDetailPhotosSectionController saveChangesWithCompletion:](self, "saveChangesWithCompletion:", 0);
  }
}

void __52__NTKCFaceDetailPhotosSectionController__setPhotos___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "face");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResourceDirectory:", v4);

  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "face");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "updated preview directory for custom face to %@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)_updatePhotosSection
{
  unint64_t currentContent;
  NTKCompanionTransientCustomPhotosEditor *transientEditor;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;

  currentContent = self->_currentContent;
  if (currentContent == 1)
  {
    transientEditor = self->_transientEditor;
    if (!transientEditor)
      transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
    v5 = -[NTKCompanionTransientCustomPhotosEditor photosCount](transientEditor, "photosCount");
    -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (self->_externalAssets)
        v7 = v5 == 0;
      else
        v7 = 0;
      if (v7)
        -[NTKCFaceDetailEditOptionVerticalSectionController reloadActionRow](self, "reloadActionRow");
      else
        -[NTKCFaceDetailEditOptionSectionController _refreshActionRowContent](self, "_refreshActionRowContent");
    }
    currentContent = self->_currentContent;
  }
  if (!currentContent)
  {
    -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NTKCFaceDetailEditOptionSectionController _refreshActionRowContent](self, "_refreshActionRowContent");
      -[NTKCFaceDetailEditOptionVerticalSectionController reloadActionRow](self, "reloadActionRow");
    }
  }
  -[NTKCFaceDetailEditOptionSectionController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoSectionDidUpdate:", self);

}

- (id)_currentEditor
{
  unint64_t currentContent;
  int *v3;
  NTKCompanionTransientCustomPhotosEditor *transientEditor;

  currentContent = self->_currentContent;
  switch(currentContent)
  {
    case 0uLL:
      v3 = &OBJC_IVAR___NTKCFaceDetailPhotosSectionController__syncedAlbumEditor;
      goto LABEL_8;
    case 1uLL:
      transientEditor = self->_transientEditor;
      if (transientEditor)
        return transientEditor;
      v3 = &OBJC_IVAR___NTKCFaceDetailPhotosSectionController__customPhotosEditor;
LABEL_8:
      transientEditor = *(NTKCompanionTransientCustomPhotosEditor **)((char *)&self->super.super.super.super.isa + *v3);
      return transientEditor;
    case 2uLL:
      v3 = &OBJC_IVAR___NTKCFaceDetailPhotosSectionController__memoriesEditor;
      goto LABEL_8;
  }
  return 0;
}

- (BOOL)hasChanges
{
  void *v2;
  BOOL v3;

  -[NTKCFaceDetailPhotosSectionController _currentEditor](self, "_currentEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 2;

  return v3;
}

- (void)saveChangesWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[NTKCFaceDetailPhotosSectionController hasChanges](self, "hasChanges"))
  {
    -[NTKCFaceDetailPhotosSectionController _currentEditor](self, "_currentEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __67__NTKCFaceDetailPhotosSectionController_saveChangesWithCompletion___block_invoke;
      v6[3] = &unk_1E6BD82A8;
      v6[4] = self;
      v7 = v4;
      objc_msgSend(v5, "finalizeWithCompletion:", v6);

    }
    else if (v4)
    {
      v4[2](v4);
    }

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

void __67__NTKCFaceDetailPhotosSectionController_saveChangesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updatePhotosSection");
    objc_msgSend(*(id *)(a1 + 32), "face");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResourceDirectory:", v3);

    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "face");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resourceDirectory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "finalizeWithCompletion: new face resource directory is %@", (uint8_t *)&v9, 0xCu);

    }
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

- (void)customPhotosControllerDidFinish:(id)a3
{
  id v4;

  v4 = a3;
  -[NTKCFaceDetailPhotosSectionController _updatePhotosSection](self, "_updatePhotosSection");
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)albumChooserDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "editor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "albumIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "-[NTKCFaceDetailPhotosSectionController albumChooserDidFinish:] chose asset collection %@", buf, 0xCu);

  }
  objc_msgSend(v4, "editor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "state");

  if (v9 != 1)
  {
    v10 = objc_msgSend(v4, "inGallery");
    objc_msgSend(v4, "editor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63__NTKCFaceDetailPhotosSectionController_albumChooserDidFinish___block_invoke;
      v14[3] = &unk_1E6BCF688;
      v14[4] = self;
      objc_msgSend(v11, "generateGalleryPreviewResourceDirectoryWithCompletion:", v14);
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __63__NTKCFaceDetailPhotosSectionController_albumChooserDidFinish___block_invoke_2;
      v13[3] = &unk_1E6BCF688;
      v13[4] = self;
      objc_msgSend(v11, "finalizeWithCompletion:", v13);
    }

  }
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __63__NTKCFaceDetailPhotosSectionController_albumChooserDidFinish___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "face");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResourceDirectory:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_updatePhotosSection");
}

uint64_t __63__NTKCFaceDetailPhotosSectionController_albumChooserDidFinish___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "face");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResourceDirectory:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_updatePhotosSection");
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (NTKCompanionCustomPhotosEditor)customPhotosEditor
{
  return self->_customPhotosEditor;
}

- (void)setCustomPhotosEditor:(id)a3
{
  objc_storeStrong((id *)&self->_customPhotosEditor, a3);
}

- (NTKCompanionSyncedAlbumEditor)syncedAlbumEditor
{
  return self->_syncedAlbumEditor;
}

- (void)setSyncedAlbumEditor:(id)a3
{
  objc_storeStrong((id *)&self->_syncedAlbumEditor, a3);
}

- (NTKCompanionMemoriesEditor)memoriesEditor
{
  return self->_memoriesEditor;
}

- (void)setMemoriesEditor:(id)a3
{
  objc_storeStrong((id *)&self->_memoriesEditor, a3);
}

- (NTKCompanionTransientCustomPhotosEditor)transientEditor
{
  return self->_transientEditor;
}

- (void)setTransientEditor:(id)a3
{
  objc_storeStrong((id *)&self->_transientEditor, a3);
}

- (NSArray)externalAssets
{
  return self->_externalAssets;
}

- (void)setExternalAssets:(id)a3
{
  objc_storeStrong((id *)&self->_externalAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAssets, 0);
  objc_storeStrong((id *)&self->_transientEditor, 0);
  objc_storeStrong((id *)&self->_memoriesEditor, 0);
  objc_storeStrong((id *)&self->_syncedAlbumEditor, 0);
  objc_storeStrong((id *)&self->_customPhotosEditor, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
}

@end
