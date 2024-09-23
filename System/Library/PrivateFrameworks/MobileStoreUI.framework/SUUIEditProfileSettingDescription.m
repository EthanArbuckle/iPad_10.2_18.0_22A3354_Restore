@implementation SUUIEditProfileSettingDescription

- (SUUIEditProfileSettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  SUUIEditProfileSettingDescription *v4;
  NSOperationQueue *v5;
  NSOperationQueue *operationQueue;
  SUUISettingValueStore *v7;
  SUUISettingValueStore *valueStore;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIEditProfileSettingDescription;
  v4 = -[SUUISettingDescription initWithViewElement:parent:](&v10, sel_initWithViewElement_parent_, a3, a4);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v4->_operationQueue, "setQualityOfService:", 25);
    v7 = objc_alloc_init(SUUISettingValueStore);
    valueStore = v4->_valueStore;
    v4->_valueStore = v7;

    -[SUUIEditProfileSettingDescription _reloadData](v4, "_reloadData");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)SUUIEditProfileSettingDescription;
  -[SUUIEditProfileSettingDescription dealloc](&v3, sel_dealloc);
}

- (void)chooseNewProfilePhoto
{
  SUUIProfileImagePicker *v3;
  void *v4;
  void *v5;
  SUUIProfileImagePicker *v6;

  v3 = [SUUIProfileImagePicker alloc];
  -[SUUISettingDescription parent](self, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUUIProfileImagePicker initWithClientContext:](v3, "initWithClientContext:", v5);

  -[SUUIProfileImagePicker setDelegate:](v6, "setDelegate:", self);
  -[SUUISettingDescription _presentViewController:animated:completion:](self, "_presentViewController:animated:completion:", v6, 1, 0);

}

- (NSString)handle
{
  void *v2;
  void *v3;

  -[SUUISettingValueStore resolvedValueForKey:](self->_valueStore, "resolvedValueForKey:", CFSTR("handle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[SUUISettingValueStore resolvedValueForKey:](self->_valueStore, "resolvedValueForKey:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (UIImage)photo
{
  void *v2;
  void *v3;
  SUUIStyledImageDataConsumer *v4;
  void *v5;

  -[SUUISettingValueStore resolvedValueForKey:](self->_valueStore, "resolvedValueForKey:", CFSTR("photo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = -[SUUIStyledImageDataConsumer initWithSize:treatment:]([SUUIStyledImageDataConsumer alloc], "initWithSize:treatment:", 10, 56.0, 56.0);
  -[SUUIStyledImageDataConsumer imageForImage:](v4, "imageForImage:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (void)setHandle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUISettingValueStore setModifiedValue:forKey:](self->_valueStore, "setModifiedValue:forKey:", v7, CFSTR("handle"));
  -[SUUIEditProfileSettingDescription _updateValidity](self, "_updateValidity");

}

- (void)setName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUISettingValueStore setModifiedValue:forKey:](self->_valueStore, "setModifiedValue:forKey:", v7, CFSTR("name"));
  -[SUUIEditProfileSettingDescription _updateValidity](self, "_updateValidity");

}

- (void)setPhoto:(id)a3 withCropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  void *v8;
  double y;
  double x;
  CGAffineTransform v11;
  CGSize v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = a3;
  v12.width = width;
  v12.height = height;
  UIGraphicsBeginImageContextWithOptions(v12, 1, 1.0);
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, -1.0, -1.0);
  objc_msgSend(v7, "drawAtPoint:", vaddq_f64(*(float64x2_t *)&v11.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v11.c, y), *(float64x2_t *)&v11.a, x)));

  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[SUUISettingValueStore setModifiedValue:forKey:](self->_valueStore, "setModifiedValue:forKey:", v8, CFSTR("photo"));

}

- (void)profileImagePickerDidCancel:(id)a3
{
  -[SUUISettingDescription _dismissViewController:animated:completion:](self, "_dismissViewController:animated:completion:", a3, 1, 0);
}

- (void)profileImagePicker:(id)a3 didPickProfileImage:(id)a4 withCropRect:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v8 = a5;
  v9 = a4;
  -[SUUISettingDescription _dismissViewController:animated:completion:](self, "_dismissViewController:animated:completion:", a3, 1, 0);
  objc_msgSend(v8, "CGRectValue");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SUUIEditProfileSettingDescription setPhoto:withCropRect:](self, "setPhoto:withCropRect:", v9, v11, v13, v15, v17);
  -[SUUISettingDescription _reloadSetting](self, "_reloadSetting");
}

+ (BOOL)allowsEdit
{
  return 1;
}

- (BOOL)allowsSelection
{
  return 0;
}

- (void)cancelEdits
{
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
}

- (BOOL)commitEdits:(id)a3
{
  void *v4;
  id commitBlock;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  commitBlock = self->_commitBlock;
  self->_commitBlock = v4;

  v6 = -[SUUISettingValueStore hasChanges](self->_valueStore, "hasChanges");
  if (v6)
  {
    -[SUUISettingValueStore modifiedKeys](self->_valueStore, "modifiedKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", CFSTR("photo")))
    {
      -[SUUISettingValueStore resolvedValueForKey:](self->_valueStore, "resolvedValueForKey:", CFSTR("photo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIEditProfileSettingDescription _uploadProfileImage:](self, "_uploadProfileImage:", v8);

    }
    else
    {
      -[SUUIEditProfileSettingDescription _updateAccountInfo](self, "_updateAccountInfo");
    }

  }
  else
  {
    -[SUUIEditProfileSettingDescription _finalizeCommitWithSuccess:error:](self, "_finalizeCommitWithSuccess:error:", 1, 0);
  }
  return v6;
}

- (void)discardEdits
{
  -[SUUISettingValueStore discardChanges](self->_valueStore, "discardChanges");
  -[SUUIEditProfileSettingDescription _leaveEditMode](self, "_leaveEditMode");
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)suggestedHandlesSettingsHeaderFooterDescription:(id)a3 didSelectSuggestedHandle:(id)a4
{
  SUUISettingValueStore *valueStore;
  void *v6;

  valueStore = self->_valueStore;
  v6 = (void *)objc_msgSend(a4, "copy", a3);
  -[SUUISettingValueStore setModifiedValue:forKey:](valueStore, "setModifiedValue:forKey:", v6, CFSTR("handle"));

  -[SUUISettingDescription _reloadSetting](self, "_reloadSetting");
}

- (void)_authenticateOnCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccount:", v5);
    objc_msgSend(v6, "setPromptStyle:", 1);
    objc_msgSend(v6, "setShouldCreateNewSession:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1F28], "contextForSignIn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DB8]), "initWithAuthenticationContext:", v6);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__SUUIEditProfileSettingDescription__authenticateOnCompletion___block_invoke;
  v9[3] = &unk_2511F55B8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "startWithAuthenticateResponseBlock:", v9);

}

void __63__SUUIEditProfileSettingDescription__authenticateOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__SUUIEditProfileSettingDescription__authenticateOnCompletion___block_invoke_2;
  v5[3] = &unk_2511F4C08;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __63__SUUIEditProfileSettingDescription__authenticateOnCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "authenticateResponseType");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 4);
  return result;
}

- (void)_displayFooter:(id)a3
{
  id v4;
  SUUISettingsDescriptionUpdate *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SUUISettingDescription parent](self, "parent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFooterDescription:", v4);

  v5 = -[SUUISettingsDescriptionUpdate initWithUpdateType:]([SUUISettingsDescriptionUpdate alloc], "initWithUpdateType:", 2);
  v6 = objc_msgSend(v8, "index");
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsDescriptionUpdate setIndexSet:](v5, "setIndexSet:", v7);

  objc_msgSend(v8, "dispatchUpdate:", v5);
}

- (void)_displayRules:(BOOL)a3
{
  _BOOL8 v3;
  SUUIHandleRulesSettingsHeaderFooterDescription *v5;
  void *v6;
  void *v7;
  SUUIHandleRulesSettingsHeaderFooterDescription *v8;

  v3 = a3;
  v5 = [SUUIHandleRulesSettingsHeaderFooterDescription alloc];
  -[SUUISettingDescription parent](self, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUIHandleRulesSettingsHeaderFooterDescription initWithClientContext:](v5, "initWithClientContext:", v7);

  -[SUUIHandleRulesSettingsHeaderFooterDescription setShowInvalid:](v8, "setShowInvalid:", v3);
  -[SUUIEditProfileSettingDescription _displayFooter:](self, "_displayFooter:", v8);

}

- (void)_displaySuggestedHandles:(id)a3
{
  id v4;
  SUUISuggestedHandlesSettingsHeaderFooterDescription *v5;
  void *v6;
  void *v7;
  SUUISuggestedHandlesSettingsHeaderFooterDescription *v8;

  self->_suggestedHandlesDisplayed = 1;
  v4 = a3;
  v5 = [SUUISuggestedHandlesSettingsHeaderFooterDescription alloc];
  -[SUUISettingDescription parent](self, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUISuggestedHandlesSettingsHeaderFooterDescription initWithSuggestedHandles:clientContext:delegate:](v5, "initWithSuggestedHandles:clientContext:delegate:", v4, v7, self);

  -[SUUIEditProfileSettingDescription _displayFooter:](self, "_displayFooter:", v8);
}

- (void)_enterEditMode
{
  self->_editing = 1;
  -[SUUIEditProfileSettingDescription _displayRules:](self, "_displayRules:", 0);
  -[SUUIEditProfileSettingDescription _updateValidity](self, "_updateValidity");
  -[SUUISettingDescription _reloadSetting](self, "_reloadSetting");
}

- (void)_fetchAccountInfo
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  +[SUUIMediaSocialProfileCoordinator sharedCoordinator](SUUIMediaSocialProfileCoordinator, "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SUUIEditProfileSettingDescription__fetchAccountInfo__block_invoke;
  v4[3] = &unk_2511FE118;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "getProfileWithOptions:profileBlock:", 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __54__SUUIEditProfileSettingDescription__fetchAccountInfo__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v5 = a2;
  if (a3)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __54__SUUIEditProfileSettingDescription__fetchAccountInfo__block_invoke_2;
    v6[3] = &unk_2511F6220;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    v7 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

    objc_destroyWeak(&v8);
  }

}

void __54__SUUIEditProfileSettingDescription__fetchAccountInfo__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "_valueStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "handle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setOriginalValue:forKey:", v5, CFSTR("handle"));

    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setOriginalValue:forKey:", v7, CFSTR("name"));

    WeakRetained = v8;
  }

}

- (void)_fetchProfilePhoto
{
  void *v3;
  void *v4;
  SUUIMediaSocialLoadProfilePhotoOperation *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, char);
  void *v9;
  id v10;
  id location;

  -[SUUISettingDescription parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SUUIMediaSocialLoadProfilePhotoOperation initWithClientContext:]([SUUIMediaSocialLoadProfilePhotoOperation alloc], "initWithClientContext:", v4);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __55__SUUIEditProfileSettingDescription__fetchProfilePhoto__block_invoke;
  v9 = &unk_2511FE140;
  objc_copyWeak(&v10, &location);
  -[SUUIMediaSocialLoadProfilePhotoOperation setOutputBlock:](v5, "setOutputBlock:", &v6);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __55__SUUIEditProfileSettingDescription__fetchProfilePhoto__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_valueStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((a3 & 1) != 0
      || (objc_msgSend(v8, "originalValueForKey:", CFSTR("photo")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      v11 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v9, "setOriginalValue:forKey:", v11, CFSTR("photo"));

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__SUUIEditProfileSettingDescription__fetchProfilePhoto__block_invoke_2;
      block[3] = &unk_2511F47C0;
      block[4] = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }

  }
}

uint64_t __55__SUUIEditProfileSettingDescription__fetchProfilePhoto__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSetting");
}

- (void)_fetchSuggestedHandles
{
  void *v3;
  void *v4;
  SUUIMediaSocialSuggestedHandlesOperation *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[SUUISettingDescription parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SUUIMediaSocialSuggestedHandlesOperation initWithClientContext:]([SUUIMediaSocialSuggestedHandlesOperation alloc], "initWithClientContext:", v4);
  v6 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[SUUISettingValueStore resolvedValueForKey:](self->_valueStore, "resolvedValueForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISettingValueStore resolvedValueForKey:](self->_valueStore, "resolvedValueForKey:", CFSTR("handle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, 0);

  -[SUUIMediaSocialSuggestedHandlesOperation setWords:](v5, "setWords:", v9);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__SUUIEditProfileSettingDescription__fetchSuggestedHandles__block_invoke;
  v10[3] = &unk_2511F58B8;
  objc_copyWeak(&v11, &location);
  -[SUUIMediaSocialSuggestedHandlesOperation setOutputBlock:](v5, "setOutputBlock:", v10);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __59__SUUIEditProfileSettingDescription__fetchSuggestedHandles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SUUIEditProfileSettingDescription__fetchSuggestedHandles__block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __59__SUUIEditProfileSettingDescription__fetchSuggestedHandles__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 40);
  v4 = WeakRetained;
  objc_msgSend(WeakRetained, "_displaySuggestedHandles:", v3);

}

- (void)_finalizeCommitWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void (**commitBlock)(id, _BOOL8);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  v11 = a4;
  -[SUUISettingValueStore clearValueForKey:](self->_valueStore, "clearValueForKey:", CFSTR("photoUpload"));
  commitBlock = (void (**)(id, _BOOL8))self->_commitBlock;
  if (commitBlock)
  {
    commitBlock[2](commitBlock, v4);
    v7 = self->_commitBlock;
    self->_commitBlock = 0;

  }
  if (v4)
  {
    -[SUUIEditProfileSettingDescription _leaveEditMode](self, "_leaveEditMode");
    -[SUUIEditProfileSettingDescription _reloadData](self, "_reloadData");
LABEL_10:
    v8 = v11;
    goto LABEL_11;
  }
  v8 = v11;
  if (v11)
  {
    objc_msgSend(v11, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("SUUIErrorDomain")))
    {

      goto LABEL_10;
    }
    v10 = objc_msgSend(v11, "code");

    v8 = v11;
    if (v10 == 5)
    {
      -[SUUIEditProfileSettingDescription _fetchSuggestedHandles](self, "_fetchSuggestedHandles");
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)_hideFooter
{
  SUUISettingsDescriptionUpdate *v2;
  uint64_t v3;
  void *v4;
  id v5;

  self->_suggestedHandlesDisplayed = 0;
  -[SUUISettingDescription parent](self, "parent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFooterDescription:", 0);
  v2 = -[SUUISettingsDescriptionUpdate initWithUpdateType:]([SUUISettingsDescriptionUpdate alloc], "initWithUpdateType:", 2);
  v3 = objc_msgSend(v5, "index");
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsDescriptionUpdate setIndexSet:](v2, "setIndexSet:", v4);

  objc_msgSend(v5, "dispatchUpdate:", v2);
}

- (void)_leaveEditMode
{
  self->_editing = 0;
  -[SUUIEditProfileSettingDescription _hideFooter](self, "_hideFooter");
  -[SUUISettingDescription _reloadSetting](self, "_reloadSetting");
}

- (void)_reloadData
{
  -[SUUIEditProfileSettingDescription _fetchAccountInfo](self, "_fetchAccountInfo");
  -[SUUIEditProfileSettingDescription _fetchProfilePhoto](self, "_fetchProfilePhoto");
}

- (void)_updateAccountInfo
{
  SUUIMediaSocialUpdateProfileOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  char v11;
  __CFString **v12;
  char v13;
  int v14;
  __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SUUIEditProfileSettingDescription *val;
  SUUIMediaSocialUpdateProfileOperation *v23;
  _QWORD v24[4];
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = [SUUIMediaSocialUpdateProfileOperation alloc];
  val = self;
  -[SUUISettingDescription parent](self, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SUUIMediaSocialUpdateProfileOperation initWithClientContext:](v3, "initWithClientContext:", v5);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SUUISettingValueStore modifiedKeys](self->_valueStore, "modifiedKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v6);
        v10 = (__CFString *)*(id *)(*((_QWORD *)&v27 + 1) + 8 * v9);
        v11 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("handle"));
        v12 = SUUIMediaSocialUpdateProfileFieldHandle;
        if ((v11 & 1) != 0
          || (v13 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("name")),
              v12 = SUUIMediaSocialUpdateProfileFieldName,
              (v13 & 1) != 0)
          || (v14 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("photoUpload")),
              v12 = &SUUIMediaSocialUpdateProfileFieldProfileImage,
              v14))
        {
          v15 = *v12;

          if (!v15)
            goto LABEL_16;
          -[SUUISettingValueStore resolvedValueForKey:](val->_valueStore, "resolvedValueForKey:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = v16;
            v16 = v17;
            if (objc_msgSend(v17, "isEqualToString:", &stru_2511FF0C8))
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          -[SUUIMediaSocialUpdateProfileOperation setValue:forProfileField:](v23, "setValue:forProfileField:", v16, v15);

        }
        else
        {
          v15 = v10;
        }

LABEL_16:
        ++v9;
      }
      while (v7 != v9);
      v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v7 = v18;
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activeAccount");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMediaSocialUpdateProfileOperation setIdentifier:](v23, "setIdentifier:", v21);

  -[SUUIMediaSocialUpdateProfileOperation setEntityType:](v23, "setEntityType:", CFSTR("user"));
  objc_initWeak(&location, val);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __55__SUUIEditProfileSettingDescription__updateAccountInfo__block_invoke;
  v24[3] = &unk_2511F5770;
  objc_copyWeak(&v25, &location);
  -[SUUIMediaSocialUpdateProfileOperation setOutputBlock:](v23, "setOutputBlock:", v24);
  -[NSOperationQueue addOperation:](val->_operationQueue, "addOperation:", v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __55__SUUIEditProfileSettingDescription__updateAccountInfo__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  _QWORD block[5];

  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2)
  {
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("SUUIErrorDomain")))
    {
      v10 = objc_msgSend(v5, "code");

      if (v10 == 5)
      {
        objc_msgSend(WeakRetained, "_fetchSuggestedHandles");
        objc_msgSend(WeakRetained, "_finalizeCommitWithSuccess:error:", 0, 0);
        goto LABEL_12;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("SUUIErrorDomain")))
    {
      v12 = objc_msgSend(v5, "code");

      if (v12 == 3)
      {
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __55__SUUIEditProfileSettingDescription__updateAccountInfo__block_invoke_3;
        v14[3] = &unk_2511FC828;
        objc_copyWeak(&v15, v6);
        v14[4] = WeakRetained;
        objc_msgSend(WeakRetained, "_authenticateOnCompletion:", v14);
        objc_destroyWeak(&v15);
        goto LABEL_12;
      }
    }
    else
    {

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__SUUIEditProfileSettingDescription__updateAccountInfo__block_invoke_4;
    v13[3] = &unk_2511F47C0;
    v13[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], v13);
    goto LABEL_12;
  }
  +[SUUIMediaSocialProfileCoordinator sharedCoordinator](SUUIMediaSocialProfileCoordinator, "sharedCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reset");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUUIEditProfileSettingDescription__updateAccountInfo__block_invoke_2;
  block[3] = &unk_2511F47C0;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

LABEL_12:
}

uint64_t __55__SUUIEditProfileSettingDescription__updateAccountInfo__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalizeCommitWithSuccess:error:", 1, 0);
}

void __55__SUUIEditProfileSettingDescription__updateAccountInfo__block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_updateAccountInfo");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finalizeCommitWithSuccess:error:", 0, 0);
  }
}

uint64_t __55__SUUIEditProfileSettingDescription__updateAccountInfo__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalizeCommitWithSuccess:error:", 0, 0);
}

- (void)_uploadProfileImage:(id)a3
{
  id v4;
  SUUIMediaSocialSaveProfilePhotoOperation *v5;
  void *v6;
  void *v7;
  SUUIMediaSocialSaveProfilePhotoOperation *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = [SUUIMediaSocialSaveProfilePhotoOperation alloc];
  -[SUUISettingDescription parent](self, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUIMediaSocialSaveProfilePhotoOperation initWithClientContext:](v5, "initWithClientContext:", v7);

  -[SUUIMediaSocialSaveProfilePhotoOperation setPhoto:](v8, "setPhoto:", v4);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__SUUIEditProfileSettingDescription__uploadProfileImage___block_invoke;
  v10[3] = &unk_2511FE168;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v11 = v9;
  -[SUUIMediaSocialSaveProfilePhotoOperation setOutputBlock:](v8, "setOutputBlock:", v10);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __57__SUUIEditProfileSettingDescription__uploadProfileImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5 || v6)
  {
    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("SUUIErrorDomain")))
    {
      v11 = objc_msgSend(v6, "code");

      if (v11 == 3)
      {
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __57__SUUIEditProfileSettingDescription__uploadProfileImage___block_invoke_2;
        v12[3] = &unk_2511F5590;
        objc_copyWeak(&v15, (id *)(a1 + 40));
        v13 = *(id *)(a1 + 32);
        v14 = WeakRetained;
        objc_msgSend(WeakRetained, "_authenticateOnCompletion:", v12);

        objc_destroyWeak(&v15);
      }
    }
    else
    {

    }
  }
  else
  {
    +[SUUIMediaSocialProfileCoordinator sharedCoordinator](SUUIMediaSocialProfileCoordinator, "sharedCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reset");
    objc_msgSend(WeakRetained, "_valueStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setModifiedValue:forKey:", v5, CFSTR("photoUpload"));
    objc_msgSend(WeakRetained, "_updateAccountInfo");

  }
}

void __57__SUUIEditProfileSettingDescription__uploadProfileImage___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_uploadProfileImage:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_finalizeCommitWithSuccess:error:", 0, 0);
  }
}

- (void)_updateValidity
{
  void *v3;
  id v4;

  -[SUUISettingValueStore resolvedValueForKey:](self->_valueStore, "resolvedValueForKey:", CFSTR("name"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUISettingValueStore resolvedValueForKey:](self->_valueStore, "resolvedValueForKey:", CFSTR("handle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISettingDescription _setEditsValid:](self, "_setEditsValid:", -[SUUIEditProfileSettingDescription _validateName:](self, "_validateName:", v4) & -[SUUIEditProfileSettingDescription _validateHandle:](self, "_validateHandle:", v3));

}

- (BOOL)_validateHandle:(id)a3
{
  id v4;
  void *v5;
  NSRegularExpression *v6;
  NSRegularExpression *handleValidation;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "isEqualToString:", &stru_2511FF0C8) & 1) != 0
    || (unint64_t)objc_msgSend(v5, "length") > 0x20)
  {
    v11 = 0;
  }
  else
  {
    if (!self->_handleValidation)
    {
      v6 = (NSRegularExpression *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("[A-Za-z0-9_]+"), 0, 0);
      handleValidation = self->_handleValidation;
      self->_handleValidation = v6;

    }
    v8 = objc_msgSend(v5, "length");
    if (-[NSRegularExpression rangeOfFirstMatchInString:options:range:](self->_handleValidation, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, v8))
    {
      v10 = 0;
    }
    else
    {
      v10 = v8 == v9;
    }
    v11 = v10;
  }
  self->_handleValid = v11;

  return v11;
}

- (BOOL)_validateName:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isEqualToString:", &stru_2511FF0C8) ^ 1;
  else
    return 0;
}

- (id)_valueStore
{
  return self->_valueStore;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isHandleValid
{
  return self->_handleValid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueStore, 0);
  objc_storeStrong((id *)&self->_handleValidation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_commitBlock, 0);
}

@end
