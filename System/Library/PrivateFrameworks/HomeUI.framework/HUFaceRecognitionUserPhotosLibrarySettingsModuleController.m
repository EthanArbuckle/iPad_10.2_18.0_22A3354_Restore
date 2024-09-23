@implementation HUFaceRecognitionUserPhotosLibrarySettingsModuleController

- (HUFaceRecognitionUserPhotosLibrarySettingsModuleController)initWithModule:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModule_host_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionUserPhotosLibrarySettingsModuleController.m"), 23, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionUserPhotosLibrarySettingsModuleController initWithModule:]",
    v6);

  return 0;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsModuleController)initWithModule:(id)a3 host:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUFaceRecognitionUserPhotosLibrarySettingsModuleController *v14;
  HUFaceRecognitionUserPhotosLibrarySettingsModuleController *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v9;
    if (v10)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsModuleController;
  v14 = -[HUItemModuleController initWithModule:](&v17, sel_initWithModule_, v9);
  v15 = v14;
  if (v14)
    -[HUItemModuleController setHost:](v14, "setHost:", v7);

  return v15;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsModuleController;
  -[HUItemModuleController setupCell:forItem:](&v17, sel_setupCell_forItem_, v6, a4);
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "setValueColorFollowsTintColor:", 1);
    objc_msgSend(v9, "setHideIcon:", 1);
  }
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = objc_msgSend(v12, "shouldUseProxCardPresentationStyle");
  if (v13)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v7, "setBackgroundView:", v14);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v15);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsModuleController;
  v7 = a4;
  v8 = a3;
  -[HUItemModuleController updateCell:forItem:animated:](&v12, sel_updateCell_forItem_animated_, v8, v7, v5);
  objc_msgSend(v7, "latestResults", v12.receiver, v12.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "BOOLValue"))
    v11 = 3;
  else
    v11 = 0;
  objc_msgSend(v8, "setAccessoryType:", v11);

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isCloudPhotosOn") & 1) == 0)
  {
    objc_msgSend(v7, "photoLibraryAccessNever");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0CEA2E8];
      _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionTurnOniCloudPhotosAlertTitle"), CFSTR("HUFaceRecognitionTurnOniCloudPhotosAlertTitle"), 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionTurnOniCloudPhotosAlertMessage"), CFSTR("HUFaceRecognitionTurnOniCloudPhotosAlertMessage"), 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v19);

      +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemModuleController host](self, "host");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v21, "moduleController:presentViewControllerForRequest:", self, v20);

      goto LABEL_9;
    }
  }
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[HUItemModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "didSelectItem:", v4);
LABEL_9:

  }
  return 0;
}

@end
