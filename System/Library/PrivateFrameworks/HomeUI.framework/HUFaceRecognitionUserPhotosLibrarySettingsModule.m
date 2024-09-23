@implementation HUFaceRecognitionUserPhotosLibrarySettingsModule

- (HUFaceRecognitionUserPhotosLibrarySettingsModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HUFaceRecognitionUserPhotosLibrarySettingsModule *v8;
  HUFaceRecognitionUserPhotosLibrarySettingsModule *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_home, a4);

  return v9;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionUserPhotosLibrarySettingsModule.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionUserPhotosLibrarySettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  -[HUFaceRecognitionUserPhotosLibrarySettingsModule allowPhotosLibraryAccessItemProvider](self, "allowPhotosLibraryAccessItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (!v7)
    goto LABEL_6;
  -[HUFaceRecognitionUserPhotosLibrarySettingsModule photoLibraryAccessNever](self, "photoLibraryAccessNever");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v8) & 1) == 0)
  {
    v9 = objc_msgSend(MEMORY[0x1E0D319D0], "isCloudPhotosOn");

    if ((v9 & 1) != 0)
      goto LABEL_5;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

LABEL_5:
  -[HUFaceRecognitionUserPhotosLibrarySettingsModule _updatePhotosLibrarySettingsForItem:](self, "_updatePhotosLibrarySettingsForItem:", v4);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = (void *)v10;

  return v11;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSSet *v30;
  NSSet *v31;
  uint64_t v33;
  uint64_t v34;
  id (*v35)(uint64_t);
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;

  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    -[HUFaceRecognitionUserPhotosLibrarySettingsModule home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D31840]);
    v9 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke;
    v42[3] = &unk_1E6F4DB68;
    v10 = v6;
    v43 = v10;
    v11 = v7;
    v44 = v11;
    v12 = (void *)objc_msgSend(v8, "initWithResultsBlock:", v42);
    -[HUFaceRecognitionUserPhotosLibrarySettingsModule setPhotoLibraryAccessNever:](self, "setPhotoLibraryAccessNever:", v12);

    v13 = objc_alloc(MEMORY[0x1E0D31840]);
    v39[0] = v9;
    v39[1] = 3221225472;
    v39[2] = __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke_21;
    v39[3] = &unk_1E6F4DB68;
    v14 = v10;
    v40 = v14;
    v15 = v11;
    v41 = v15;
    v16 = (void *)objc_msgSend(v13, "initWithResultsBlock:", v39);
    -[HUFaceRecognitionUserPhotosLibrarySettingsModule setPhotoLibraryAccessOnlyMe:](self, "setPhotoLibraryAccessOnlyMe:", v16);

    v17 = objc_alloc(MEMORY[0x1E0D31840]);
    v33 = v9;
    v34 = 3221225472;
    v35 = __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke_26;
    v36 = &unk_1E6F4DB68;
    v37 = v14;
    v38 = v15;
    v18 = v15;
    v19 = v14;
    v20 = (void *)objc_msgSend(v17, "initWithResultsBlock:", &v33);
    -[HUFaceRecognitionUserPhotosLibrarySettingsModule setPhotoLibraryAccessEveryoneInThisHome:](self, "setPhotoLibraryAccessEveryoneInThisHome:", v20);

    v21 = objc_alloc(MEMORY[0x1E0D31848]);
    v22 = (void *)MEMORY[0x1E0C99E60];
    -[HUFaceRecognitionUserPhotosLibrarySettingsModule photoLibraryAccessNever](self, "photoLibraryAccessNever");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionUserPhotosLibrarySettingsModule photoLibraryAccessOnlyMe](self, "photoLibraryAccessOnlyMe");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionUserPhotosLibrarySettingsModule photoLibraryAccessEveryoneInThisHome](self, "photoLibraryAccessEveryoneInThisHome");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithObjects:", v23, v24, v25, 0, v33, v34, v35, v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v21, "initWithItems:", v26);
    -[HUFaceRecognitionUserPhotosLibrarySettingsModule setAllowPhotosLibraryAccessItemProvider:](self, "setAllowPhotosLibraryAccessItemProvider:", v27);

    v28 = (void *)MEMORY[0x1E0C99E60];
    -[HUFaceRecognitionUserPhotosLibrarySettingsModule allowPhotosLibraryAccessItemProvider](self, "allowPhotosLibraryAccessItemProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithObjects:", v29, 0);
    v30 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v31 = self->_itemProviders;
    self->_itemProviders = v30;

    v3 = self->_itemProviders;
  }
  return v3;
}

id __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photosPersonManagerSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isImportingFromPhotoLibraryEnabled") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "photosPersonManagerSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isSharingFaceClassificationsEnabled") ^ 1;

  }
  v13[0] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = &unk_1E7040AC8;
  v6 = *MEMORY[0x1E0D30D18];
  v13[1] = CFSTR("faceRecognitionPhotosLibrarySettingsKey");
  v13[2] = v6;
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPhotosLibraryAccessNever"), CFSTR("HUFaceRecognitionPhotosLibraryAccessNever"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30DA8];
  v14[2] = v7;
  v14[3] = &unk_1E7040AE0;
  v9 = *MEMORY[0x1E0D30B80];
  v13[3] = v8;
  v13[4] = v9;
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke_21(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photosPersonManagerSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isImportingFromPhotoLibraryEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "photosPersonManagerSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSharingFaceClassificationsEnabled") ^ 1;

  }
  else
  {
    v4 = 0;
  }

  v13[0] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = &unk_1E7040AF8;
  v6 = *MEMORY[0x1E0D30D18];
  v13[1] = CFSTR("faceRecognitionPhotosLibrarySettingsKey");
  v13[2] = v6;
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPhotosLibraryAccessOnlyMe"), CFSTR("HUFaceRecognitionPhotosLibraryAccessOnlyMe"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30DA8];
  v14[2] = v7;
  v14[3] = &unk_1E7040B10;
  v9 = *MEMORY[0x1E0D30B80];
  v13[3] = v8;
  v13[4] = v9;
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke_26(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photosPersonManagerSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isImportingFromPhotoLibraryEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "photosPersonManagerSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSharingFaceClassificationsEnabled");

  }
  else
  {
    v4 = 0;
  }

  v13[0] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = &unk_1E7040B28;
  v6 = *MEMORY[0x1E0D30D18];
  v13[1] = CFSTR("faceRecognitionPhotosLibrarySettingsKey");
  v13[2] = v6;
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPhotosLibraryAccessEveryoneInThisHome"), CFSTR("HUFaceRecognitionPhotosLibraryAccessEveryoneInThisHome"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30DA8];
  v14[2] = v7;
  v14[3] = &unk_1E7040B40;
  v9 = *MEMORY[0x1E0D30B80];
  v13[3] = v8;
  v13[4] = v9;
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUFaceRecognitionAllowPhotosLibraryAccessSectionIdentifier"));
  -[HFItemModule allItems](self, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "itemResultManualSortComparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v9);

  if (!-[HUFaceRecognitionUserPhotosLibrarySettingsModule shouldUseProxCardPresentationStyle](self, "shouldUseProxCardPresentationStyle"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPhotosLibraryAccessHeader"), CFSTR("HUFaceRecognitionPhotosLibraryAccessHeader"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHeaderTitle:", v10);

    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionUsePhotosLibrarySectionFooterPhotosLink"), CFSTR("HUFaceRecognitionUsePhotosLibrarySectionFooterPhotosLink"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_photosLibraryPeopleAlbumURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPhotosLibraryAccessFooter"), CFSTR("HUFaceRecognitionPhotosLibraryAccessFooter"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isCloudPhotosOn") & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPhotosLibraryiCloudOffFooter"), CFSTR("HUFaceRecognitionPhotosLibraryiCloudOffFooter"), 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@\n%@"), v13, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v16;
    }
    objc_msgSend(MEMORY[0x1E0CB3498], "hf_attributedLinkStringForString:linkString:linkURL:", v13, v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedFooterTitle:", v17);

  }
  objc_msgSend(v4, "addObject:", v5);

  return v4;
}

- (id)_updatePhotosLibrarySettingsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("faceRecognitionPhotosLibrarySettingsKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    switch(objc_msgSend(v10, "unsignedIntegerValue"))
    {
      case 1:
        -[HUFaceRecognitionUserPhotosLibrarySettingsModule home](self, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUFaceRecognitionUserPhotosLibrarySettingsModule home](self, "home");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentUser");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v11;
        v15 = v13;
        v16 = 0;
        goto LABEL_7;
      case 2:
        -[HUFaceRecognitionUserPhotosLibrarySettingsModule home](self, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUFaceRecognitionUserPhotosLibrarySettingsModule home](self, "home");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentUser");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v11;
        v15 = v13;
        v16 = 1;
LABEL_7:
        v17 = 0;
        goto LABEL_9;
      case 3:
        -[HUFaceRecognitionUserPhotosLibrarySettingsModule home](self, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUFaceRecognitionUserPhotosLibrarySettingsModule home](self, "home");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentUser");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v11;
        v15 = v13;
        v16 = 1;
        v17 = 1;
LABEL_9:
        objc_msgSend(v14, "hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:", v15, v16, v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }

  }
  return v8;
}

- (BOOL)shouldUseProxCardPresentationStyle
{
  return self->_shouldUseProxCardPresentationStyle;
}

- (void)setShouldUseProxCardPresentationStyle:(BOOL)a3
{
  self->_shouldUseProxCardPresentationStyle = a3;
}

- (HFStaticItem)photoLibraryAccessNever
{
  return self->_photoLibraryAccessNever;
}

- (void)setPhotoLibraryAccessNever:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibraryAccessNever, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFItemProvider)allowPhotosLibraryAccessItemProvider
{
  return self->_allowPhotosLibraryAccessItemProvider;
}

- (void)setAllowPhotosLibraryAccessItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_allowPhotosLibraryAccessItemProvider, a3);
}

- (HFStaticItem)photoLibraryAccessOnlyMe
{
  return self->_photoLibraryAccessOnlyMe;
}

- (void)setPhotoLibraryAccessOnlyMe:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibraryAccessOnlyMe, a3);
}

- (HFStaticItem)photoLibraryAccessEveryoneInThisHome
{
  return self->_photoLibraryAccessEveryoneInThisHome;
}

- (void)setPhotoLibraryAccessEveryoneInThisHome:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibraryAccessEveryoneInThisHome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryAccessEveryoneInThisHome, 0);
  objc_storeStrong((id *)&self->_photoLibraryAccessOnlyMe, 0);
  objc_storeStrong((id *)&self->_allowPhotosLibraryAccessItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_photoLibraryAccessNever, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
